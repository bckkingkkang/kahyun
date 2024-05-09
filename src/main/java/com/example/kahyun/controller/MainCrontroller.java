package com.example.kahyun.controller;

import com.example.kahyun.mapper.SBoardMapper;
import com.example.kahyun.service.SpecialBoardService;
import com.example.kahyun.service.UserService;
import com.example.kahyun.vo.LoginVo;
import com.example.kahyun.vo.SpecialBoardVo;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class MainCrontroller {

    @Autowired
    private UserService userService;

    private final SBoardMapper sboardMapper;

    @RequestMapping("/")
    public ModelAndView Test(ModelAndView model) {
        List<SpecialBoardVo> getMainSpecialBoardByDownload = sboardMapper.getMainSpecialBoardByDownload();
        model.addObject("getMainSpecialBoardByDownload",getMainSpecialBoardByDownload);

        List<SpecialBoardVo> getMainSpecialBoardByCreate = sboardMapper.getMainSpecialBoardByCreate();
        model.addObject("getMainSpecialBoardByCreate",getMainSpecialBoardByCreate);

        model.setViewName("main");

        return model;
    }

    @RequestMapping("/main")
    public ModelAndView HomeTest(ModelAndView model) {
        String user_id = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        LoginVo loginVo = userService.selectUser(user_id);
        model.addObject("user", loginVo);
        String isLogin;
        if(loginVo != null) {
            isLogin = "true";
        } else {
            isLogin = "false";
        }
        model.addObject("isLogin",isLogin);

        List<SpecialBoardVo> getMainSpecialBoardByDownload = sboardMapper.getMainSpecialBoardByDownload();
        model.addObject("getMainSpecialBoardByDownload",getMainSpecialBoardByDownload);

        List<SpecialBoardVo> getMainSpecialBoardByCreate = sboardMapper.getMainSpecialBoardByCreate();
        model.addObject("getMainSpecialBoardByCreate",getMainSpecialBoardByCreate);

        model.setViewName("main");

        return model;
    }

    @RequestMapping("/header/header")
    public String header(Model model) {
        /*LoginVo loginVo = userService.selectUser((String) SecurityContextHolder.getContext().getAuthentication().getPrincipal());
        model.addAttribute("user", loginVo);
        String isLogin;
        if(loginVo != null) {
            isLogin = "true";
        } else {
            isLogin = "false";
        }
        model.addAttribute("isLogin",isLogin);*/
        return "header/header";
    }
    @RequestMapping("/header/footer")
    public String footer(Model model) {
        /*LoginVo loginVo = userService.selectUser((String) SecurityContextHolder.getContext().getAuthentication().getPrincipal());
        model.addAttribute("user", loginVo);
        String isLogin;
        if(loginVo != null) {
            isLogin = "true";
        } else {
            isLogin = "false";
        }
        model.addAttribute("isLogin",isLogin);*/
        return "header/footer";
    }


}
