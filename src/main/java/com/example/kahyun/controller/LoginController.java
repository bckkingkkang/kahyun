package com.example.kahyun.controller;

import com.example.kahyun.mapper.LoginMapper;
import com.example.kahyun.vo.LoginVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("user/")
public class LoginController {

    private final LoginMapper loginMapper;

    /* 로그인 화면 */
    @RequestMapping("login")
    public String login() {
        return "user/login";
    }

    /* 회원가입 화면 */
    @RequestMapping("signup")
    public String signup() {
        return "user/signup";
    }

    /* 회원가입 완료 화면 */
    @RequestMapping("complete")
    public String complete() {
        return "user/complete";
    }

    /* 계정 찾기 화면 */
    @RequestMapping("search")
    public String search() {
        return "user/search";
    }

    /* 회원가입 ajax */
    @ResponseBody
    @PostMapping("signup_ajax")
    public int create_ajax(LoginVo loginVo) {
        // 비밀번호
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        loginVo.setPassword(bCryptPasswordEncoder.encode(loginVo.getPassword()));

        int result = loginMapper.createUser(loginVo);
        return result;
    }

    /* 아이디 찾기 버튼 ajax */
    @ResponseBody
    @PostMapping("search_id_ajax")
    public String search_id_ajax(LoginVo loginVo) {
        String result = loginMapper.searchId(loginVo);
        // 검색 결과가 없는 경우 null
        if("null".equals(result)) {
            result = "";
        }
        return result;
    }

    /* 아이디 중복 체크 버튼 ajax */
    @ResponseBody
    @PostMapping("check_id_ajax")
    public int check_id_ajax(LoginVo loginVo) {
        int count = loginMapper.checkId(loginVo);
        return count;
    }



}
