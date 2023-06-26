package kr.ac.kopo.controller.notice;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.biz.notice.NoticeService;
import kr.ac.kopo.controller.biz.notice.NoticeVO;

public class SearchNoticeController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String word = request.getParameter("word");
		
		NoticeVO vo = new NoticeVO();
		vo.setTitle(word);
		vo.setId(word);
		
		NoticeService service = new NoticeService();
		List<NoticeVO> noticeList = service.searchNoticeList(vo);
		
		request.setAttribute("noticeList", noticeList);	
		
		return "/jsp/notice/noticeList.jsp";
	}

}
