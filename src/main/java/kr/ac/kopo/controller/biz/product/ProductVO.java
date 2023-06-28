package kr.ac.kopo.controller.biz.product;

public class ProductVO {
	private int no;
	private String name;
	private String interest;
	private String possible;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	}
	public String getPossible() {
		return possible;
	}
	public void setPossible(String possible) {
		this.possible = possible;
	}
	
	@Override
	public String toString() {
		return "ProductVO [no=" + no + ", name=" + name + ", interest=" + interest + ", possible=" + possible + "]";
	}
}
