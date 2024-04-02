package com.example.kahyun.service;

import com.example.kahyun.mapper.CommentMapper;
import com.example.kahyun.vo.CommentVo;
import org.springframework.stereotype.Service;

@Service
public class CommentService {

    private final CommentMapper commentMapper;

    public CommentService(CommentMapper commentMapper) {
        this.commentMapper = commentMapper;
    }

    public int create_comment(CommentVo commentVo) {
        /* security 설정 후 변경 */
        commentVo.setNickname("가현");
        commentVo.setUser_seq("5");
        int result = commentMapper.createComment(commentVo);
        return result;
    }
}
