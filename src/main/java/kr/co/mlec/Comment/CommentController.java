package kr.co.mlec.Comment;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.mlec.VO.CommentVO;
import kr.co.mlec.VO.CriteriaVO;

@Controller
@RequestMapping("/comment")
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	@RequestMapping("/select.json")
	@ResponseBody
	public List<CommentVO> commentSelect(HttpServletRequest req) throws Exception {
		List<CommentVO> list = commentService.commentSelect(Integer.parseInt(req.getParameter("boardNo")));
		return list;
	}
	
	@RequestMapping("/commentSelectByUser.json")
	@ResponseBody
	public List<CommentVO> commentSelectByUser(@RequestParam(value="username") String username) throws Exception {
		List<CommentVO> list = commentService.commentSelectByUser(username);
		
		return list;
	}
	
	@RequestMapping("/insert.do")
	public ModelAndView commentInsert(CommentVO comment, CriteriaVO cri) throws Exception {
		ModelAndView mav = new ModelAndView();
		cri.setBoardNo(comment.getbId());
		commentService.commentInsert(comment);
		mav.setViewName("redirect:../board/select.do?boardNo=" + cri.getBoardNo() + "&pageNum=" + cri.getPageNum() + "&amount=" + cri.getAmount() + "&keyword=" + cri.getKeyword());
		return mav;
	}
	
	@ResponseBody
	@RequestMapping("/commentDelete.json")
	public String commentDelete(int cId) throws Exception {
		commentService.commentDelete(cId);
		return null;
	}
	
	@ResponseBody
	@RequestMapping("/commentUpdate.json")
	public String commentUpdate(CommentVO comment) throws Exception {
		commentService.commentUpdate(comment);
		return null;
	}
	
	@RequestMapping("/replySelect.json")
	@ResponseBody
	public List<CommentVO> replySelect(HttpServletRequest req) throws Exception {
		List<CommentVO> list = commentService.replySelect(Integer.parseInt(req.getParameter("cId")));
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/insert.json")
	public String replyInsert(CommentVO comment) throws Exception {
		commentService.replyInsert(comment);
		return "success";
	}
}
