package kr.co.mlec.Account;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.mlec.VO.AccountVO;

@Controller
@RequestMapping("/account")
public class AccountController {
	
	@Autowired
	private AccountService service;
	
	@RequestMapping("/login.do")
	public ModelAndView login(HttpServletRequest req, HttpServletResponse res, AccountVO account) throws Exception {
		HttpSession session = req.getSession();
		String username = account.getUsername();
		session.setAttribute("username", username);
		ModelAndView mav = new ModelAndView("main");
		
		return mav;
	}
	
	@RequestMapping("/select.do")
	@ResponseBody
	public List<AccountVO> select() throws Exception{
		List<AccountVO> list = service.select();
		
		return list;
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		
		return "redirect:/main.do";
	}
}
