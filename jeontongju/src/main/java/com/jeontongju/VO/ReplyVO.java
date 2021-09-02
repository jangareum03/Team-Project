package com.jeontongju.VO;

import java.sql.Date;

public class ReplyVO {
	private int qNo;
	private int rNo;
	private String rContent;
	private String rWriter;
	private Date rDate;
	
	public int getqNo() {
		return qNo;
	}
	public void setqNo(int qNo) {
		this.qNo = qNo;
	}
	public int getrNo() {
		return rNo;
	}
	public void setrNo(int rNo) {
		this.rNo = rNo;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public String getrWriter() {
		return rWriter;
	}
	public void setrWriter(String rWriter) {
		this.rWriter = rWriter;
	}
	public Date getrDate() {
		return rDate;
	}
	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}
	@Override
	public String toString() {
		return "ReplyVO [qNo=" + qNo + ", rNo=" + rNo + ", rContent=" + rContent + ", rWriter=" + rWriter + ", rDate="
				+ rDate + "]";
	}
	
}
