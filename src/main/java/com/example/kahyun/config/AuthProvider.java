package com.example.kahyun.config;

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

    /*
        Spring Security의 인증 방식 : Credential 기반 인증 : 사용자명과 비밀번호를 이용한 방식
        - principal : 아이디
        - credential : 비밀번호
    */

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        // UserDetailsService의 loadByUsername 을 이용하지 않고 DB의 user 정보를 가져옴
        // login.jsp 페이지에서 로그인 버튼을 눌렀을 때 POST로 전송되는 user_id, password를 이용하여 사용자 인증
        String user_id = (String) authentication.getPrincipal();
        String password = (String) authentication.getCredentials();

        PasswordEncoder passwordEncoder = userService.passwordEncoder();
        UsernamePasswordAuthenticationToken token;

        /* 입력받은 user_id로 회원 정보 SELECT */
        LoginVo loginVo = userService.selectUser(user_id);

        /* 조회된 회원정보가 있고 비밀번호가 matches  */
        if(loginVo != null && passwordEncoder.matches(password, loginVo.getPassword())) {
            List<GrantedAuthority> roles = new ArrayList<>();

            /* users 권한이 ADMIN인 경우 SYS_ADMIN 권한 부여 */
            if(loginVo.getAuth().equals("ADMIN")) {
                roles.add(new SimpleGrantedAuthority("SYS_ADMIN"));
            } else if(loginVo.getAuth().equals("VIP")) {
                roles.add(new SimpleGrantedAuthority("VIP"));
            } else if(loginVo.getAuth().equals("USER")){
                roles.add(new SimpleGrantedAuthority("NOR_ADMIN"));
            } else {
                roles.add(new SimpleGrantedAuthority("ANONYMOUS"));
            }

            // 인증된 user 정보를 담아 SecurityContextHolder에 저장되는 token
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
