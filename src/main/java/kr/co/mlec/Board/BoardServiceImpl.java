package kr.co.mlec.Board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mlec.VO.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO boardDAO;

	public List<BoardVO> boardSelect() throws Exception {
		return boardDAO.boardSelect();
	}

	public BoardVO boardDetail(int boardNo) throws Exception {
		return boardDAO.boardDetail(boardNo);
	}

	public int boardInsert(BoardVO board) throws Exception {
		return boardDAO.boardInsert(board);
	}
}
