package com.example.kahyun.config.XSS.Filter;

import jakarta.servlet.*;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.context.SecurityContextHolder;

import java.io.IOException;

@Configuration
public class ExampFilter implements Filter {

    /*
        Filter로 구현할 수 있는 기능
        - 서블릿이 호출되기 전에 서블릿 요청을 가로채는 기능
        - 서블릿이 호출되기 전에 요청 내용을 점검하는 기능
        - 요청 헤더의 수정과 조정 기능
        - 서블릿이 호출된 후에 서블릿 응답을 가로채는 기능
        - 응답 헤더의 수정과 조정 기능
    */

    public void init(FilterConfig config) {
        /*  필터 객체가 생성될 때 호출되는 메소드
            웹 서버가 시작될 때 한 번만 생성된 다음 계속 사용되므로 init()메소드는 서버가 시작될 때 한 번만 호출된다.
            초기화 기능 구현  */
        System.out.println("init() 호출");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        // 필터링 설정한 서블릿을 실행할 때마다 호출되는 메소드로서 실제 필터링 기능을 구현하는 메소드
        System.out.println("examFilter doFilter() 호출 전 권한 : " + SecurityContextHolder.getContext().getAuthentication().getAuthorities());
        chain.doFilter(request, response);
        System.out.println("exampFilter doFilter() 호출 후");
    }

    public void destroy() {
        // 필터 객체가 삭제될 때 호출되는 메소드로 자원 해제 기능을 구현한다.
        System.out.println("destroy() 호출");
    }
}
