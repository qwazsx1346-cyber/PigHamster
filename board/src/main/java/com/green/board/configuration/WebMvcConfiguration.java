package com.green.board.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**") //모든 주소
                .allowedOrigins("*") //어디서 왔던지
                .allowedMethods("*"); //모든 메소드 post방식 get방식 모두허용하겠다는 뜻
    }
}
