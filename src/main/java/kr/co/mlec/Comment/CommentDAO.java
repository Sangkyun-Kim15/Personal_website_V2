package kr.co.mlec.Comment;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mlec.VO.CommentVO;
import kr.co.mlec.VO.ReplyVO;


@Repository
public class CommentDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<CommentVO> commentSelect(int boardNo) {
		return sqlSessionTemplate.selectList("kr.co.mlec.Comment.CommentDAO.commentSelect", boardNo);
	}

	public List<ReplyVO> replySelect(int cId) {
		return sqlSessionTemplate.selectList("kr.co.mlec.Comment.CommentDAO.replySelect", cId);
	}
	
	public int replyInsert(CommentVO comment) throws Exception {
		return sqlSessionTemplate.insert("kr.co.mlec.Comment.CommentDAO.replyInsert", comment);
	}
	
	public int commentInsert(CommentVO comment) {
		return sqlSessionTemplate.insert("kr.co.mlec.Comment.CommentDAO.commentInsert", comment);
	}
	
	public void commentDelete(int cId) {
		sqlSessionTemplate.update("kr.co.mlec.Comment.CommentDAO.commentDelete", cId);
	}
}
