package kr.ac.kopo.controller.account;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.biz.product.ProductDAO;
import kr.ac.kopo.controller.biz.product.ProductVO;

public class InsertProductProcessController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String name = request.getParameter("name");
		String interest = request.getParameter("interest1")+"."+request.getParameter("interest2");
		String possible = request.getParameter("possible");
		
		ProductVO vo = new ProductVO();
		vo.setName(name);
		vo.setInterest(interest);
		vo.setPossible(possible);
		
		ProductDAO dao = new ProductDAO();
		dao.insertProduct(vo);
		
		return "product.do";
	}

}