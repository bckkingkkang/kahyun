package com.example.kahyun.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
public class AdminController {

    @RequestMapping("admin/admin")
    public String helloTest() {
        return "admin/admin";
    }
}

