package com.kh.app0724.board.service;

import com.kh.app0724.board.mapper.BoardMapper;
import com.kh.app0724.board.vo.BoardVo;
import com.kh.app0724.board.vo.CategoryVo;
import com.kh.app0724.board.vo.PageVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
public class BoardService {
    private final BoardMapper mapper;

    public int insert(BoardVo vo) {
        return mapper.insert(vo);
    }

    public List<BoardVo> selectList(PageVo pvo) {
        return mapper.selectList(pvo);
    }

    public BoardVo selectOneByNo(String no) {
        return mapper.selectOneByNo(no);
    }

    public List<CategoryVo> selectCategory() {
        return mapper.selectCategory();
    }

    public int update(BoardVo vo) {
        return mapper.update(vo);
    }

    public int delete(BoardVo vo) {
        return mapper.delete(vo);
    }

    public int boardCount() {
        return mapper.boardCount();
    }
}
