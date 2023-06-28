package kr.ac.kopo.controller.biz.account;

public class AccountVO {
	private String accountNo;
	private String userName;
	private String accountName;
	private int productNo;
	private int password;
	private int balance;
	
	
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getPassword() {
		return password;
	}
	public void setPassword(int password) {
		this.password = password;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	
	@Override
	public String toString() {
		return "AccountVO [accountNo=" + accountNo + ", userName=" + userName + ", accountName=" + accountName
				+ ", productNo=" + productNo + ", password=" + password + ", balance=" + balance + "]";
	}
}
