package kr.ac.kopo.controller.biz.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.controller.biz.JDBCUtil;

public class NoticeDAO {
	
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	private static final int LIST_SIZE = 15;

	private static String NOTICE_INSERT = "insert into B_NOTICE (notice_no, user_id, notice_title, notice_detail) values (seq_b_notice_notice_no.nextval, ?, ?, ?) ";
	private static String NOTICE_LIST = "select * from B_NOTICE order by notice_no desc ";
	private static String NOTICE_GET = "select * from B_NOTICE where notice_no=? ";
	private static String NOTICE_UPDATE = "update B_NOTICE set notice_title=?, notice_detail=? where notice_no=? ";
	private static String NOTICE_DELETE = "delete B_NOTICE where notice_no=? ";
	private static String NOTICE_SEARCH = "select * from B_NOTICE where notice_title like ? or user_id=? ";
	private static String NOTICE_SELECT = "select * from (select rownum rnum, b.* from (select a.* from B_NOTICE a order by notice_no desc)b ) where rnum >=? and rnum<= ? ";
	private static String NOTICE_COUNT = "select count(*) cnt from b_notice";
	
	
	public List<NoticeVO> selectNotice(int pageNo) {
		int start = (pageNo -1) * LIST_SIZE + 1;
		int end   = pageNo      * LIST_SIZE;
		
		List<NoticeVO> noticeList = new ArrayList<NoticeVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(NOTICE_SELECT);
			stmt.setInt(1, start);
			stmt.setInt(2, end);
			rs = stmt.executeQuery();
			while (rs.next()) {
				NoticeVO notice = new NoticeVO();
				notice.setNo(rs.getInt("NOTICE_NO"));
				notice.setId(rs.getString("USER_ID"));
				notice.setTitle(rs.getString("NOTICE_TITLE"));
				notice.setDetail(rs.getString("NOTICE_DETAIL"));
				notice.setDate(rs.getDate("NOTICE_DATE"));
				noticeList.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
			}
		return noticeList;
	}
	
	
	public int selectNoticeCount() {
		int totalCount = 0;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(NOTICE_COUNT);
			rs = stmt.executeQuery();
			rs.next();
			totalCount = rs.getInt("cnt");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return totalCount;
	}	
	
	
	public void insertNotice(NoticeVO vo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(NOTICE_INSERT);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getTitle());
			stmt.setString(3, vo.getDetail());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	public List<NoticeVO> getNoticeList() {
		List<NoticeVO> noticeList = new ArrayList<NoticeVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(NOTICE_LIST);
			rs = stmt.executeQuery();
			while (rs.next()) {
				NoticeVO notice = new NoticeVO();
				notice.setNo(rs.getInt("NOTICE_NO"));
				notice.setId(rs.getString("USER_ID"));
				notice.setTitle(rs.getString("NOTICE_TITLE"));
				notice.setDetail(rs.getString("NOTICE_DETAIL"));
				notice.setDate(rs.getDate("NOTICE_DATE"));
				noticeList.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return noticeList;
	}

	public NoticeVO getNotice(NoticeVO vo) {
		NoticeVO notice = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(NOTICE_GET);
			stmt.setInt(1, vo.getNo());
			rs = stmt.executeQuery();
			if (rs.next()) {
				notice = new NoticeVO();
				notice.setNo(rs.getInt("NOTICE_NO"));
				notice.setId(rs.getString("USER_ID"));
				notice.setTitle(rs.getString("NOTICE_TITLE"));
				notice.setDetail(rs.getString("NOTICE_DETAIL"));
				notice.setDate(rs.getDate("NOTICE_DATE"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return notice;
	}

	public void updateNotice(NoticeVO vo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(NOTICE_UPDATE);
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getDetail());
			stmt.setInt(3, vo.getNo());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	public void deleteNotice(NoticeVO vo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(NOTICE_DELETE);
			stmt.setInt(1, vo.getNo());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	public List<NoticeVO> searchNoticeList(NoticeVO vo) {
		List<NoticeVO> noticeList = new ArrayList<NoticeVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(NOTICE_SEARCH);
			stmt.setString(1, "%"+vo.getTitle()+"%");
			stmt.setString(2, vo.getId());
			rs = stmt.executeQuery();
			while (rs.next()) {
				NoticeVO notice = new NoticeVO();
				notice.setNo(rs.getInt("NOTICE_NO"));
				notice.setId(rs.getString("USER_ID"));
				notice.setTitle(rs.getString("NOTICE_TITLE"));
				notice.setDetail(rs.getString("NOTICE_DETAIL"));
				notice.setDate(rs.getDate("NOTICE_DATE"));
				noticeList.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return noticeList;
	}
}
