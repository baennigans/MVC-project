package kr.ac.kopo.controller.account;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.biz.account.AccountService;
import kr.ac.kopo.controller.biz.account.AccountVO;

public class InsertAccountProcessController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String userName = request.getParameter("username");
		String accountName = request.getParameter("productname");
		String password = request.getParameter("password");
		
		String[] product = request.getParameter("productNo").split("\\.");
		String productNo = product[0];
		
		Random random = new Random();
		int randomNo = random.nextInt(90000)+10000;
		String accountNo = "0117-"+randomNo+"-96";
		
		System.out.println(userName);
		System.out.println(productNo);
		System.out.println(accountName);
		System.out.println(password);
		System.out.println(accountNo);
		
		AccountVO vo = new AccountVO();
		vo.setAccountNo(accountNo);
		vo.setUserName(userName);
		vo.setAccountName(accountName);
		vo.setProductNo(Integer.parseInt(productNo));
		vo.setPassword(Integer.parseInt(password));
		
		AccountService service = new AccountService();
		service.insertAccount(vo);
		
		request.setAttribute("msg", "계좌개설이 완료되었습니다.");
		
		return "getAccount.do";
	}

}