package kr.ac.kopo.controller.notice;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.biz.notice.NoticeService;
import kr.ac.kopo.controller.biz.notice.NoticeVO;

public class UpdateNoticeProcessController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String no = request.getParameter("no");
		String title = request.getParameter("title");
		String detail = request.getParameter("detail");
		
		NoticeVO vo = new NoticeVO();
		vo.setNo(Integer.parseInt(no));
		vo.setTitle(title);
		vo.setDetail(detail);

		NoticeService service = new NoticeService();
		
		if (title == "" || detail == "") {
			request.setAttribute("msg", "제목/내용을 한 글자 이상 입력해주세요.");
			return "updateNotice.do";
		} else {
			service.updateNotice(vo);
			return "getNotice.do";
		}
	}

}