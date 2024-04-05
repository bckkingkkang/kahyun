package com.example.kahyun.Filter;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.context.annotation.Configuration;

import java.io.IOException;

@Configuration
public class XSSFilter implements Filter {

    // 필터 객체의 init() 메소드의 인자값으로 전달되는 객체로서 필터에 대한 정보값을 추출하는 메소드를 가지고 있다.
    public FilterConfig filterConfig;

    public void init(FilterConfig filterConfig) throws SecurityException {
        System.out.println("XSSFilter init");
        this.filterConfig = filterConfig;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        System.out.println("XSSFilter doFilter()");
        chain.doFilter(new RequestWrapper((HttpServletRequest) request), response);
    }
}
