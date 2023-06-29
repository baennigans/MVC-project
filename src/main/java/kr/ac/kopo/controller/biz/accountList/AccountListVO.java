package kr.ac.kopo.controller.biz.accountList;

public class AccountListVO {
	private int no;
	private String accountNo;
	private String possible;
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public String getPossible() {
		return possible;
	}
	public void setPossible(String possible) {
		this.possible = possible;
	}
	
	@Override
	public String toString() {
		return "AccountListVO [no=" + no + ", accountNo=" + accountNo + ", possible=" + possible + "]";
	}
}
