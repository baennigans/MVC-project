package kr.ac.kopo.controller.biz.transfer;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.controller.biz.JDBCUtil;

public class TransferDAO {

	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	
	private static String TRANSFER_LIST = "select * from B_TRANSFER where myaccount_no=? order by transfer_no desc";
	private static String TRANSFER_INSERT = "insert into B_TRANSFER (transfer_no, myaccount_no, mybank_code, youraccount_no, yourbank_code, transfer_detail, transfer_amount) values (seq_b_transfer_transfer_no.nextval, ?, 'BGH', ?, ?, '출금', ? )";
	
	public List<TransferVO> transferList(TransferVO vo) {
		List<TransferVO> transferList = new ArrayList<TransferVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(TRANSFER_LIST);
			stmt.setString(1, vo.getMyAccountNo());
			rs = stmt.executeQuery();
			while (rs.next()) {
				TransferVO transfer = new TransferVO();
				transfer.setNo(rs.getInt("TRANSFER_NO"));
				transfer.setMyAccountNo(rs.getString("MYACCOUNT_NO"));
				transfer.setMyBankCode(rs.getString("MYBANK_CODE"));
				transfer.setYourAccountNo(rs.getString("YOURACCOUNT_NO"));
				transfer.setYourBankCode(rs.getString("YOURBANK_CODE"));
				transfer.setDetail(rs.getString("TRANSFER_DETAIL"));
				transfer.setAmount(rs.getInt("TRANSFER_AMOUNT"));
				transfer.setDate(rs.getDate("TRANSFER_TIME"));
				transferList.add(transfer);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return transferList;
	}


	public void transferInsert(TransferVO vo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(TRANSFER_INSERT);
			stmt.setString(1, vo.getMyAccountNo());
			stmt.setString(2, vo.getYourAccountNo());
			stmt.setString(3, vo.getYourBankCode());
			stmt.setInt(4, vo.getAmount());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}


	public int transfer(TransferVO vo, String name) {
		int result = 0;
		StringBuilder sql = new StringBuilder();
        sql.append("{call P_BANK_TRANSFER(?, ?, ?, ?, ?, ?, ?, ?) }");
        try {
            conn = JDBCUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall(sql.toString());
            cstmt.setString(1, vo.getMyAccountNo());
            cstmt.setString(2, vo.getMyBankCode());
            cstmt.setString(3, name);
            cstmt.setString(4, vo.getYourAccountNo());
            cstmt.setString(5, vo.getYourBankCode());
            cstmt.setString(6, "null");
            cstmt.setLong(7, vo.getAmount());
            cstmt.registerOutParameter(8, Types.INTEGER);
            cstmt.execute();
            
            result = cstmt.getInt(8);
            cstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(stmt, conn);
        }
        return result;
    }
}
