package kr.ac.kopo.controller.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.biz.notice.NoticeService;
import kr.ac.kopo.controller.biz.notice.NoticeVO;

public class GetNoticeController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		String no = request.getParameter("no");
		
		NoticeVO vo = new NoticeVO();
		vo.setNo(Integer.parseInt(no));

		NoticeService service = new NoticeService();
		
		NoticeVO notice = service.getNotice(vo);

		request.setAttribute("notice", notice);
		
		return "/jsp/notice/getNotice.jsp";
	}

}