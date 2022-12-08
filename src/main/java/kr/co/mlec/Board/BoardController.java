package kr.co.mlec.Board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.cj.x.protobuf.MysqlxNotice.SessionStateChanged.Parameter;

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
	
	@RequestMapping("/detail.do")
	public ModelAndView boardDetail(@RequestParam(value="boardNo") int boardNo) throws Exception {
		ModelAndView mav = new ModelAndView("board/detail");
		BoardVO board = service.boardDetail(boardNo);
		mav.addObject("board", board);
		return mav;
	}
	
	@RequestMapping("/insert.do")
	public String boardInsert(BoardVO board) throws Exception {
		ModelAndView mav = new ModelAndView("board/list");
		service.boardInsert(board);
		
		return "redirect:select.do";
	}
	
	@RequestMapping("/delete.do")
	public String boardDelete(@RequestParam(value="boardNo") int boardNo) throws Exception{
		ModelAndView mav = new ModelAndView("board/list");
		service.boardDelete(boardNo);
		
		return "redirect:select.do?call=D";
	}
	
	@RequestMapping("/updateForm.do")
	public ModelAndView updateForm(@RequestParam(value="boardNo")int boardNo) throws Exception {
		ModelAndView mav = new ModelAndView("board/updateForm");
		BoardVO board = service.boardDetail(boardNo);
		mav.addObject("board", board);
		
		return mav;
	}
	
	@RequestMapping("/update.do")
	public String boardUpdate(BoardVO board) throws Exception {
		ModelAndView mav = new ModelAndView("board/list");
		service.boardUpdate(board);
		
		return "redirect:select.do?call=U";
	}
}
