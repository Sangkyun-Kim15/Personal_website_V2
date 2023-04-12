package kr.co.mlec.Account;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mlec.VO.AccountVO;

@Service
public class AccountServiceImpl implements AccountService{

	@Autowired
	private AccountDAO accountDAO;
	
	@Override
	public List<AccountVO> select() throws Exception {
		return accountDAO.select();
	}

}
