package kr.ac.kopo.controller.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.biz.user.UserService;
import kr.ac.kopo.controller.biz.user.UserVO;

public class AgreeProcessController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		
		UserVO vo = new UserVO();
		vo.setId(id);
		UserService service = new UserService();
		service.agreeUser(vo);
		
		return "main.do";
	}

}