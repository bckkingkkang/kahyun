package com.example.kahyun.handler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.io.PrintWriter;

@Component
public class AccessDeniedHandler implements org.springframework.security.web.access.AccessDeniedHandler {

    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException) throws IOException, ServletException {

            response.setContentType("text/html; charset=utf-8");
            PrintWriter out = response.getWriter();

            String htmlcode = "<script>" + "alert('권한이 없습니다.');" + "location.href='/user/login'</script>";
            out.print(htmlcode);
            out.flush();
    }
}
