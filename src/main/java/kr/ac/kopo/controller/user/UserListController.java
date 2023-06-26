package kr.ac.kopo.controller.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.biz.user.UserService;
import kr.ac.kopo.controller.biz.user.UserVO;

public class UserListController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		UserVO vo = new UserVO();
		UserService service = new UserService();
		
		List<UserVO> userList = service.getUserList(vo);

		request.setAttribute("userList", userList);
		
		return "/jsp/user/userList.jsp";
	}
}