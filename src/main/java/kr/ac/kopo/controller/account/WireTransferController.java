package kr.ac.kopo.controller.account;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.biz.account.AccountService;
import kr.ac.kopo.controller.biz.account.AccountVO;
import kr.ac.kopo.controller.biz.openbank.OpenbankDAO;
import kr.ac.kopo.controller.biz.openbank.OpenbankVO;

public class WireTransferController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		String accountNo = request.getParameter("accountNo");
		
		AccountVO vo = new AccountVO();
		vo.setAccountNo(accountNo);
		AccountService service = new AccountService();
		vo = service.getAccount(vo);
		
		OpenbankVO bankvo = new OpenbankVO();
		OpenbankDAO bankdao = new OpenbankDAO();
		List<OpenbankVO> openbankList = bankdao.getOpenbankList(bankvo);
		
		request.setAttribute("account", vo);
		request.setAttribute("openbankList", openbankList);
		
		return "/jsp/account/wireTransfer.jsp";
	}

}