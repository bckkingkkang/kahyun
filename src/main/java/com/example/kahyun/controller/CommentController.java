package com.example.kahyun.controller;

import com.example.kahyun.mapper.CommentMapper;
import com.example.kahyun.vo.CommentVo;
import com.example.kahyun.vo.LoginVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequiredArgsConstructor
public class CommentController {

    private final CommentMapper commentMapper;

}
