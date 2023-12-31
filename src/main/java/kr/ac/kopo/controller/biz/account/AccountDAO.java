package kr.ac.kopo.controller.biz.account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.controller.biz.JDBCUtil;

public class AccountDAO {

	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	
	private static String ACCOUNT_INSERT = "insert into B_ACCOUNT (account_no, user_id, user_name, account_name, product_no, account_pw, account_balance, bank_code) "
			+ "values (?, ?, ?, ?, ?, ?, '0', 'BGH' ) ";
	private static String MYACCOUNT_LIST = "select * from B_ACCOUNT where user_id=? ";
	private static String DELETE_POSSIBLE = "select * from B_ACCOUNT where user_id=? and account_balance='0' ";
	private static String ACCOUNT_DELETE = "delete B_ACCOUNT where account_no=? ";
	private static String ACCOUNT_GET = "select * from B_ACCOUNT where account_no=? ";
	private static String ACCOUNT_LIST = "select * from B_ACCOUNT ";
	
	
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



	public List<AccountVO> myAccountList(AccountVO vo) {
		List<AccountVO> accountList = new ArrayList<AccountVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MYACCOUNT_LIST);
			stmt.setString(1, vo.getId());
			rs = stmt.executeQuery();
			while (rs.next()) {
				AccountVO account = new AccountVO();
				account.setAccountNo(rs.getString("ACCOUNT_NO"));
				account.setId(rs.getString("USER_ID"));
				account.setUserName(rs.getString("USER_NAME"));
				account.setAccountName(rs.getString("ACCOUNT_NAME"));
				account.setProductNo(rs.getInt("PRODUCT_NO"));
				account.setPassword(rs.getInt("ACCOUNT_PW"));
				account.setBalance(rs.getInt("ACCOUNT_BALANCE"));
				accountList.add(account);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return accountList;
	}



	public List<AccountVO> deletePossibleAccount(AccountVO vo) {
		List<AccountVO> accountList = new ArrayList<AccountVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(DELETE_POSSIBLE);
			stmt.setString(1, vo.getId());
			rs = stmt.executeQuery();
			while (rs.next()) {
				AccountVO account = new AccountVO();
				account.setAccountNo(rs.getString("ACCOUNT_NO"));
				account.setId(rs.getString("USER_ID"));
				account.setUserName(rs.getString("USER_NAME"));
				account.setAccountName(rs.getString("ACCOUNT_NAME"));
				account.setProductNo(rs.getInt("PRODUCT_NO"));
				account.setPassword(rs.getInt("ACCOUNT_PW"));
				account.setBalance(rs.getInt("ACCOUNT_BALANCE"));
				accountList.add(account);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return accountList;
	}



	public void deleteAccount(AccountVO vo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(ACCOUNT_DELETE);
			stmt.setString(1, vo.getAccountNo());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}



	public AccountVO getAccount(AccountVO vo) {
		AccountVO account = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(ACCOUNT_GET);
			stmt.setString(1, vo.getAccountNo());
			rs = stmt.executeQuery();
			if (rs.next()) {
				account = new AccountVO();
				account.setAccountNo(rs.getString("account_no"));
				account.setId(rs.getString("user_id"));
				account.setUserName(rs.getString("user_name"));
				account.setAccountName(rs.getString("account_name"));
				account.setPassword(rs.getInt("account_pw"));
				account.setBalance(rs.getInt("account_balance"));
				account.setBank(rs.getString("bank_code"));
				account.setProductNo(rs.getInt("product_no"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
		return account;
	}



	public List<AccountVO> getAccountList(AccountVO vo) {
		List<AccountVO> accountList = new ArrayList<AccountVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(ACCOUNT_LIST);
			rs = stmt.executeQuery();
			while (rs.next()) {
				AccountVO account = new AccountVO();
				account.setAccountNo(rs.getString("ACCOUNT_NO"));
				account.setId(rs.getString("USER_ID"));
				account.setUserName(rs.getString("USER_NAME"));
				account.setAccountName(rs.getString("ACCOUNT_NAME"));
				account.setProductNo(rs.getInt("PRODUCT_NO"));
				account.setPassword(rs.getInt("ACCOUNT_PW"));
				account.setBalance(rs.getInt("ACCOUNT_BALANCE"));
				accountList.add(account);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return accountList;
	}
}
