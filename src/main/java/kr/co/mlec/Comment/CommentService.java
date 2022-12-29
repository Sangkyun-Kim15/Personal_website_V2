package kr.co.mlec.Comment;

import java.util.List;

import kr.co.mlec.VO.CommentVO;
import kr.co.mlec.VO.ReplyVO;


public interface CommentService {

	public List<CommentVO> commentSelect(int boardNo) throws Exception;
	
	public List<ReplyVO> replySelect(int cId) throws Exception;
	
	public int replyInsert(CommentVO comment) throws Exception;
	
	public int commentInsert(CommentVO comment) throws Exception;
	
	public void commentDelete(int cId) throws Exception;
	
	public void commentUpdate(CommentVO comment) throws Exception;
}
