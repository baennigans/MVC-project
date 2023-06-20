package kr.ac.kopo.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.biz.user.UserService;
import kr.ac.kopo.controller.biz.user.UserVO;

public class InsertUserProcessController implements Controller{
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String email = request.getParameter("emailId")+"@"+request.getParameter("emailDomain");
		String phone = request.getParameter("phone1")+request.getParameter("phone2")+request.getParameter("phone3");
		String gender = request.getParameter("gender");
		String role = request.getParameter("role");

		System.out.println(id);
		System.out.println(password);
		System.out.println(name);
		System.out.println(birth);
		System.out.println(email);
		System.out.println(phone);
		System.out.println(gender);
		System.out.println(role);
		
		UserVO vo = new UserVO();
		vo.setId(id);
		vo.setPassword(password);
		vo.setName(name);
		vo.setBirth(birth);
		vo.setEmail(email);
		vo.setPhone(phone);
		vo.setGender(gender);
		vo.setRole(role);

		UserService service = new UserService();
		service.insertUser(vo);

		if (id == null) {
			return "jsp/login/insertUser.jsp";
		} else {
			return "jsp/login/loginForm.jsp?insert=success";
		}
	}
}
