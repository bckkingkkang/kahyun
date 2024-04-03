package com.example.kahyun.config;

import com.example.kahyun.handler.AccessDeniedHandler;
import com.example.kahyun.handler.AuthenticationEntryPoint;
import com.example.kahyun.handler.FailureHandler;
import com.example.kahyun.handler.SuccessHandler;
import jakarta.servlet.DispatcherType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.header.writers.XXssProtectionHeaderWriter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.web.method.HandlerMethod;

@EnableWebSecurity  // 모든 URL 요청이 스프링 시큐리티의 제어를 받는다.
@Configuration
public class SecurityConfig {

    @Autowired
    private FailureHandler failureHandler;

    @Autowired
    private AccessDeniedHandler accessDeniedHandler;

    @Autowired
    private AuthenticationEntryPoint authenticationEntryPoint;

    @Autowired
    private SuccessHandler successHandler;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    /*
        인증(Authenticate) : 보호된 리소스에 접근한 대상에 대해 이 유저가 누구인지, 애플리케이션의 작업을 수행해도 되는 주체인지 확인하는 과정 (로그인)
        권한(Authorize) : 인증된 사용자가 어떤 것을 할 수 있는지를 의미
        인가(Authorization) : 인증된 사용자가 요청된 자원에 접근가능한지를 결정하는 절차

        Authentication은 접근하는 주체의 정보와 권한을 담은 인터페이스로 SecurityContext에 저장된다.
        SecurityContext : Authentication을 보관하며 해당 객체를 꺼내올 수 있다.
        SecurityContextHolder : 보안 주체의 세부 정보를 포함하며, 현재 SecurityContext에 대한 세부 정보가 저장된다.

        username과 password를 통해 UsernamePasswordAuthenticationToken을 생성
        -> 생성된 토큰의 검증을 위해 AuthenticationManager의 인스턴스로 전달
        -> 인증에 성공하면 Authentication 인스턴스를 리턴하고 SecurityContextHolder에 저장
    */


