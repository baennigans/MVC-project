package kr.ac.kopo.controller.account;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.biz.transfer.TransferDAO;
import kr.ac.kopo.controller.biz.transfer.TransferVO;

public class GetTransferController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		String accountNo = request.getParameter("accountNo");
		
		TransferVO vo = new TransferVO();
		vo.setMyAccountNo(accountNo);
		
		TransferDAO dao = new TransferDAO();
		
		List<TransferVO> transferList = dao.transferList(vo);
		
		request.setAttribute("transferList", transferList);
		
		return "/jsp/account/getTransfer.jsp";
	}

}