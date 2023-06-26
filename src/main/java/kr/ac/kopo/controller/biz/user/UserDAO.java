package kr.ac.kopo.controller.biz.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.controller.biz.JDBCUtil;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	
	private static String USER_INSERT = "insert into B_USER (user_id, user_pw, user_email, user_name, user_birth, user_phone, user_gender, user_agree, role) "
										+"values (?, ?, ?, ?, ?, ?, ?, '0', ?) ";
	private static String USER_GET = "select * from B_USER where user_id=? and user_pw=? ";
	private static String USER_GETID = "select * from B_USER where user_name=? and user_phone=? ";
	private static String USER_GETPW = "select * from B_USER where user_id=? and user_name=? and user_phone=? ";
	private static String USER_UPDATE = "update B_USER set user_pw=?, user_email=?, user_name=?, user_phone=? where user_id=? ";
	private static String USER_DELETE = "delete B_USER where user_id=? ";
	private static String USER_LIST = "select * from B_USER where role='0' ";
	
	
	
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


	public UserVO getUser(UserVO vo) {
		UserVO user = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_GET);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPassword());
			rs = stmt.executeQuery();
			if (rs.next()) {
				user = new UserVO();
				user.setId(rs.getString("user_id"));
				user.setPassword(rs.getString("user_pw"));
				user.setEmail(rs.getString("user_email"));
				user.setName(rs.getString("user_name"));
				user.setBirth(rs.getString("user_birth"));
				user.setPhone(rs.getString("user_phone"));
				user.setGender(rs.getString("user_gender"));
				user.setAgree(rs.getString("user_agree"));
				user.setRole(rs.getString("role"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
		return user;
	}


	public UserVO getUserID(UserVO vo) {
		UserVO user = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_GETID);
			stmt.setString(1, vo.getName());
			stmt.setString(2, vo.getPhone());
			rs = stmt.executeQuery();
			if (rs.next()) {
				user = new UserVO();
				user.setId(rs.getString("user_id"));
				user.setPassword(rs.getString("user_pw"));
				user.setEmail(rs.getString("user_email"));
				user.setName(rs.getString("user_name"));
				user.setBirth(rs.getString("user_birth"));
				user.setPhone(rs.getString("user_phone"));
				user.setGender(rs.getString("user_gender"));
				user.setAgree(rs.getString("user_agree"));
				user.setRole(rs.getString("role"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
		return user;
	}


	public UserVO getUserPW(UserVO vo) {
		UserVO user = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_GETPW);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getName());
			stmt.setString(3, vo.getPhone());
			rs = stmt.executeQuery();
			if (rs.next()) {
				user = new UserVO();
				user.setId(rs.getString("user_id"));
				user.setPassword(rs.getString("user_pw"));
				user.setEmail(rs.getString("user_email"));
				user.setName(rs.getString("user_name"));
				user.setBirth(rs.getString("user_birth"));
				user.setPhone(rs.getString("user_phone"));
				user.setGender(rs.getString("user_gender"));
				user.setAgree(rs.getString("user_agree"));
				user.setRole(rs.getString("role"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
		return user;
	}


	public void updateUser(UserVO vo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_UPDATE);
			stmt.setString(1, vo.getPassword());
			stmt.setString(2, vo.getEmail());
			stmt.setString(3, vo.getName());
			stmt.setString(4, vo.getPhone());
			stmt.setString(5, vo.getId());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}


	public void deleteUser(UserVO vo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_DELETE);
			stmt.setString(1, vo.getId());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}


	public List<UserVO> getUserList() {
		List<UserVO> userList = new ArrayList<UserVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_LIST);
			rs = stmt.executeQuery();
			while (rs.next()) {
				UserVO user = new UserVO();
				user.setId(rs.getString("USER_ID"));
				user.setPassword(rs.getString("USER_PW"));
				user.setEmail(rs.getString("USER_EMAIL"));
				user.setName(rs.getString("USER_NAME"));
				user.setBirth(rs.getString("USER_BIRTH"));
				user.setPhone(rs.getString("USER_PHONE"));
				user.setGender(rs.getString("USER_GENDER"));
				user.setAgree(rs.getString("USER_AGREE"));
				userList.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return userList;
	}

}
