package kr.ac.kopo.controller.user;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.biz.user.UserService;
import kr.ac.kopo.controller.biz.user.UserVO;

public class FindIDProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		phone = phone.replaceAll("-", "");

		UserVO vo = new UserVO();
		vo.setName(name);
		vo.setPhone(phone);
		UserService service = new UserService();
		vo = service.getUserID(vo);
		
		if (service.getUserID(vo) != null) {
			request.setAttribute("name", vo.getName());
			request.setAttribute("id", vo.getId());
			return "jsp/login/findID.jsp";
			
		} else {
			request.setAttribute("msg", "일치하는 회원정보가 없습니다.");
			return "jsp/login/findUser.jsp";
		}
	}
}