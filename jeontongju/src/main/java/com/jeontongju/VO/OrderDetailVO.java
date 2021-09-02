package com.jeontongju.VO;

public class OrderDetailVO {
	private int orderDetailsId;
	private String oId;
	private int cId;
	private String pNo;
	private int count;

	public int getOrderDetailsId() {
		return orderDetailsId;
	}

	public void setOrderDetailsId(int orderDetailsId) {
		this.orderDetailsId = orderDetailsId;
	}

	public String getoId() {
		return oId;
	}

	public void setoId(String oId) {
		this.oId = oId;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
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
		return "OrderDetailVO [orderDetailsId=" + orderDetailsId + ", oId=" + oId + ", cId=" + cId + ", pNo=" + pNo
				+ ", count=" + count + "]";
	}
}
