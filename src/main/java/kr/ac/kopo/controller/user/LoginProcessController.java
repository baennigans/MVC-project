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
		vo = service.getUser(vo);
		
		if (service.getUser(vo) != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", vo);
			session.setAttribute("login", "true");
			request.setAttribute("msg", vo.getName()+" 님 안녕하세요.");
		} else {
			request.setAttribute("msg", "아이디 또는 비밀번호를 잘못입력하였습니다.");
		}

		return "jsp/user/loginProcess.jsp";
	}

}