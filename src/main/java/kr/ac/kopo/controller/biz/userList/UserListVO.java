package kr.ac.kopo.controller.biz.userList;

public class UserListVO {
	private int no;
	private String id;
	private String use;
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUse() {
		return use;
	}
	public void setUse(String use) {
		this.use = use;
	}
	
	@Override
	public String toString() {
		return "UserListDAO [no=" + no + ", id=" + id + ", use=" + use + "]";
	}
}
