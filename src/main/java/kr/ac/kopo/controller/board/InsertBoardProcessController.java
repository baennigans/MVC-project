package kr.ac.kopo.controller.board;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.biz.board.BoardService;
import kr.ac.kopo.controller.biz.board.BoardVO;

public class InsertBoardProcessController implements Controller {
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
		
		//System.out.println("board : "+id+", "+title+", "+detail);
		
		BoardVO vo = new BoardVO();
		vo.setId(id);
		vo.setTitle(title);
		vo.setDetail(detail);
		
		BoardService service = new BoardService();
		service.insertBoard(vo);
		
		
		
		
		
		
		return "jsp/board/boardList.jsp";
	}
}