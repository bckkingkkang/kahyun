package com.example.kahyun.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("special_board/")
public class SpecialBoardController {

    /* 게시판 화면 */
    @RequestMapping("list")
    public String list() {

        return "special_board/list";
    }
}