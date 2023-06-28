package kr.ac.kopo.controller.biz.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.controller.biz.JDBCUtil;

public class ProductDAO {
	
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;

	private static String PRODUCT_LIST = "select * from B_PRODUCT ";
	
	
	
	
	public List<ProductVO> getProductList(ProductVO vo) {
		List<ProductVO> productList = new ArrayList<ProductVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(PRODUCT_LIST);
			rs = stmt.executeQuery();
			while (rs.next()) {
				ProductVO product = new ProductVO();
				product.setNo(rs.getInt("PRODUCT_NO"));
				product.setName(rs.getString("PRODUCT_NAME"));
				product.setInterest(rs.getString("PRODUCT_INTEREST"));
				product.setPossible(rs.getString("PRODUCT_POSSIBLE"));
				productList.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return productList;
	}




	public void productPossible(ProductVO vo) {
		// TODO Auto-generated method stub
		
	}

}
