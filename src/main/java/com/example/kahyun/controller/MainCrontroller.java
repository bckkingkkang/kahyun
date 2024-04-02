package com.example.kahyun.controller;

import com.example.kahyun.service.UserService;
import com.example.kahyun.vo.LoginVo;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
public class MainCrontroller {

    @Autowired
    private UserService userService;

    @RequestMapping("/")
    public String HomeTest(Model model) {
        String user_id = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        LoginVo loginVo = userService.selectUser(user_id);
        model.addAttribute("user", loginVo);
        System.out.println(SecurityContextHolder.getContext());
        System.out.println(loginVo);
        return "main";
    }

    @RequestMapping("/hello")
    public String helloTest() {
        return "hello";
    }

}
