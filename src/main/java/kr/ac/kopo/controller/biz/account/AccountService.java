package kr.ac.kopo.controller.biz.account;

public class AccountService {

	private AccountDAO accountDao;

	public AccountService() {
		accountDao = new AccountDAO();
	}
	
	public void insertAccount(AccountVO vo) {
		accountDao.insertAccount(vo);
	}
	
	
}

