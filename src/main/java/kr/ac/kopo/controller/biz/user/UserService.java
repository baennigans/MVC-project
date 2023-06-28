package kr.ac.kopo.controller.biz.user;

import java.util.List;

public class UserService {

	private UserDAO userDao;
	
	public UserService() {
		userDao = new UserDAO();
	}
	
	public void insertUser(UserVO vo) {
		userDao.insertUser(vo);
	}

	public UserVO getUser(UserVO vo) {
		UserVO user = userDao.getUser(vo);
		return user;
	}

	public UserVO getUserID(UserVO vo) {
		UserVO user = userDao.getUserID(vo);
		return user;
	}

	public UserVO getUserPW(UserVO vo) {
		UserVO user = userDao.getUserPW(vo);
		return user;
	}

	public void updateUser(UserVO vo) {
		userDao.updateUser(vo);
	}

	public void deleteUser(UserVO vo) {
		userDao.deleteUser(vo);
	}

	public List<UserVO> getUserList(UserVO vo) {
		List<UserVO> userList = userDao.getUserList();
		return userList;
	}

	public void agreeUser(UserVO vo) {
		userDao.agreeUser(vo);
	}
}
