package kr.ac.kopo.controller.biz.userList;

import java.sql.Connection;
import java.sql.PreparedStatement;

import kr.ac.kopo.controller.biz.JDBCUtil;

public class UserListDAO {

	private Connection conn;
	private PreparedStatement stmt;
	
	private static String USERLIST_INSERT = "insert into B_USERLIST (userlist_no, user_id, userlist_use) values (seq_b_userlist_userlist_no.nextval, ?, 'O') ";
	private static String USERLIST_DELETE = "update B_USERLIST set userlist_use='X' where user_id=? ";
	
	public void insertUser(UserListVO listvo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USERLIST_INSERT);
			stmt.setString(1, listvo.getId());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}


	public void deletUser(UserListVO listvo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USERLIST_DELETE);
			stmt.setString(1, listvo.getId());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
}
