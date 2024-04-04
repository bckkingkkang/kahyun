package com.example.kahyun.config;

import com.example.kahyun.config.XSS.HTMLCharacterEscapes;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.List;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        converters.add(escapingConverter());
    }

    /*
        Jackson 라이브러리의 ObjectMapper : JSON 형식을 사용할 때, 응답들을 직렬화하고 요청들을 역직렬화할 때 사용

        *JSON : "키 : 값" 쌍으로 이루어진 데이터 객체를 전달하기 위해 사람이 읽을 수 있는 텍스트를 사용하는 포맷

        직렬화 (serialize) : 데이터를 전송하거나 저장할 때 바이트 문자열이어야 하기 때문에 객체들을 문자열로 바꾸어 주는 것
            - object -> String 문자열
        역질렬화 (Deserialize) : 데이터가 모두 전송된 이후, 수신측에서 다시 문자열을 기존의 객체로 회복시켜주는 것
            - String문자열 -> Object
    */

    @Bean
    public HttpMessageConverter escapingConverter() {
        ObjectMapper objectMapper = new ObjectMapper();
        // ObjectMapper에 특수 문자 처리 기능 적용
        objectMapper.getFactory().setCharacterEscapes(new HTMLCharacterEscapes());

        // MessageConvert에 ObjectMapper 설정
        MappingJackson2HttpMessageConverter escapingConverter = new MappingJackson2HttpMessageConverter();
        escapingConverter.setObjectMapper(objectMapper);

        return escapingConverter;
    }
}
