package com.example.kahyun.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
public class CashController {

    @RequestMapping("cash/charge")
    public String list() {
        return "cash/charge";
    }
}
