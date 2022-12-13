package kr.co.mlec.Comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.mlec.VO.CommentVO;

@Controller
@RequestMapping("/comment")
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	@RequestMapping("/insert.do")
	public ModelAndView insert(CommentVO comment) throws Exception{
		ModelAndView mav = new ModelAndView("board/detail");
		commentService.commentInsert(comment);
		mav.setViewName("redirect:/board/detail.do");
		mav.addObject("boardNo", comment.getbId());
		return mav;
	}
}
