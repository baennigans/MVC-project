package kr.ac.kopo.controller.account;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.biz.account.AccountService;
import kr.ac.kopo.controller.biz.account.AccountVO;

public class DeleteAccountController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		String login = (String) session.getAttribute("login");
		String agree = (String) session.getAttribute("agree");
		
		if(!"true".equals(login)) {
			request.setAttribute("msg", "회원로그인을 진행해주세요");
			return "login.do";
		}
		if(!"1".equals(agree)) {
			request.setAttribute("msg", "약관동의를 하셔야 이용하실 수 있습니다.");
			return "agree.do";
		}
		
		String id = request.getParameter("id");
		AccountVO vo = new AccountVO();
		vo.setId(id);

		AccountService service = new AccountService();
		List<AccountVO> accountList = service.deletePossibleAccount(vo);

		request.setAttribute("accountList", accountList);

		return "/jsp/account/deleteAccount.jsp";
	}

}