package kr.ac.kopo.controller.notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.biz.notice.NoticeService;
import kr.ac.kopo.controller.biz.notice.NoticeVO;

public class NoticePagingController implements Controller {
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		int pageNo = 1;
		try {
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		} catch(Exception e) {
		}
		
		NoticeService service = new NoticeService();
		List<NoticeVO> noticeList = service.selectNotice(pageNo);
		
		int totalCount = service.selectNoticeCount();
		int listSize = 15;
		int lastPage = (totalCount % listSize == 0) ? totalCount / listSize  : totalCount / listSize + 1;
		
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("lastPage", lastPage);
		request.setAttribute("noticeList", noticeList);
		
		int tabSize  = 5;
		int currTab   = (pageNo  -1) / tabSize + 1;
		int beginPage = (currTab -1) * tabSize + 1;
		int endPage   = (currTab * tabSize < lastPage) ? currTab * tabSize : lastPage;
		
		request.setAttribute("beginPage", beginPage);
		request.setAttribute("endPage"  , endPage);
		
		return "/jsp/notice/noticeList.jsp";
	}
}
