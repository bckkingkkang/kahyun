package com.example.kahyun.controller;

import com.example.kahyun.mapper.CommentMapper;
import com.example.kahyun.service.LoginService;
import com.example.kahyun.service.UserService;
import com.example.kahyun.vo.CommentVo;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequiredArgsConstructor
public class CommentController {

    private final CommentMapper commentMapper;
    private final UserService userService;

    /* 회원게시판 댓글 등록 ajax */
    @ResponseBody
    @PostMapping("board/create_comment")
    public int createBoardComment(CommentVo commentVo) {
        commentVo.setUser_seq(userService.selectUser().getSeq());
        int result = commentMapper.createBoardComment(commentVo);
        return result;
    }

    /* 회원게시판 댓글 수정 */
    @ResponseBody
    @PostMapping("board/edit_comment")
    public int editBoardComment(CommentVo commentVo) {
        int result = commentMapper.editBoardComment(commentVo);
        return result;
    }

    /* 회원게시판 댓글 삭제 */
    @ResponseBody
    @PostMapping("board/delete_comment")
    public int deleteBoardComment(CommentVo commentVo) {
        int result = commentMapper.deleteBoardComment(commentVo);
        return result;
    }

}
