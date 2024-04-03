package com.example.kahyun.handler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.io.PrintWriter;


@Component
public class SuccessHandler implements AuthenticationSuccessHandler {
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        HttpSession session = request.getSession();

        /*if(session != null) {
            response.setContentType("text/html; charset=utf-8");
            PrintWriter out = response.getWriter();

            String htmlcode = "<script>" + "alert('로그인되었습니다.');" + "</script>";
            out.print(htmlcode);
            out.flush();
        }*/

    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {

    }
}
