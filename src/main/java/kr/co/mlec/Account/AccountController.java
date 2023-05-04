package kr.co.mlec.Account;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.mlec.VO.AccountVO;
import kr.co.mlec.VO.CriteriaVO;
import kr.co.mlec.VO.PagingVO;

@Controller
@RequestMapping("/account")
public class AccountController {
	
	@Autowired
	private AccountService accountService;
	
	@RequestMapping("/login.do")
	public ModelAndView login(HttpServletRequest req, HttpServletResponse res, AccountVO account) throws Exception {
		HttpSession session = req.getSession();
		String username = account.getUsername();
		AccountVO accountDetail = accountService.accountDetail(username);
		session.setAttribute("username", username);
		session.setAttribute("role", accountDetail.getRole());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:../board/select.do");
		
		return mav;
	}
	
	@RequestMapping("/select.do")
	public ModelAndView accountSelect() throws Exception {
		ModelAndView mav = new ModelAndView("admin/admin_user");
		List<AccountVO> list = accountService.select();
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping("/accountSelectPaging.do")
	public ModelAndView accountSelect(CriteriaVO cri) throws Exception {
		ModelAndView mav = new ModelAndView("admin/admin_user");
		List<AccountVO> list = accountService.accountSelectPaging(cri);
		int total = accountService.getAccountTotalNum(cri);
		PagingVO paging = new PagingVO(cri, total);
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		
		return mav;
	}
	
	@RequestMapping("/check.do")
	@ResponseBody
	public List<AccountVO> select() throws Exception{
		List<AccountVO> list = accountService.select();
		
		return list;
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		
		return "redirect:../board/select.do";
	}
}
