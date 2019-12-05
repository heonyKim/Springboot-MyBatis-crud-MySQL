package com.example.crud.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.example.crud.model.User;

@Component
public class SessionInterceptor extends HandlerInterceptorAdapter{
	
	private static final String LOGIN = "login";

    //컨트롤러보다 먼저 수행되는 메소드
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        HttpSession session = request.getSession();
        if(session.getAttribute("user") == null){
            System.out.println("=======================");
            response.sendRedirect("/user/loginForm");
            return false;
        }else {
        	System.out.println("++++++++++++++++++++++++++");

        	
            return true;
        }
        
    }
}
