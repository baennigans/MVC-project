package kr.ac.kopo.controller.biz.openbank;

public class OpenbankVO {
	
	private String bank;
	private String name;
	
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return "OpenbankVO [bank=" + bank + ", name=" + name + "]";
	}
}
