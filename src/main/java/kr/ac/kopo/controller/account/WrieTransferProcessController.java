package kr.ac.kopo.controller.account;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.biz.account.AccountService;
import kr.ac.kopo.controller.biz.account.AccountVO;
import kr.ac.kopo.controller.biz.transfer.TransferDAO;
import kr.ac.kopo.controller.biz.transfer.TransferVO;

public class WrieTransferProcessController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String myAccountNo = request.getParameter("myAccountNo");
		String myBankCode = "BGH";
		String yourAccountNo = request.getParameter("yourAccountNo");
		String yourBankCode = request.getParameter("yourBankCode");
		String detail = "출금";
		String amount = request.getParameter("amount");
		
		String password = request.getParameter("password");
		AccountVO account = new AccountVO();
		account.setAccountNo(myAccountNo);
		AccountService service = new AccountService();
		account = service.getAccount(account);
		String name = account.getUserName();
		if(account.getPassword() != Integer.parseInt(password)) {
			request.setAttribute("msg", "계좌 비밀번호를 잘못입력하였습니다.");
			return "main.do";
		}
		
		TransferVO vo = new TransferVO();
		TransferDAO dao = new TransferDAO();
		vo.setMyAccountNo(myAccountNo);
		vo.setMyBankCode(myBankCode);
		vo.setYourAccountNo(yourAccountNo);
		vo.setYourBankCode(yourBankCode);
		vo.setDetail(detail);
		vo.setAmount(Integer.parseInt(amount));
		int success = dao.transfer(vo, name);
		
		
		if(success==1) {
			request.setAttribute("msg", "이체를 완료하였습니다.");
		} else {			
			request.setAttribute("msg", "이체에 실패하였습니다.");
		}
		return "main.do";			
	}
}

