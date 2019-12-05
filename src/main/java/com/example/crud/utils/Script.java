package com.example.crud.utils;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class Script {
	
	public static String back(String msg) {

		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("alert('" + msg + "');");
		sb.append("history.back();");
		sb.append("</script>");

		return sb.toString();
	}

	public static String backHref(String msg, String location) {

		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("alert('" + msg + "');");
		sb.append("location.href='" + location + "'");
		sb.append("</script>");

		return sb.toString();
	}

	public static String href(String location) {

		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("location.href='" + location + "'");
		sb.append("</script>");

		return sb.toString();
	}
	
	
//	public static String msg(HttpServletResponse response, String msg) {
//		
//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html;charset=UTF-8");
//		try {
//			PrintWriter out = response.getWriter();
//			out.println("<script>");
//			out.println("alert('" + msg + "');");
//			out.println("</script>");
//			out.flush();
//			return "redirect:/";
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		return "";
//	}
}
