package com.example.kahyun.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    /*@Bean
    public FilterRegistrationBean<XssEscapeServletFilter> getFilterRegistrationBean() {
        FilterRegistrationBean<XssEscapeServletFilter> xssRegistrationBean = new FilterRegistrationBean<>();
        xssRegistrationBean.setFilter(new XssEscapeServletFilter());
        xssRegistrationBean.setOrder(Ordered.LOWEST_PRECEDENCE);
        xssRegistrationBean.addUrlPatterns("/*");

        return xssRegistrationBean;
    }*/

}
