package kr.ac.kopo.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;

public class LoginProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		request.setAttribute("msg", "�α��� ����");
		return "redirect:" + request.getContextPath();
		// return "redirect:/MyBanking";
		// return "/jsp/login/loginProcess.jsp"; // forword
	}
}