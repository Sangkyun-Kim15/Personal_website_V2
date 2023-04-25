package kr.co.mlec.Board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mlec.VO.BoardVO;
import kr.co.mlec.VO.CriteriaVO;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<BoardVO> boardSelect() {
		return sqlSessionTemplate.selectList("kr.co.mlec.Board.BoardDAO.boardSelect");
	}

	public BoardVO boardDetail(int boardNo) {
		return sqlSessionTemplate.selectOne("kr.co.mlec.Board.BoardDAO.boardDetail", boardNo);
	}
	
	public int boardInsert(BoardVO board) {
		sqlSessionTemplate.insert("kr.co.mlec.Board.BoardDAO.boardInsert", board);
		return board.getBoardNo();
	}
	
	public void boardDelete(int boardNo) {
		sqlSessionTemplate.delete("kr.co.mlec.Board.BoardDAO.boardDelete", boardNo);
	}
	
	public void boardUpdate(BoardVO board) {
		sqlSessionTemplate.update("kr.co.mlec.Board.BoardDAO.boardUpdate", board);
	}

	public List<BoardVO> boardSelectByUser(String username) {
		return sqlSessionTemplate.selectList("kr.co.mlec.Board.BoardDAO.boardSelectByUser", username);
	}

	public int getBoardTotalNum(CriteriaVO cri) {
		return (int)sqlSessionTemplate.selectOne("kr.co.mlec.Board.BoardDAO.getBoardTotalNum", cri);
	}

	public List<BoardVO> boardSelectPaging(CriteriaVO cri) {
		return sqlSessionTemplate.selectList("kr.co.mlec.Board.BoardDAO.boardSelectPaging", cri);
	}

	public int getBoardTotalNumByUser(String username) {
		return sqlSessionTemplate.selectOne("kr.co.mlec.Board.BoardDAO.getBoardTotalNumByUser", username);
	}
}
