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
        인증(Authenticate) : 로그인
        권한(Authorize) : 인증된 사용자가 어떤 것을 할 수 있는지를 의미
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
                /*.csrf(AbstractHttpConfigurer::disable)*/
                .csrf(AbstractHttpConfigurer::disable)

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
