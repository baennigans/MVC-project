package kr.ac.kopo.controller.user;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.biz.user.UserService;
import kr.ac.kopo.controller.biz.user.UserVO;

public class UpdateUserController implements Controller{
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		UserVO vo = new UserVO();
		vo.setId(id);
		vo.setPassword(password);
		vo.setName(name);
		vo.setEmail(email);
		vo.setPhone(phone);
		
		
		UserService service = new UserService();

		if (password == "" || name == "" || email == "" || phone == "") {
			request.setAttribute("msg", "회원정보를 정확히 입력해주세요.");
			return "jsp/user/myPage.jsp";
		} else {
			service.updateUser(vo);
			request.setAttribute("msg", "정보수정이 완료되었습니다. 다시 로그인하세요.");
			HttpSession session = request.getSession();
			session.invalidate();
			return "jsp/user/logoutProcess.jsp";
		}
	}
}
