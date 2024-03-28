package com.example.kahyun.controller;

import com.example.kahyun.mapper.BoardMapper;
import com.example.kahyun.vo.BoardVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("board/")
public class BoardController {

    private final BoardMapper boardMapper;

    /* 게시판 화면 */
    @RequestMapping("list")
    public String list() {
        return "board/list";
    }

    /* 게시글 리스트 */
    @GetMapping("list")
    public String getBoardList(Model model, BoardVo boardVo) {
        List<BoardVo> list = boardMapper.getBoardList(boardVo);
        model.addAttribute("list", list);
        return "board/list";
    }

    /* 게시글 작성 화면 */
    @RequestMapping("create")
    public String createBoardList() {
        return "board/create";
    }


}
