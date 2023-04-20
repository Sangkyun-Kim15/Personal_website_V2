package kr.co.mlec.Account;

import java.util.List;

import kr.co.mlec.VO.AccountVO;

public interface AccountService {
	
	public List<AccountVO> select() throws Exception;

	public AccountVO accountDetail(String userName) throws Exception;
}
