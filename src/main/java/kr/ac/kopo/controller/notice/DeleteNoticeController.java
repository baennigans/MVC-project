package kr.ac.kopo.controller.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.biz.notice.NoticeService;
import kr.ac.kopo.controller.biz.notice.NoticeVO;

public class DeleteNoticeController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		String no = request.getParameter("no");
		
		NoticeVO vo = new NoticeVO();
		vo.setNo(Integer.parseInt(no));

		NoticeService service = new NoticeService();
		service.deleteNotice(vo);
		
		request.setAttribute("msg", "게시글 삭제가 완료되었습니다.");
		
		return "noticePaging.do";
	}
}
