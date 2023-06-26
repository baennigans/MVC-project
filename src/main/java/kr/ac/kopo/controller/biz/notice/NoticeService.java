package kr.ac.kopo.controller.biz.notice;

import java.util.List;

public class NoticeService {
	
	private NoticeDAO noticeDao;
	
	public NoticeService() {
		noticeDao = new NoticeDAO();
	}

	public void insertNotice(NoticeVO vo) {
		noticeDao.insertNotice(vo);
		
	}

	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		List<NoticeVO> noticeList = noticeDao.getNoticeList();
		return noticeList;
	}

	public NoticeVO getNotice(NoticeVO vo) {
		NoticeVO notice = noticeDao.getNotice(vo);
		return notice;
	}

	public void updateNotice(NoticeVO vo) {
		noticeDao.updateNotice(vo);		
	}

	public void deleteNotice(NoticeVO vo) {
		noticeDao.deleteNotice(vo);
	}

	public List<NoticeVO> searchNoticeList(NoticeVO vo) {
		List<NoticeVO> noticeList = noticeDao.searchNoticeList(vo);
		return noticeList;
	}

	public List<NoticeVO> selectNotice(int pageNo) {
		List<NoticeVO> noticeList = noticeDao.selectNotice(pageNo);
		return noticeList;
	}

	public int selectNoticeCount() {
		int totalCount = noticeDao.selectNoticeCount();
		return totalCount;
	}
	
}
