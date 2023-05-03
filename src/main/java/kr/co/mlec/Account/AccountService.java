package kr.co.mlec.Account;

import java.util.List;

import kr.co.mlec.VO.AccountVO;
import kr.co.mlec.VO.CriteriaVO;

public interface AccountService {
	
	public List<AccountVO> select() throws Exception;

	public AccountVO accountDetail(String userName) throws Exception;

	public List<AccountVO> accountSelectPaging(CriteriaVO cri) throws Exception;

	public int getAccountTotalNum(CriteriaVO cri) throws Exception;
}
