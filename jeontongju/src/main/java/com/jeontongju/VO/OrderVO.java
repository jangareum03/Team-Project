package com.jeontongju.VO;

import java.util.Date;

public class OrderVO {
	private int cId;					//장바구니 번호
	private String oId;				//주문번호
	private int orderDetailsId;		//주문내역상세 번호
	private String userId;			//사용자 아이디
	private String userName; 		// 사용자이름
	private String userAddr;			// 사용자 주소
	private String userPhone;		// 사용자 번호
	private String rName;			//보내는분 이름
	private String rAddr;			//보내는분 주소
	private String rPhone;			//보내는분 번호
	private String oMemo;			//요구사항
	private String pNo;				//상품번호
	private String pImg;				//상품이미지
	private String pName;			//상품이름
	private String pInfo;			//상품정보
	private int pPrice;				//상품 가격
	private int count;				//구매 수량
	private int oTotal;				//총 결제금액
	private Date oDate;				//구매날짜
	private String delivery;			//결제상태
	
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	public String getoId() {
		return oId;
	}
	public void setoId(String oId) {
		this.oId = oId;
	}
	public int getOrderDetailsId() {
		return orderDetailsId;
	}
	public void setOrderDetailsId(int orderDetailsId) {
		this.orderDetailsId = orderDetailsId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserAddr() {
		return userAddr;
	}
	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getrName() {
		return rName;
	}
	public void setrName(String rName) {
		this.rName = rName;
	}
	public String getrAddr() {
		return rAddr;
	}
	public void setrAddr(String rAddr) {
		this.rAddr = rAddr;
	}
	public String getrPhone() {
		return rPhone;
	}
	public void setrPhone(String rPhone) {
		this.rPhone = rPhone;
	}
	public String getoMemo() {
		return oMemo;
	}
	public void setoMemo(String oMemo) {
		this.oMemo = oMemo;
	}
	public String getpNo() {
		return pNo;
	}
	public void setpNo(String pNo) {
		this.pNo = pNo;
	}
	public String getpImg() {
		return pImg;
	}
	public void setpImg(String pImg) {
		this.pImg = pImg;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpInfo() {
		return pInfo;
	}
	public void setpInfo(String pInfo) {
		this.pInfo = pInfo;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getoTotal() {
		return oTotal;
	}
	public void setoTotal(int oTotal) {
		this.oTotal = oTotal;
	}
	public Date getoDate() {
		return oDate;
	}
	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	
	@Override
	public String toString() {
		return "OrderVO [cId=" + cId + ", oId=" + oId + ", orderDetailsId=" + orderDetailsId + ", userId=" + userId
				+ ", userName=" + userName + ", userAddr=" + userAddr + ", userPhone=" + userPhone + ", rName=" + rName
				+ ", rAddr=" + rAddr + ", rPhone=" + rPhone + ", oMemo=" + oMemo + ", pNo=" + pNo + ", pImg=" + pImg
				+ ", pName=" + pName + ", pInfo=" + pInfo + ", pPrice=" + pPrice + ", count=" + count + ", oTotal="
				+ oTotal + ", oDate=" + oDate + ", delivery=" + delivery + "]";
	}

	
}
