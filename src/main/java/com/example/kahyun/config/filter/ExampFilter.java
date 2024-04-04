package com.example.kahyun.config.filter;

import jakarta.servlet.*;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.context.SecurityContextHolder;

import java.io.IOException;

@Configuration
public class ExampFilter implements Filter {
    public void init(FilterConfig config) {
        System.out.println("init() 호출");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        System.out.println("examFilter doFilter() 호출 전 권한 : " + SecurityContextHolder.getContext().getAuthentication().getAuthorities());
        chain.doFilter(request, response);
        System.out.println("exampFilter doFilter() 호출 후");
    }
}
