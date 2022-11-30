package kr.co.mlec.Board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mlec.VO.BoardVO;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<BoardVO> boardSelect() {
		return sqlSessionTemplate.selectList("kr.co.mlec.Board.BoardDAO.boardSelect");
	}
}
