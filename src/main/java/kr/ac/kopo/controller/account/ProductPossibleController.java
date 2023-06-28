package kr.ac.kopo.controller.account;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.biz.product.ProductDAO;
import kr.ac.kopo.controller.biz.product.ProductVO;

public class ProductPossibleController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		String no = request.getParameter("no");
		String possible = request.getParameter("possible");
		System.out.println(no+" "+possible);
		
		ProductVO vo = new ProductVO();
		vo.setNo(Integer.parseInt(no));

		ProductDAO dao = new ProductDAO();
		dao.productPossible(vo);

		return "product.do";
	}

}