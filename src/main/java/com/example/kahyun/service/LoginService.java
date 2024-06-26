package com.example.kahyun.service;

import com.example.kahyun.mapper.LoginMapper;
import com.example.kahyun.vo.LoginVo;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class LoginService {

    private final LoginMapper loginMapper;
    private final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    public PasswordEncoder passwordEncoder() {
        return this.passwordEncoder;
    }

    public LoginVo selectUser(String user_id) {
        return loginMapper.selectUser(user_id);
    }
}
