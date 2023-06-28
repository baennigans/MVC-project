package kr.ac.kopo.controller.user;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.biz.user.UserService;
import kr.ac.kopo.controller.biz.user.UserVO;
import kr.ac.kopo.controller.biz.userList.UserListDAO;
import kr.ac.kopo.controller.biz.userList.UserListVO;

public class DeleteUserListController implements Controller{
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String id = request.getParameter("id");
		
		UserVO vo = new UserVO();
		vo.setId(id);
		UserService service = new UserService();
		service.deleteUser(vo);
		
		UserListVO listvo = new UserListVO();
		listvo.setId(id);
		UserListDAO dao = new UserListDAO();
		dao.deletUser(listvo);
		
		request.setAttribute("msg", "회원정보가 삭제되었습니다.");
		
		return "userList.do";
	}
}