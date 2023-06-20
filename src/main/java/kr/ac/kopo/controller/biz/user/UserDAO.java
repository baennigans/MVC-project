package kr.ac.kopo.controller.biz.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.ac.kopo.controller.biz.JDBCUtil;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	
	private static String USER_INSERT = "insert into B_USER (user_id, user_pw, user_email, user_name, user_birth, user_phone, user_gender, user_agree, role) "
										+"values (?, ?, ?, ?, ?, ?, ?, '0', ?) ";
	
	
	public void insertUser(UserVO vo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_INSERT);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPassword());
			stmt.setString(3, vo.getEmail());
			stmt.setString(4, vo.getName());
			stmt.setString(5, vo.getBirth());
			stmt.setString(6, vo.getPhone());
			stmt.setString(7, vo.getGender());
			stmt.setString(8, vo.getRole());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
}
