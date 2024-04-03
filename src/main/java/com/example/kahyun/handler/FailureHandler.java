package com.example.kahyun.handler;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.authentication.*;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

@Component/*(value = "authenticationFailureHandler")*/
/*public class FailureHandler implements AuthenticationFailureHandler {*/
public class FailureHandler extends SimpleUrlAuthenticationFailureHandler {
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        /* 실패 로직 핸들링
        exception.printStackTrace();
        writePrintErrorResponse(response, exception);*/

        String errorMessage;
        if (exception instanceof BadCredentialsException) {
            errorMessage = "아이디 또는 비밀번호가 일치하지 않습니다.";
        } else if (exception instanceof UsernameNotFoundException) {
            errorMessage = "계정 존재하지 않음";
        } else if (exception instanceof AccountExpiredException) {
            errorMessage = "계정 만료";
        } else if (exception instanceof CredentialsExpiredException) {
            errorMessage = "비밀번호 만료";
        } else if (exception instanceof DisabledException) {
            errorMessage = "계정 비활성화";
        } else if (exception instanceof LockedException) {
            errorMessage = "계정잠김";
        } else if (exception instanceof AuthenticationCredentialsNotFoundException){
            errorMessage = "인증 요청 거부";
        } else {
            errorMessage = "알 수 없는 이유";
        }
        errorMessage = URLEncoder.encode(errorMessage, "UTF-8");
        출처: https://dev-coco.tistory.com/126 [슬기로운 개발생활:티스토리]
        setDefaultFailureUrl("/user/login?error=true&exception="+errorMessage);
        super.onAuthenticationFailure(request, response, exception);
    }

    /*private void writePrintErrorResponse(HttpServletResponse response, AuthenticationException exception) {
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            Map<String, Object> responseMap = new HashMap<>();
            String message = getExceptionMessage(exception);

            responseMap.put("status", 401);
            responseMap.put("message", message);

            response.getOutputStream().println(objectMapper.writeValueAsString(responseMap));

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private String getExceptionMessage(AuthenticationException exception) {
        if (exception instanceof BadCredentialsException) {
            return "비밀번호불일치";
        } else if (exception instanceof UsernameNotFoundException) {
            return "계정없음";
        } else if (exception instanceof AccountExpiredException) {
            return "계정만료";
        } else if (exception instanceof CredentialsExpiredException) {
            return "비밀번호만료";
        } else if (exception instanceof DisabledException) {
            return "계정비활성화";
        } else if (exception instanceof LockedException) {
            return "계정잠김";
        } else {
            return "확인된 에러가 없습니다.";
        }
    }*/
}
