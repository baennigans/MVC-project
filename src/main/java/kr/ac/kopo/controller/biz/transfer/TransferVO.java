package kr.ac.kopo.controller.biz.transfer;

import java.util.Date;

public class TransferVO {
	
	private int no;
	private String myAccountNo;
	private String myBankCode;
	private String yourAccountNo;
	private String yourBankCode;
	private String detail;
	private int amount;
	private Date date;
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getMyAccountNo() {
		return myAccountNo;
	}
	public void setMyAccountNo(String myAccountNo) {
		this.myAccountNo = myAccountNo;
	}
	public String getMyBankCode() {
		return myBankCode;
	}
	public void setMyBankCode(String myBankCode) {
		this.myBankCode = myBankCode;
	}
	public String getYourAccountNo() {
		return yourAccountNo;
	}
	public void setYourAccountNo(String yourAccountNo) {
		this.yourAccountNo = yourAccountNo;
	}
	public String getYourBankCode() {
		return yourBankCode;
	}
	public void setYourBankCode(String yourBankCode) {
		this.yourBankCode = yourBankCode;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
	@Override
	public String toString() {
		return "TransferVO [no=" + no + ", myAccountNo=" + myAccountNo + ", myBankCode=" + myBankCode
				+ ", yourAccountNo=" + yourAccountNo + ", yourBankCode=" + yourBankCode + ", detail=" + detail
				+ ", amount=" + amount + ", date=" + date + "]";
	}
	
}
