package kr.co.mlec.Comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mlec.VO.CommentVO;
import kr.co.mlec.VO.ReplyVO;


@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDAO commentDAO;
	
	public List<CommentVO> commentSelect(int boardNo) throws Exception {
		return commentDAO.commentSelect(boardNo);
	}
	
	public List<ReplyVO> replySelect(int cId) throws Exception {
		return commentDAO.replySelect(cId);
	}

	public int replyInsert(CommentVO comment) throws Exception {
		return commentDAO.replyInsert(comment);
	}
	
	public int commentInsert(CommentVO comment) throws Exception {
		return commentDAO.commentInsert(comment);
	}
	
	public void commentDelete(int cId) throws Exception {
		commentDAO.commentDelete(cId);
	}

	public void commentUpdate(CommentVO comment) throws Exception {
		commentDAO.commentUpdate(comment);
	}
}
