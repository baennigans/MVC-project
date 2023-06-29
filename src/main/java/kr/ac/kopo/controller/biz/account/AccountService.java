package kr.ac.kopo.controller.biz.account;

import java.util.List;

public class AccountService {

	private AccountDAO accountDao;

	public AccountService() {
		accountDao = new AccountDAO();
	}
	
	public void insertAccount(AccountVO vo) {
		accountDao.insertAccount(vo);
	}

	public List<AccountVO> myAccountList(AccountVO vo) {
		List<AccountVO> accountList = accountDao.myAccountList(vo);
		return accountList;
	}

	public List<AccountVO> deletePossibleAccount(AccountVO vo) {
		List<AccountVO> accountList = accountDao.deletePossibleAccount(vo);
		return accountList;
	}

	public void deleteAccount(AccountVO vo) {
		accountDao.deleteAccount(vo);
	}

	public AccountVO getAccount(AccountVO vo) {
		AccountVO account = accountDao.getAccount(vo);
		return account;
	}
	
	
}

