package com.kh.app0724.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("board")
public class BoardController {
    //list
    @GetMapping("page/*")
    public String list(){
        return "board/page";
    }
}
