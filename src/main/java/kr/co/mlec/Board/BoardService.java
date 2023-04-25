package kr.co.mlec.Board;

import java.util.List;

import kr.co.mlec.VO.BoardVO;
import kr.co.mlec.VO.CriteriaVO;

public interface BoardService {
	
	public List<BoardVO> boardSelect() throws Exception;

	public BoardVO boardDetail(int boardNo) throws Exception;
	
	public int boardInsert(BoardVO board) throws Exception;
	
	public void boardDelete(int boardNo) throws Exception;
	
	public void boardUpdate(BoardVO board) throws Exception;

	public List<BoardVO> boardSelectByUser(String username) throws Exception;
	
	public int getBoardTotalNum(CriteriaVO cri) throws Exception;

	public List<BoardVO> boardSelectPaging(CriteriaVO cri) throws Exception;

	public int getBoardTotalNumByUser(String username) throws Exception;

}
