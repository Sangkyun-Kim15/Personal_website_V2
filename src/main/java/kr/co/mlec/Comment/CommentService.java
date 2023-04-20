package kr.co.mlec.Comment;

import java.util.List;

import kr.co.mlec.VO.CommentVO;


public interface CommentService {

	public List<CommentVO> commentSelect(int boardNo) throws Exception;
	
	public List<CommentVO> replySelect(int cId) throws Exception;
	
	public int replyInsert(CommentVO comment) throws Exception;
	
	public int commentInsert(CommentVO comment) throws Exception;
	
	public void commentDelete(int cId) throws Exception;
	
	public void commentUpdate(CommentVO comment) throws Exception;

	public List<CommentVO> commentSelectByUser(String username);
}
