package kr.ac.kopo.controller.account;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.biz.account.AccountService;
import kr.ac.kopo.controller.biz.account.AccountVO;
import kr.ac.kopo.controller.biz.accountList.AccountListDAO;
import kr.ac.kopo.controller.biz.accountList.AccountListVO;

public class DeleteAccountProcessController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		String accountNo = request.getParameter("accountNo");

		AccountVO vo = new AccountVO();
		vo.setAccountNo(accountNo);
		AccountService service = new AccountService();
		service.deleteAccount(vo);
		
		AccountListVO listvo = new AccountListVO();
		listvo.setAccountNo(accountNo);
		AccountListDAO dao = new AccountListDAO();
		dao.deleteAccount(listvo);
		
		request.setAttribute("msg", "해지가 완료되었습니다.");
		return "main.do";
	}

}