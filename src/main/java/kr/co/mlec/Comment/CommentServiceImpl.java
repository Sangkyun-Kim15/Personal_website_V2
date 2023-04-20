package kr.co.mlec.Comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mlec.VO.CommentVO;


@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDAO commentDAO;
	
	@Override
	public List<CommentVO> commentSelect(int boardNo) throws Exception {
		return commentDAO.commentSelect(boardNo);
	}
	
	@Override
	public List<CommentVO> replySelect(int cId) throws Exception {
		return commentDAO.replySelect(cId);
	}

	@Override
	public int replyInsert(CommentVO comment) throws Exception {
		return commentDAO.replyInsert(comment);
	}
	
	@Override
	public int commentInsert(CommentVO comment) throws Exception {
		return commentDAO.commentInsert(comment);
	}
	
	@Override
	public void commentDelete(int cId) throws Exception {
		commentDAO.commentDelete(cId);
	}

	@Override
	public void commentUpdate(CommentVO comment) throws Exception {
		commentDAO.commentUpdate(comment);
	}

	@Override
	public List<CommentVO> commentSelectByUser(String username) {
		return commentDAO.commentSelectByUser(username);
	}
}
