package kr.ac.kopo.controller.account;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.biz.account.AccountService;
import kr.ac.kopo.controller.biz.account.AccountVO;
import kr.ac.kopo.controller.biz.accountList.AccountListDAO;
import kr.ac.kopo.controller.biz.accountList.AccountListVO;

public class InsertAccountProcessController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String id = request.getParameter("id");
		String userName = request.getParameter("username");
		String accountName = request.getParameter("productname");
		String password = request.getParameter("password");
		
		String[] product = request.getParameter("productNo").split("\\.");
		String productNo = product[0];
		
		Random random = new Random();
		int randomNo1 = random.nextInt(9000)+1000;
		int randomNo2 = random.nextInt(90000)+10000;
		int randomNo3 = random.nextInt(90)+10;
		String accountNo = randomNo1+"-"+randomNo2+"-"+randomNo3;
		
		AccountListVO listvo = new AccountListVO();
		listvo.setAccountNo(accountNo);
		AccountListDAO listDao = new AccountListDAO();
		listDao.insertAccount(listvo);
		
		
		AccountVO vo = new AccountVO();
		vo.setAccountNo(accountNo);
		vo.setId(id);
		vo.setUserName(userName);
		vo.setAccountName(accountName);
		vo.setProductNo(Integer.parseInt(productNo));
		vo.setPassword(Integer.parseInt(password));
		AccountService service = new AccountService();
		service.insertAccount(vo);
		
		request.setAttribute("msg", "계좌개설이 완료되었습니다.");
		request.setAttribute("id", id);
		
		return "getAccount.do";
	}

}