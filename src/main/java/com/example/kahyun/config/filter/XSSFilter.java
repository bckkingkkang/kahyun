package com.example.kahyun.config.filter;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.context.annotation.Configuration;

import java.io.IOException;

@Configuration
public class XSSFilter implements Filter {

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
