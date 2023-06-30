package kr.ac.kopo.controller.account;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.biz.account.AccountService;
import kr.ac.kopo.controller.biz.account.AccountVO;

public class AccountListController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		AccountVO vo = new AccountVO();
		AccountService service = new AccountService();
		
		List<AccountVO> accountList = service.getAccountList(vo);
		
		request.setAttribute("accountList", accountList);
		
		return "/jsp/account/accountList.jsp";
	}

}