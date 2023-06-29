package kr.ac.kopo.controller.biz.openbank;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.controller.biz.JDBCUtil;

public class OpenbankDAO {

	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	
	private static String OPENBANK_LIST = "select * from B_OPENBANK ";
	
	
	public List<OpenbankVO> getOpenbankList(OpenbankVO bankvo) {
		List<OpenbankVO> openbankList = new ArrayList<OpenbankVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(OPENBANK_LIST);
			rs = stmt.executeQuery();
			while (rs.next()) {
				OpenbankVO openbank = new OpenbankVO();
				openbank.setBank(rs.getString("BANK_CODE"));
				openbank.setName(rs.getString("BANK_NAME"));
				openbankList.add(openbank);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return openbankList;
	}
}
