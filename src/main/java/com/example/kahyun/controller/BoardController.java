package com.example.kahyun.controller;

import com.example.kahyun.mapper.BoardMapper;
import com.example.kahyun.mapper.CommentMapper;
import com.example.kahyun.service.BoardService;
import com.example.kahyun.service.LoginService;
import com.example.kahyun.service.UserService;
import com.example.kahyun.vo.BoardVo;
import com.example.kahyun.vo.CommentVo;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequiredArgsConstructor    // final이 붙은 속성을 포함하는 생성자를 자동으로 생성하는 역할
/*@RequestMapping("board/")*/
public class BoardController {

    private final LoginService loginService;
    private final BoardService boardService;
    private final BoardMapper boardMapper;
    private final CommentMapper commentMapper;
    private final UserService userService;
    /*
        스프링 의존성 주입 3가지
        1. @Autowired 속성 : 속성에 @Autowired 어노테이션을 적용하여 객체를 주입
        2. 생성자 : 생성자를 작성하여 객체를 주입
        3. Setter : Setter 메소드를 작성하여 객체를 주입 (메소드에 @Autowired 어노테이션 적용이 필요)
    */

    /* 게시판 리스트 화면 */
    @RequestMapping("/board/list")
    public String BoardList(Model model, BoardVo boardVo) {
        /*  Model 객체 사용
            - Controller에서 생성한 데이터를 담아서 View로 전달할 때 사용하는 객체
            - addAttribute("key", "value") 메소드를 사용하여 전달할 데이터 세팅
        */
        List<BoardVo> list = boardMapper.selectBoard(boardVo);
        model.addAttribute("list", list);
        model.addAttribute("notice_list", boardMapper.selectBoardNotice());
        return "board/list";
    }

    /* 게시글 등록 화면 */
    @RequestMapping("/board/create")
    public String CreateBoard() {
        return "board/create";
    }

    /* 게시글 상세 화면 */
    @GetMapping("/board/detail/{seq}")
    public ModelAndView DetailBoard(BoardVo boardVo, ModelAndView mav) {
        /*
            * Model
                - 메소드에 파라미터로 넣어주고 String 형태로 반환한다.
                - model.addAttribute("변수이름", "값") : 전송할 데이터의 이름과 값 전송
            * ModelAndView
                - ModelAndView 객체를 생성해서 객체 형태로 변환한다.
                - 화면에 출력할 데이터(Model)을 설정할 수 있고, 어떤 화면(View)로 넘어갈지 경로를 설정할 수 있다.
                - Model + View, 값을 넣을 때는 addObject를 사용하고, 값을 보낼 View를 세팅할 때는 setViewName()을 사용
        */
        BoardVo boardDetail = boardMapper.selectBoardBySeq(boardVo);
        List<CommentVo> boardComment = commentMapper.selectBoardComment(boardVo);

        boardService.upView(boardVo);

        mav.addObject("boardComment", boardComment);
        mav.addObject("boardDetail", boardDetail);

        mav.addObject("userDetail", userService.selectUser());
        mav.setViewName("board/detail");

        return mav;
    }


    /* 게시글 등록 ajax */
    @ResponseBody
    @PostMapping("board/create_board")
    public int createBoard(BoardVo boardVo) {
        boardVo.setUser_seq(userService.selectUser().getSeq());
        return boardMapper.createBoard(boardVo);
    }

    /* 게시글 삭제 ajax */
    @ResponseBody
    @PostMapping("board/delete_board")
    public int deleteBoard(String seq) {
        int result = boardMapper.deleteBoard(seq);
        return result;
    }

    /* 게시글 수정 화면 */
    @GetMapping("board/edit/{seq}")
    public String EditBoard(BoardVo boardVo, Model model) {
        model.addAttribute("boardDetail",boardMapper.selectBoardBySeq(boardVo));
        return "board/edit";
    }

    /* 게시글 수정 ajax */
    @ResponseBody
    @PostMapping("board/edit_board")
    public int editBoard(BoardVo boardVo) {
        int result = boardMapper.editBoard(boardVo);
        return result;
    }




}
