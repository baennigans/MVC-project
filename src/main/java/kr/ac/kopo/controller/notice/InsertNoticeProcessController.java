package kr.ac.kopo.controller.notice;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.biz.notice.NoticeService;
import kr.ac.kopo.controller.biz.notice.NoticeVO;

public class InsertNoticeProcessController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String detail = request.getParameter("detail");
		
		NoticeVO vo = new NoticeVO();
		vo.setId(id);
		vo.setTitle(title);
		vo.setDetail(detail);
		
		NoticeService service = new NoticeService();
		service.insertNotice(vo);
		
		request.setAttribute("msg", "게시글 등록이 완료되었습니다.");
		
		return "noticePaging.do";
	}
}