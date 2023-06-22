package kr.ac.kopo.controller.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.biz.board.BoardService;
import kr.ac.kopo.controller.biz.board.BoardVO;

public class BoardListController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		BoardVO vo = new BoardVO();
		BoardService service = new BoardService();
		
		List<BoardVO> boardList = service.getBoardList(vo);

		request.setAttribute("boardList", boardList);
		
		return "jsp/board/boardList.jsp";
	}

}