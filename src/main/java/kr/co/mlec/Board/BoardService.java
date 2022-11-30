package kr.co.mlec.Board;

import java.util.List;

import kr.co.mlec.VO.BoardVO;

public interface BoardService {
	
	public List<BoardVO> boardSelect() throws Exception;
}
