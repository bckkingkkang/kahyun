package com.example.kahyun.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("login/")
public class LoginController {

    /* 로그인 화면 */
    @RequestMapping("login")
    public String login() {
        return "login/login";
    }

    /* 회원가입 화면 */
    @RequestMapping("signup")
    public String signup() {
        return "login/signup";
    }


}
