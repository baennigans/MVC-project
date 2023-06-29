package kr.ac.kopo.controller.account;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.biz.account.AccountService;
import kr.ac.kopo.controller.biz.account.AccountVO;

public class TransferAccountController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		String id = request.getParameter("id");

		AccountVO vo = new AccountVO();
		vo.setId(id);

		AccountService service = new AccountService();

		List<AccountVO> accountList = service.myAccountList(vo);

		request.setAttribute("accountList", accountList);

		return "/jsp/account/transferAccount.jsp";
	}

}