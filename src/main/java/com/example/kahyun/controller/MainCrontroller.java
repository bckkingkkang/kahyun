package com.example.kahyun.controller;

import com.example.kahyun.mapper.FileBoardMapper;
import com.example.kahyun.service.UserService;
import com.example.kahyun.vo.LoginVo;
import com.example.kahyun.vo.FileBoardVo;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class MainCrontroller {

    @Autowired
    private UserService userService;

    private final FileBoardMapper fileBoardMapper;

    @RequestMapping("/")
    public ModelAndView Test(ModelAndView model) {

        List<FileBoardVo> getMainFileBoardByDownload = fileBoardMapper.getMainFileBoardByDownload();
        model.addObject("getMainFileBoardByDownload",getMainFileBoardByDownload);

        List<FileBoardVo> getMainFileBoardByCreate = fileBoardMapper.getMainFileBoardByCreate();
        model.addObject("getMainFileBoardByCreate",getMainFileBoardByCreate);

        model.setViewName("main");

        return model;
    }

    @RequestMapping("/main")
    public ModelAndView HomeTest(ModelAndView model) {
       /* String user_id = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        LoginVo loginVo = userService.selectUser(user_id);
        model.addObject("user", loginVo);
        String isLogin;
        if(loginVo != null) {
            isLogin = "true";
        } else {
            isLogin = "false";
        }
        model.addObject("isLogin",isLogin);*/

        List<FileBoardVo> getMainFileBoardByDownload = fileBoardMapper.getMainFileBoardByDownload();
        model.addObject("getMainFileBoardByDownload",getMainFileBoardByDownload);

        List<FileBoardVo> getMainFileBoardByCreate = fileBoardMapper.getMainFileBoardByCreate();
        model.addObject("getMainFileBoardByCreate",getMainFileBoardByCreate);

        model.setViewName("main");

        return model;
    }

    @RequestMapping("/header/header")
    public ModelAndView header(ModelAndView mav) {
        /*LoginVo loginVo = userService.selectUser((String) SecurityContextHolder.getContext().getAuthentication().getPrincipal());
        model.addAttribute("user", loginVo);
        String isLogin;
        if(loginVo != null) {
            isLogin = "true";
        } else {
            isLogin = "false";
        }

        model.addAttribute("isLogin",isLogin);*/
        String user_id = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        LoginVo loginVo = userService.selectUser(user_id);
        mav.addObject("user", loginVo);
        String isLogin;
        if(loginVo != null) {
            isLogin = "true";
        } else {
            isLogin = "false";
        }
        mav.addObject("isLogin",isLogin);
        mav.setViewName("header/header");
        return mav;
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
