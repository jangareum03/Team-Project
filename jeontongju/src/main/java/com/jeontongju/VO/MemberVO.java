package com.jeontongju.VO;

import java.sql.Date;

public class MemberVO {

	private String userId;
	private String userPass;
	private String userName;
	private String userEmail;
	private String userPhone;
	private int userPostCode;
	private String userAddr;
	private String userDetailAddr;
	private Date userBday;
	private int verify;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public int getUserPostCode() {
		return userPostCode;
	}
	public void setUserPostCode(int userPostCode) {
		this.userPostCode = userPostCode;
	}
	public String getUserAddr() {
		return userAddr;
	}
	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}
	public String getUserDetailAddr() {
		return userDetailAddr;
	}
	public void setUserDetailAddr(String userDetailAddr) {
		this.userDetailAddr = userDetailAddr;
	}
	public Date getUserBday() {
		return userBday;
	}
	public void setUserBday(Date userBday) {
		this.userBday = userBday;
	}
	public int getVerify() {
		return verify;
	}
	public void setVerify(int verify) {
		this.verify = verify;
	}
	
	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", userPass=" + userPass + ", userName=" + userName + ", userEmail="
				+ userEmail + ", userPhone=" + userPhone + ", userPostCode=" + userPostCode + ", userAddr=" + userAddr
				+ ", userDetailAddr=" + userDetailAddr + ", userBday=" + userBday + ", verify=" + verify + "]";
	}

	
}
