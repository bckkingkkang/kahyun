package com.example.kahyun.controller;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
public class MainCrontroller {

    @RequestMapping("/")
    public String HomeTest() {
        return "main";
    }

    @RequestMapping("/hello")
    public String helloTest() {
        return "hello";
    }

}
