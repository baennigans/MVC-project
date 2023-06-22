package kr.ac.kopo.controller.biz.board;

import java.util.List;

public class BoardService {
	
	private BoardDAO boardDao;
	
	public BoardService() {
		boardDao = new BoardDAO();
	}

	public void insertBoard(BoardVO vo) {
		boardDao.insertBoard(vo);
		
	}

	public List<BoardVO> getBoardList(BoardVO vo) {
		List<BoardVO> boardList = boardDao.getBoardList();
		return boardList;
	}

	public BoardVO getBoard(BoardVO vo) {
		BoardVO board = boardDao.getBoard(vo);
		return board;
	}

}
