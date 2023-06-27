package kr.ac.kopo.controller.user;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.biz.user.UserService;
import kr.ac.kopo.controller.biz.user.UserVO;
import kr.ac.kopo.controller.biz.userList.UserListDAO;
import kr.ac.kopo.controller.biz.userList.UserListVO;

public class InsertUserProcessController implements Controller{
	
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
		String birth = request.getParameter("birth");
		String email = request.getParameter("emailId")+"@"+request.getParameter("emailDomain");
		String phone = request.getParameter("phone1")+request.getParameter("phone2")+request.getParameter("phone3");
		String gender = request.getParameter("gender");
		String role = request.getParameter("role");
		
		UserListVO listvo = new UserListVO();
		listvo.setId(id);
		UserListDAO dao = new UserListDAO();
		listvo = dao.getUser(listvo);
		
		if (dao.getUser(listvo) != null) {
			request.setAttribute("msg", "이미 존재하는 아이디입니다.");
			return "/jsp/user/insertUser.jsp";
		}
		
		
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
		
		
		if (id == "" || password == "" || name == "" || birth == "") {
			request.setAttribute("msg", "회원정보를 정확히 입력해주세요.");
			return "/jsp/user/insertUser.jsp";
		} else {
			service.insertUser(vo);
			dao.insertUser(listvo);
			request.setAttribute("msg", "회원가입이 완료되었습니다.");
			return "/jsp/user/loginForm.jsp";
		}
	}
}
