package kr.co.mlec.Account;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mlec.VO.AccountVO;

@Repository
public class AccountDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<AccountVO> select() {
		return sqlSessionTemplate.selectList("kr.co.mlec.Account.AccountDAO.select");
	}

	public AccountVO accountDetail(String userName) {
		return sqlSessionTemplate.selectOne("kr.co.mlec.Account.AccountDAO.accountDetail", userName);
	}

}
