package kr.ac.kopo.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.biz.user.UserService;
import kr.ac.kopo.controller.biz.user.UserVO;

public class LoginProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		String id = request.getParameter("id");
		String password = request.getParameter("password");

		UserVO vo = new UserVO();
		vo.setId(id);
		vo.setPassword(password);
		UserService service = new UserService();

		if (service.getUser(vo) != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", vo);
			request.setAttribute("msg", vo.getId()+" 님 안녕하세요.");
			request.setAttribute("login", "true");
		} else {
			request.setAttribute("msg", "아이디 또는 비밀번호를 잘못입력하였습니다.");
			request.setAttribute("login", "false");
		}

		return "jsp/login/loginProcess.jsp"; // forword시킨것
		// return "redirect:"+request.getContextPath();
	}

}