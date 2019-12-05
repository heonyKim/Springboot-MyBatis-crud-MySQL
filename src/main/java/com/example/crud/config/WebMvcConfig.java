package com.example.crud.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{

	//.addPathPatterns("/**");
		//.excludePathPatterns("/user/*")
		@Override
		public void addInterceptors(InterceptorRegistry registry) {
			registry.addInterceptor(new SessionInterceptor())
					.addPathPatterns("/board/writeForm")
					.addPathPatterns("/board/write")
					.addPathPatterns("/board/updateForm/**")
					.addPathPatterns("/board/update/**")
					.addPathPatterns("/board/delete/**");

		}
}
