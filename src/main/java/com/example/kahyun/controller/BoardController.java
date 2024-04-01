package com.example.kahyun.controller;

import com.example.kahyun.mapper.BoardMapper;
import com.example.kahyun.vo.BoardVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequiredArgsConstructor    // final이 붙은 속성을 포함하는 생성자를 자동으로 생성하는 역할
@RequestMapping("board/")
public class BoardController {

    /*
        스프링 의존성 주입 3가지
        1. @Autowired 속성 : 속성에 @Autowired 어노테이션을 적용하여 객체를 주입
        2. 생성자 : 생성자를 작성하여 객체를 주입
        3. Setter : Setter 메소드를 작성하여 객체를 주입 (메소드에 @Autowired 어노테이션 적용이 필요)
    */

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

    /* 게시글 상세 화면 */
    @RequestMapping("detail/{seq}")
    public ModelAndView getBoard(BoardVo boardVo, ModelAndView mav) {
        BoardVo boardDetail = boardMapper.getBoardDetail(boardVo);
        mav.setViewName("board/detail");
        mav.addObject("boardDetail", boardDetail);
        return mav;
    }




}
