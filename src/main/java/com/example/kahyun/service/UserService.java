package com.example.kahyun.service;

import com.example.kahyun.mapper.UserMapper;
import com.example.kahyun.vo.LoginVo;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {
    private final UserMapper userMapper;

    public LoginVo selectUser() {
        return userMapper.userInfoList((String) SecurityContextHolder.getContext().getAuthentication().getPrincipal());
    }


}
