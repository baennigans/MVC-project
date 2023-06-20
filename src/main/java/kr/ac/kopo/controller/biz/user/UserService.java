package kr.ac.kopo.controller.biz.user;

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

}
