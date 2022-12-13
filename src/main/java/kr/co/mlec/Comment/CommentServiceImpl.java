package kr.co.mlec.Comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mlec.VO.CommentVO;


@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDAO commentDAO;
	
	public List<CommentVO> commentSelect(int boardNo) throws Exception {
		return commentDAO.commentSelect(boardNo);
	}

	public int commentInsert(CommentVO comment) throws Exception {
		return commentDAO.commentInsert(comment);
	}
}
