package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogoutController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

//		System.out.println("LogoutController  handleRequest() ȣ��..");

		return "/jsp/login/logout.jsp";
	}

}