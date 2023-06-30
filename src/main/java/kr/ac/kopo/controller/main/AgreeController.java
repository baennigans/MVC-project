package kr.ac.kopo.controller.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.controller.Controller;

public class AgreeController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String login = (String) session.getAttribute("login");
		if(login!="true") {
			request.setAttribute("msg", "회원로그인을 진행해주세요");
			return "login.do";
		}
		
		return "/jsp/agree.jsp";
	}

}