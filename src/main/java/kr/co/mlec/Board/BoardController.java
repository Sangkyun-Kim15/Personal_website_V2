package kr.co.mlec.Board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.mlec.VO.BoardVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@RequestMapping("/select.do")
	public ModelAndView boardSelect() throws Exception {
		ModelAndView mav = new ModelAndView("board/list");
		List<BoardVO> list = service.boardSelect();
		mav.addObject("list", list);
		
		return mav;
	}
}
