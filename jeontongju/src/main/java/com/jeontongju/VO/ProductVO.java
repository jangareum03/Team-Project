package com.jeontongju.VO;

import java.util.Date;

public class ProductVO {
	private String pNo;
	private String pName;
	private int pPrice;
	private int pCount;
	private String pInfo;
	private int pSales;
	private String pImg;
	private String pThumbImg;
	
//	---------------------------------------------카테고리
	
	private String cateName;
	private String cateCode;

//----------------------------------------------상품평
	private int cNO;
	private String cContent;
	private Date cDate;
	private String userId;
//	---------------------------------------------검색
	private String searchType = "";
	private String keyword = "";
	public String getpNo() {
		return pNo;
	}
	public void setpNo(String pNo) {
		this.pNo = pNo;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public int getpCount() {
		return pCount;
	}
	public void setpCount(int pCount) {
		this.pCount = pCount;
	}
	public String getpInfo() {
		return pInfo;
	}
	public void setpInfo(String pInfo) {
		this.pInfo = pInfo;
	}
	public int getpSales() {
		return pSales;
	}
	public void setpSales(int pSales) {
		this.pSales = pSales;
	}
	public String getpImg() {
		return pImg;
	}
	public void setpImg(String pImg) {
		this.pImg = pImg;
	}
	public String getpThumbImg() {
		return pThumbImg;
	}
	public void setpThumbImg(String pThumbImg) {
		this.pThumbImg = pThumbImg;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public int getcNO() {
		return cNO;
	}
	public void setcNO(int cNO) {
		this.cNO = cNO;
	}
	public String getcContent() {
		return cContent;
	}
	public void setcContent(String cContent) {
		this.cContent = cContent;
	}
	public Date getcDate() {
		return cDate;
	}
	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "ProductVO [pNo=" + pNo + ", pName=" + pName + ", pPrice=" + pPrice + ", pCount=" + pCount + ", pInfo="
				+ pInfo + ", pSales=" + pSales + ", pImg=" + pImg + ", pThumbImg=" + pThumbImg + ", cateName="
				+ cateName + ", cateCode=" + cateCode + ", cNO=" + cNO + ", cContent=" + cContent + ", cDate=" + cDate
				+ ", userId=" + userId + ", searchType=" + searchType + ", keyword=" + keyword + "]";
	}

}
