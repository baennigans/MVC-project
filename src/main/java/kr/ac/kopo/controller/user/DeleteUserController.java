package kr.ac.kopo.controller.user;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.biz.user.UserService;
import kr.ac.kopo.controller.biz.user.UserVO;

public class DeleteUserController implements Controller{
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String id = request.getParameter("id");
		System.out.println(id);
		UserVO vo = new UserVO();
		vo.setId(id);
		
		UserService service = new UserService();

		service.deleteUser(vo);
		request.setAttribute("msg", "회원탈퇴가 완료되었습니다.");
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "jsp/user/logoutProcess.jsp";
	}
}