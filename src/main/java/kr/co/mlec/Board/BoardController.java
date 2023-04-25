package kr.co.mlec.Board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import kr.co.mlec.VO.BoardVO;
import kr.co.mlec.VO.CriteriaVO;
import kr.co.mlec.VO.PagingVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	
	@RequestMapping("/select.do")
	public ModelAndView boardSelect(CriteriaVO cri) throws Exception {
		ModelAndView mav = new ModelAndView("board/list");
		List<BoardVO> list = service.boardSelectPaging(cri);
		mav.addObject("list", list);
		int total = service.getBoardTotalNum(cri);
		PagingVO paging = new PagingVO(cri, total);
		mav.addObject("paging", paging);
		
		return mav;
	}
	
	@RequestMapping("/boardSelectByUser.json")
	@ResponseBody
	public List<BoardVO> boardSelectByUser(@RequestParam(value="username") String username) throws Exception {
		List<BoardVO> list = service.boardSelectByUser(username);
		
		return list;
	}
	
	@RequestMapping("/detail.do")
	public ModelAndView boardDetail(@RequestParam(value="boardNo") int boardNo, CriteriaVO cri) throws Exception {
		ModelAndView mav = new ModelAndView("board/detail");
		BoardVO board = service.boardDetail(boardNo);
		
		mav.addObject("board", board);
		mav.addObject("cri", cri);
		
		return mav;
	}
	
	@RequestMapping("/insert.do")
	public ModelAndView boardInsert(BoardVO board) throws Exception {
		ModelAndView mav = new ModelAndView("board/list");
		service.boardInsert(board);
		mav.setViewName("redirect:select.do");
		
		return mav;
	}
	
	@RequestMapping("/delete.do")
	public ModelAndView boardDelete(@RequestParam(value="boardNo") int boardNo, CriteriaVO cri) throws Exception{
		ModelAndView mav = new ModelAndView("board/list");
		service.boardDelete(boardNo);
		mav.setViewName("redirect:select.do?pageNum="+ cri.getPageNum() +"&amount="+ cri.getAmount() +"");
		
		return mav;
	}
	
	@RequestMapping("/updateForm.do")
	public ModelAndView updateForm(@RequestParam(value="boardNo")int boardNo) throws Exception {
		ModelAndView mav = new ModelAndView("board/updateForm");
		BoardVO board = service.boardDetail(boardNo);
		mav.addObject("board", board);
		
		return mav;
	}
	
	@RequestMapping("/update.do")
	public ModelAndView boardUpdate(BoardVO board) throws Exception {
		ModelAndView mav = new ModelAndView("board/list");
		service.boardUpdate(board);
		mav.setViewName("redirect:select.do?call=U");
		
		return mav;
	}
}
