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
        /*
            비밀번호 암호화
            ( BCrypt : 단방향 암호화를 위해 만들어진 해시 함수,
            salt를 부여하여 여러 번 해싱 -> 같은 비밀번호를 암호화하더라도 해시 값은 매번 다른 값이 도출된다.)

            해싱(Hash) : 각 사용자의 일반 텍스트 암호를 가져와 단반향 수학 함수를 통해 암호화를 실행하는 것
            솔트(salt) : 해시함수를 돌리기 전에 원문에 임의의 문자열을 덧붙이는 것

            사용자 비밀번호 -> salt 생성 -> Hashing -> 암호화된 비밀번호 DB에 저장
        */
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