    @Bean
    public WebSecurityCustomizer webSecurityCustomizer() {
    /*
        정적 자원에 대해서 인증을 하지 않도록 설정 (resources에 접근)
        permitAll은 필터를 거치지만 ignore()은 필터를 거치지 않는다.
    */
        return(web) -> web.ignoring()
                .requestMatchers(PathRequest.toStaticResources().atCommonLocations());
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                /*
                    csrf(cross site request forgery)
                    : 웹 사이트 취약점 공격 방지를 위해 사용
                     스프링 시큐리티가 CSRF 토큰 값을 세션을 통해 발행하고 웹 페이지에서는 폼 전송 시에 해당 토큰을 함께
                     전송하여 실제 웹 페이지에서 작성된 데이터가 전달되는지를 검증하는 기술이다.

                     CSRF Token을 설정해주지 않으면 jsp에서 보내는 POST 요청을 전부 막는다. (로그인, 회원가입 기능 동작하지 않음 -> 인증 과정 진행 불가)
                    -> JSP에서 POST 요청을 보낼 때 CSRF Token에 값을 넣어 함께 보내고 Spring security가 token 값을 확인하여 CSRF 공격 판단
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                */
                .csrf(csrf -> csrf.disable())   // 로컬에서 확인을 위해 csrf 비활성화

                // 403 -> alert 표시, 메인으로 이동
                .exceptionHandling(handler->handler.accessDeniedHandler(accessDeniedHandler))

                // 401 -> alert 표시, 메인으로 이동
                .exceptionHandling(handler->handler.authenticationEntryPoint(authenticationEntryPoint))

                /* HttpServletRequest를 사용하는 요청들에 대한 접근 설정 */
                .authorizeHttpRequests(requests -> requests
                        .dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
                        .requestMatchers(
                                new AntPathRequestMatcher("/"),
                                /*new AntPathRequestMatcher("/user/signup"),*/
                                /* 로그인, 회원가입 관련 페이지는 로그인 없이 접근 /user/** */
                                new AntPathRequestMatcher("/user/**")
                        ).permitAll()
                        /*  hasAuthority : 특정 권한을 가지고 있는 경우에만 접근 허가
                            hasAuthority : 에러 권한 중 하나만 만족해도 접근 허용
                            access : 특정 조건을 기반으로 접근을 제한             */
                        .requestMatchers(
                                new AntPathRequestMatcher("/admin/**")
                        // 관리자 페이지는 관리자만 접근 가능
                        ).hasAuthority("SYS_ADMIN")

                        // 그 외 요청 접근 X
                        .anyRequest().authenticated()
                )

                // 로그인 페이지 커스터마이징
                .formLogin(login -> login
                        .loginPage("/user/login")
                        .loginProcessingUrl("/user/loginForm")
                        // username : user_id, password : password
                        .usernameParameter("user_id")
                        .passwordParameter("password")
                        // 로그인 성공 시 defaultSuccessUrl 페이지로 이동
                        .defaultSuccessUrl("/")

                        /* 로그인 성공 핸들러 successHandler */
                        /*.successHandler(successHandler)*/

                        /*
                            로그인 실패 핸들러 failureHandler
                            : 실패한 인증 시도를 처리하는데 사용, 일반적으로 사용자를 인증 페이지로 리디렉션한다.
                             예외 유형에 따라 구현
                        */
                        .failureHandler(failureHandler)

                )
                .logout(logout -> logout
                        .logoutUrl("/logout")
                        .logoutSuccessUrl("/")
                )

                .sessionManagement(session -> session
                        /* 세션 고정 보호
                            - changeSessionId()
                                : 사용자가 인증을 시도하게 되면 사용자 세션은 그대로 두고 세션 아이디만 변경
                                    -> 세션 아이디가 변경되어서 공격자가 갖고있는 세션 아이디는 무용지물이 된다.
                            - migrateSession()
                                : 새로운 세션을 생성하고 세션 아이디도 새로 발급하며 migration한다.
                            - newSession()
                                : 새로운 세션과 아이디를 생성하며 이전의 설정 값들을 사용 불가
                            - none()
                                : 아무런 보호를 하지 않는다.

                            (changeSessionId(), migrateSession()은 이전 세션의 설정 값들을 그대로 사용할 수 있지만
                            newsession()의 경우 새로운 세션을 생성하여 이전 설정 값을 사용할 수 없다.)
                        */
                        .sessionFixation().changeSessionId()

                        /* 세션 정책 설정 코드
                             - SessionCreationPolicy.ALWAYS : 항상 세션을 생성
                             - SessionCreationPolicy.IF_REQUIRED : 필요 시 세션 생성
                             - SessionCreationPolicy.NEVER : 생성하진 않지만 존재 시 사용
                             - SessionCreationPolicy.STATELESS : 생성하지 않고 존재해도 사용하지 않는다.(예. JWT)
                        */
                        .sessionCreationPolicy(SessionCreationPolicy.ALWAYS)

                        /* 동시 세션 관리
                            - maximumSessions()
                                : 최대 허용 가능 세션 수 (-1을 넣으면 무제한으로 세션 생성 허용됨)
                            - maxSessionsPreventsLogin()
                                : maximumSessions 에서 설정한 최대 허용 세션의 수가 되었을 때
                                추가적인 인증 요청(세션 생성)이 있을 경우 어떻게 처리 할지를 정함
                                    - true : 현재 사용자 인증 실패
                                    - false(default) : 기존 세션 만료
                            - expiredUrl
                                : 기존 세션 만료 시 이동할 페이지
                            - invalidSessionUrl()
                                : 세션이 유효하지 않을 때 이동할 페이지
                        */
                        .maximumSessions(1)
                        .maxSessionsPreventsLogin(false)
                        .expiredUrl("/")


                );
        return http.build();
    }




}
