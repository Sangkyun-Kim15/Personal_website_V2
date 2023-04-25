package kr.co.mlec.Board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mlec.VO.BoardVO;
import kr.co.mlec.VO.CriteriaVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO boardDAO;

	@Override
	public List<BoardVO> boardSelect() throws Exception {
		return boardDAO.boardSelect();
	}

	@Override
	public BoardVO boardDetail(int boardNo) throws Exception {
		return boardDAO.boardDetail(boardNo);
	}

	@Override
	public int boardInsert(BoardVO board) throws Exception {
		return boardDAO.boardInsert(board);
	}

	@Override
	public void boardDelete(int boardNo) throws Exception {
		boardDAO.boardDelete(boardNo);
	}

	@Override
	public void boardUpdate(BoardVO board) throws Exception {
		boardDAO.boardUpdate(board);
	}

	@Override
	public List<BoardVO> boardSelectByUser(String username) throws Exception {
		return boardDAO.boardSelectByUser(username);
	}

	@Override
	public int getBoardTotalNum(CriteriaVO cri) throws Exception {
		return boardDAO.getBoardTotalNum(cri);
	}

	@Override
	public List<BoardVO> boardSelectPaging(CriteriaVO cri) throws Exception {
		return boardDAO.boardSelectPaging(cri);
	}

	@Override
	public int getBoardTotalNumByUser(String username) throws Exception {
		return boardDAO.getBoardTotalNumByUser(username);
	}
}
