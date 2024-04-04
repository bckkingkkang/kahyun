package com.example.kahyun.controller;

import com.example.kahyun.mapper.BoardMapper;
import com.example.kahyun.mapper.CommentMapper;
import com.example.kahyun.service.BoardService;
import com.example.kahyun.service.FileService;
import com.example.kahyun.service.UserService;
import com.example.kahyun.utils.FileUtils;
import com.example.kahyun.vo.BoardVo;
import com.example.kahyun.vo.CommentVo;
import com.example.kahyun.vo.FileVo;
import com.example.kahyun.vo.LoginVo;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequiredArgsConstructor    // final이 붙은 속성을 포함하는 생성자를 자동으로 생성하는 역할
@RequestMapping("board/")
public class BoardController {

    @Autowired
    private UserService userService;

    @Autowired
    private BoardService boardService;

    private final FileService fileService;

    private final FileUtils fileUtils;

    /*
        스프링 의존성 주입 3가지
        1. @Autowired 속성 : 속성에 @Autowired 어노테이션을 적용하여 객체를 주입
        2. 생성자 : 생성자를 작성하여 객체를 주입
        3. Setter : Setter 메소드를 작성하여 객체를 주입 (메소드에 @Autowired 어노테이션 적용이 필요)
    */

    private final BoardMapper boardMapper;
    private final CommentMapper commentMapper;

    /* 게시판 화면 */
    @RequestMapping("list")
    public String list() {
        return "board/list";
    }

    /* 게시글 리스트 */
    @GetMapping("list")
    public String getBoardList(Model model, BoardVo boardVo) {
        /*  Model 객체 사용
            - Controller에서 생성한 데이터를 담아서 View로 전달할 때 사용하는 객체
            - addAttribute("key", "value") 메소드를 사용하여 전달할 데이터 세팅
        */
        List<BoardVo> list = boardMapper.getBoardList(boardVo);
        model.addAttribute("list", list);
        System.out.println(SecurityContextHolder.getContext().getAuthentication().getAuthorities());
        return "board/list";
    }

    /* 게시글 작성 화면 */
    @RequestMapping("create")
    public String createBoardList() {
        return "board/create";
    }

    /* 게시글 상세 화면 */
    @GetMapping("detail/{seq}")
    public ModelAndView getBoard(BoardVo boardVo, ModelAndView mav) {
        /*
            * Model
                - 메소드에 파라미터로 넣어주고 String 형태로 반환한다.
                - model.addAttribute("변수이름", "값") : 전송할 데이터의 이름과 값 전송
            * ModelAndView
                - ModelAndView 객체를 생성해서 객체 형태로 변환한다.
                - 화면에 출력할 데이터(Model)을 설정할 수 있고, 어떤 화면(View)로 넘어갈지 경로를 설정할 수 있다.
                - Model + View, 값을 넣을 때는 addObject를 사용하고, 값을 보낼 View를 세팅할 때는 setViewName()을 사용
        */
        BoardVo boardDetail = boardMapper.getBoardDetail(boardVo);
        List<CommentVo> boardComment = commentMapper.getComment(boardVo);
        String user_id = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        LoginVo user = userService.selectUser(user_id);

        boardService.upView(boardVo);

        mav.addObject("boardComment", boardComment);
        mav.addObject("boardDetail", boardDetail);

        mav.addObject("userDetail", user);
        mav.setViewName("board/detail");

        return mav;
    }

    /* 댓글 등록 ajax */
    @ResponseBody
    @PostMapping("detail/create_comment_ajax")
    public int create_comment_ajax(CommentVo commentVo) {
        String user_id = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        LoginVo loginVo = userService.selectUser(user_id);
        /* security 설정 후 변경 */
        commentVo.setNickname(loginVo.getNickname());
        commentVo.setUser_seq(loginVo.getSeq());
        int result = commentMapper.createComment(commentVo);
        return result;
    }

    /* 게시글 저장 ajax */
    @ResponseBody
    @PostMapping("create_board_ajax")
    public int create_board_ajax(BoardVo boardVo) {
        String user_id = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        LoginVo loginVo = userService.selectUser(user_id);

        /* security 설정 후 변경 */
        boardVo.setNickname(loginVo.getNickname());
        boardVo.setUser_seq(loginVo.getSeq());
        return boardMapper.createBoard(boardVo);
    }
    @PostMapping("create")
    public void saveFile(final BoardVo boardVo) {
        List<FileVo> files = fileUtils.uploadFiles(boardVo.getFiles());
        fileService.saveFiles(boardVo.getSeq(), files);
    }

    /* 게시글 삭제 ajax */
    @ResponseBody
    @PostMapping("detail/delete_board_ajax")
    public int delete_board_ajax(BoardVo boardVo) {
        int result = boardMapper.deleteBoard(boardVo);
        return result;
    }




}
