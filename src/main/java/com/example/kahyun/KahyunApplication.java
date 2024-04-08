package com.example.kahyun;

import org.mybatis.spring.boot.autoconfigure.MybatisAutoConfiguration;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.WebApplicationContext;

@EnableAspectJAutoProxy	// Spring AOP 활성화
@SpringBootApplication
public class KahyunApplication /*extends SpringBootServletInitializer implements WebApplicationInitializer*/ {

	/*
		jar
		- java 애플리케이션 및 라이브러리의 컴파일된 클래스 파일, 리소스 파일, 메타데이터 및 라이브러리들을 패키징하는데 사용
		- 주로 독립 실행형 응용 프로그램과 라이브러리를 패키징하는 데 사용
		- JVM을 통해서 실행한다. (JRE 필요)
		- META-INF 디렉터리 아래에 메타데이터와 리소스가 포함, 클래스 파일은 루트 디렉터리에 포함

		war (Web Application Archive)
		- WAR 파일은 java 웹 애플리케이션을 패키징하는데 사용
		- 웹 애플리케이션은 HTML, CSS, JavaScript, JSP(Java Server Pages), 서블릿 클래스, 리소스 파일 등을 포함한다.
		- 주로 웹 애플리케이션 서버(ex.Apache Tomcat, Jetty 등)에서 실행하는 데에 사용
		- WAR 파일은 웹 애플리케이션의 내용을 정의하는 규칙이 따로 있다.
		  WEB-INF 디렉터리 아래에 웹 애플리케이션 설정, 서블릿 클래스, JSP 파일 및 리소스가 포함된다.

		> jar 는 단독실행, war는 톰캣과 같은 was/web 서버가 필요하다.
	*/

	public static void main(String[] args) {
		SpringApplication.run(KahyunApplication.class, args);
	}

	/*@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(KahyunApplication.class);
	}

	@Override
	protected WebApplicationContext run(SpringApplication application) {
		return super.run(application);
	}*/

}
