package kr.ac.kopo.controller.biz.account;

public class AccountVO {
	private String accountNo;
	private String id;
	private String userName;
	private String accountName;
	private int productNo;
	private int password;
	private int balance;
	private String bank;
	
	
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	
	
	@Override
	public String toString() {
		return "AccountVO [accountNo=" + accountNo + ", id=" + id + ", userName=" + userName + ", accountName="
				+ accountName + ", productNo=" + productNo + ", password=" + password + ", balance=" + balance
				+ ", bank=" + bank + "]";
	}
	
}
