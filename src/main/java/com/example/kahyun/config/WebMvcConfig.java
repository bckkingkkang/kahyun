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

    @Bean
    public HttpMessageConverter escapingConverter() {
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.getFactory().setCharacterEscapes(new HTMLCharacterEscapes());

        MappingJackson2HttpMessageConverter escapingConverter = new MappingJackson2HttpMessageConverter();
        escapingConverter.setObjectMapper(objectMapper);

        return escapingConverter;
    }
}
