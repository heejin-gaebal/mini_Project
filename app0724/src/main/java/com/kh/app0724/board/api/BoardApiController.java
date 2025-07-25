package com.kh.app0724.board.api;

import com.kh.app0724.board.service.BoardService;
import com.kh.app0724.board.vo.BoardVo;
import com.kh.app0724.board.vo.CategoryVo;
import com.kh.app0724.board.vo.PageVo;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("api/board")
@RequiredArgsConstructor
@CrossOrigin(value = "http://192.168.20.206:5500")
//@CrossOrigin(value = "http://192.168.0.11:5500/")
public class BoardApiController {
    private final BoardService service;

    //insert
    @PostMapping
    public ResponseEntity<Integer> insert(@RequestBody BoardVo vo){
        int result = service.insert(vo);
        return ResponseEntity.ok().body(result);
    }

    //selectList
    @GetMapping("page/{currentPage}")
    public ResponseEntity<Map<String, Object>> selectList(@PathVariable int currentPage){
        int listCount = service.boardCount();
        int pageLimit = 5;
        int boardLimit = 5;
        PageVo pvo = new PageVo(listCount, currentPage, pageLimit, boardLimit);
        List<BoardVo> voList = service.selectList(pvo);

        Map<String, Object> map = new HashMap<>();
        map.put("voList", voList);
        map.put("boardCount", listCount);
        map.put("pvo", pvo);
        return ResponseEntity.ok().body(map);
    }

    //selectOneByNo
    @GetMapping("{no}")
    public ResponseEntity<BoardVo> selectOneByNo(@PathVariable String no){
        BoardVo vo = service.selectOneByNo(no);
        return ResponseEntity.ok().body(vo);
    }

    //category
    @GetMapping("category")
    public ResponseEntity<List<CategoryVo>> selectCategory(){
        List<CategoryVo> catgryVoList = service.selectCategory();
        return ResponseEntity.ok().body(catgryVoList);
    }

    //update
    @PutMapping
    public ResponseEntity<Integer> update(@RequestBody BoardVo vo){
        int result = service.update(vo);
        return ResponseEntity.ok().body(result);
    }

    //delete
    @DeleteMapping
    public ResponseEntity<Integer> delete(@RequestBody BoardVo vo){
        int result = service.delete(vo);
        return ResponseEntity.ok().body(result);
    }
}
