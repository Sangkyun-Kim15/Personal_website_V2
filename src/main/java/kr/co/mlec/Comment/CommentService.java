package kr.co.mlec.Comment;

import java.util.List;

import kr.co.mlec.VO.CommentVO;


public interface CommentService {

	public List<CommentVO> commentSelect(int boardNo) throws Exception;
	
	public int commentInsert(CommentVO comment) throws Exception;
}
