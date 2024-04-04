package com.example.kahyun;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@EnableAspectJAutoProxy	// Spring AOP 활성화
@SpringBootApplication
public class KahyunApplication {

	public static void main(String[] args) {
		SpringApplication.run(KahyunApplication.class, args);
	}

}
