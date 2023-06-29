package kr.ac.kopo.controller.biz.account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.ac.kopo.controller.biz.JDBCUtil;

public class AccountDAO {

	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	
	private static String ACCOUNT_INSERT = "insert into B_ACCOUNT (account_no, user_id, user_name, account_name, product_no, account_pw, account_balance) "
			+ "values (?, ?, ?, ?, ?, ?, '0') ";
	
	
	
	public void insertAccount(AccountVO vo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(ACCOUNT_INSERT);
			stmt.setString(1, vo.getAccountNo());
			stmt.setString(2, vo.getId());
			stmt.setString(3, vo.getUserName());
			stmt.setString(4, vo.getAccountName());
			stmt.setInt(5, vo.getProductNo());
			stmt.setInt(6, vo.getPassword());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	
	
	
}
