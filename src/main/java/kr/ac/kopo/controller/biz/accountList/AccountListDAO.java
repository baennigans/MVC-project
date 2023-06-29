package kr.ac.kopo.controller.biz.accountList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.ac.kopo.controller.biz.JDBCUtil;

public class AccountListDAO {

	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	
	private static String ACCOUNTLIST_INSERT = "insert into B_ACCOUNTLIST (accountlist_no, account_no, accountlist_possible) values (seq_b_accountlist_accountlist_no.nextval, ?, 'O')";
	
	
	public void insertAccount(AccountListVO listvo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(ACCOUNTLIST_INSERT);
			stmt.setString(1, listvo.getAccountNo());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	
	
	
	
	
}
