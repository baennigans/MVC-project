package kr.ac.kopo.controller.biz.transfer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.controller.biz.JDBCUtil;

public class TransferDAO {

	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	
	private static String TRANSFER_LIST = "select * from B_TRANSFER where myaccount_no=? ";
	
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

}
