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
	private static String PRODUCT_POSSIBLE = "update B_PRODUCT set product_possible='1' where product_no=? ";
	private static String PRODUCT_IMPOSSIBLE = "update B_PRODUCT set product_possible='0' where product_no=? ";
	private static String PRODUCT_INSERT = "insert into B_PRODUCT (product_no, product_name, product_interest, product_possible) "
			+ "values (seq_b_product_product_no.nextval, ?, ?, ?) ";
	
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
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(PRODUCT_POSSIBLE);
			stmt.setInt(1, vo.getNo());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	public void productImpossible(ProductVO vo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(PRODUCT_IMPOSSIBLE);
			stmt.setInt(1, vo.getNo());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	public void insertProduct(ProductVO vo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(PRODUCT_INSERT);
			stmt.setString(1, vo.getName());
			stmt.setString(2, vo.getInterest());
			stmt.setString(3, vo.getPossible());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
}
