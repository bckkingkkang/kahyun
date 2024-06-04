package com.example.kahyun.controller;

import com.example.kahyun.mapper.LoginMapper;
import com.example.kahyun.mapper.UserMapper;
import com.example.kahyun.service.LoginService;
import com.example.kahyun.service.UserService;
import com.example.kahyun.vo.LoginVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequiredArgsConstructor
public class UserController {

    private final LoginService loginService;
    private final UserService userService;
    private final UserMapper userMapper;

    /* 마이페이지 */
    @RequestMapping("user/mypage")
    public ModelAndView MyPage(ModelAndView mav) {
        // 내 정보
        mav.addObject("userInfo", userService.selectUser());
        // 충전 내역
        mav.addObject("charge_cash_list", userMapper.chargeCashList(userService.selectUser().getSeq()));
        // 사용 내역

        mav.setViewName("user/mypage");
        return mav;
    }

    /* 내 정보 수정 화면 */
    @RequestMapping("user/edit")
    public ModelAndView UserInfoEdit(ModelAndView mav) {
        mav.addObject("userInfo"
                ,userService.selectUser());

        return mav;
    }

    /* 정보 수정하기 > 닉네임 수정 */
    @ResponseBody
    @PostMapping("user/edit_user_info")
    public int editUserInfo(LoginVo loginVo) {
        loginVo.setSeq(userService.selectUser().getSeq());
        return userMapper.editUserInfo(loginVo);
    }

}


