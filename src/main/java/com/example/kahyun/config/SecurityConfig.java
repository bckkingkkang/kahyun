package com.example.kahyun.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@EnableWebSecurity  // 모든 URL 요청이 스프링 시큐리티의 제어를 받는다.
@Configuration
public class SecurityConfig {

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    /*
        인증(Authenticate) : 보호된 리소스에 접근한 대상에 대해 이 유저가 누구인지, 애플리케이션의 작업을 수행해도 되는 주체인지 확인하는 과정 (로그인)
        권한(Authorize) : 인증된 사용자가 어떤 것을 할 수 있는지를 의미

        Authentication은 접근하는 주체의 정보와 권한을 담은 인터페이스로 SecurityContext에 저장된다.
        SecurityContext : Authentication을 보관하며 해당 객체를 꺼내올 수 있다.
        SecurityContextHolder : 보안 주체의 세부 정보를 포함하며, 현재 SecurityContext에 대한 세부 정보가 저장된다.

        username과 password를 통해 UsernamePasswordAuthenticationToken을 생성
        -> 생성된 토큰의 검증을 위해 AuthenticationManager의 인스턴스로 전달
        -> 인증에 성공하면 Authentication 인스턴스를 리턴하고 SecurityContextHolder에 저장
    */

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                /*
                    csrf(cross site request forgery)
                    : 웹 사이트 취약점 공격 방지를 위해 사용
                     스프링 시큐리티가 CSRF 토큰 값을 세션을 통해 발행하고 웹 페이지에서는 폼 전송 시에 해당 토큰을 함께
                     전송하여 실제 웹 페이지에서 작성된 데이터가 전달되는지를 검증하는 기술이다.
                */
                .csrf(csrf->csrf.disable())

                /* HttpServletRequest를 사용하는 요청들에 대한 접근 설정 */
                .authorizeHttpRequests(requests->requests
                        .requestMatchers("/**").permitAll()
                        .anyRequest().authenticated()
                )
        /*
                .formLogin(login->login.loginPage("user/login").permitAll())*/
                ;


        return http.build();
    }
}
