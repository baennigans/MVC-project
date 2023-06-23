package kr.ac.kopo.controller.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.biz.board.BoardService;
import kr.ac.kopo.controller.biz.board.BoardVO;

public class BoardPagingController implements Controller {
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		int pageNo = 1;
		try {
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		} catch(Exception e) {
		}
		System.out.println(pageNo);
		
		BoardService service = new BoardService();
		List<BoardVO> boardList = service.selectBoard(pageNo);
		
		int totalCount = service.selectBoardCount();
		int listSize = 1;
		int lastPage = (totalCount % listSize == 0) ? totalCount / listSize  : totalCount / listSize + 1;
		
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("lastPage", lastPage);
		request.setAttribute("boardList", boardList);
		
		int tabSize  = 3;
		int currTab   = (pageNo  -1) / tabSize + 1;
		int beginPage = (currTab -1) * tabSize + 1;
		int endPage   = (currTab * tabSize < lastPage) ? currTab * tabSize : lastPage;
		
		request.setAttribute("beginPage", beginPage);
		request.setAttribute("endPage"  , endPage);
		
		return "/jsp/board/boardList.jsp";
	}
}
