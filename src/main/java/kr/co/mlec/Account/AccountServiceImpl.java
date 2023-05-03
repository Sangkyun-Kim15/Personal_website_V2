package kr.co.mlec.Account;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mlec.VO.AccountVO;
import kr.co.mlec.VO.CriteriaVO;

@Service
public class AccountServiceImpl implements AccountService{

	@Autowired
	private AccountDAO accountDAO;
	
	@Override
	public List<AccountVO> select() throws Exception {
		return accountDAO.select();
	}

	@Override
	public AccountVO accountDetail(String userName) throws Exception {
		return accountDAO.accountDetail(userName);
	}

	@Override
	public List<AccountVO> accountSelectPaging(CriteriaVO cri) throws Exception {
		return accountDAO.accountSelectPaging(cri);
	}

	@Override
	public int getAccountTotalNum(CriteriaVO cri) throws Exception {
		return accountDAO.getAccountTotalNum(cri);
	}

}
