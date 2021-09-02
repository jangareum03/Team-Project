package com.jeontongju.VO;


public class CartVO {
	private String cId;
	private String userId;
	private String pNo;
	private int count;
	public String getcId() {
		return cId;
	}
	public void setcId(String cId) {
		this.cId = cId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getpNo() {
		return pNo;
	}
	public void setpNo(String pNo) {
		this.pNo = pNo;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "CartVO [cId=" + cId + ", userId=" + userId + ", pNo=" + pNo + ", count=" + count + "]";
	}
	
	
	
}
