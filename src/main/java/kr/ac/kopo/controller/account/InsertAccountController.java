package kr.ac.kopo.controller.account;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.biz.product.ProductDAO;
import kr.ac.kopo.controller.biz.product.ProductVO;

public class InsertAccountController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		ProductVO vo = new ProductVO();
		ProductDAO dao = new ProductDAO();
		
		List<ProductVO> productList = dao.getProductPossible(vo);
		
		request.setAttribute("productList", productList);
		
		return "/jsp/account/insertAccount.jsp";
	}
}