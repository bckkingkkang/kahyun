package com.example.kahyun.config;

import com.example.kahyun.mapper.LoginMapper;
import com.example.kahyun.service.UserService;
import com.example.kahyun.vo.LoginVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class AuthProvider implements AuthenticationProvider {
    @Autowired
    private UserService userService;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        // UserDetailsService의 loadByUsernam 을 이용하지 않고 DB의 user 정보를 가져옴
        // 로그인 버튼을 눌렀을 때 POST로 전송되는 user_id, password를 이용하여 사용자 인증
        String user_id = (String) authentication.getPrincipal();
        String password = (String) authentication.getCredentials();

        PasswordEncoder passwordEncoder = userService.passwordEncoder();
        UsernamePasswordAuthenticationToken token;
        LoginVo loginVo = userService.selectUser(user_id);

        if(loginVo != null && passwordEncoder.matches(password, loginVo.getPassword())) {
            List<GrantedAuthority> roles = new ArrayList<>();

            if(loginVo.getAuth().equals("ADMIN")) {
                roles.add(new SimpleGrantedAuthority("SYS_ADMIN"));
            } else {
                roles.add(new SimpleGrantedAuthority("NOR_ADMIN"));
            }

            token = new UsernamePasswordAuthenticationToken(loginVo.getUser_id(), null, roles);

            return token;
        }

        throw new BadCredentialsException("아이디나 비밀번호가 잘못됐음");
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return true;
    }
}
