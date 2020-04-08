package bbs;

public class Bbs {
	private int bbsNo;
	private String userID;
	private String bbsTitle;
	private String bbsDate;
	private String bbsContent;
	private int bbsAvailable; //게시글이 지워졌는지
	private String playName;
	private int playNo;
	private String playImg;
	private String playGrade;
	private String avgGrade;

	public int getBbsNo() {
		return bbsNo;
	}
	public void setBbsNo(int bbsNo) {
		this.bbsNo = bbsNo;
	}
	public String getBbsTitle() {
		return bbsTitle;
	}
	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
	}

	public String getBbsDate() {
		return bbsDate;
	}
	public void setBbsDate(String bbsDate) {
		this.bbsDate = bbsDate;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getBbsContent() {
		return bbsContent;
	}
	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}
	public int getBbsAvailable() {
		return bbsAvailable;
	}
	public void setBbsAvailable(int bbsAvailable) {
		this.bbsAvailable = bbsAvailable;
	}
	public String getPlayName() {
		return playName;
	}
	public void setPlayName(String playName) {
		this.playName = playName;
	}
	
	public int getPlayNo() {
		return playNo;
	}
	public void setPlayNo(int playNo) {
		this.playNo = playNo;
	}
	public String getPlayGrade() {
		return playGrade;
	}
	public void setPlayGrade(String playGrade) {
		this.playGrade = playGrade;
	}
	public String getAvgGrade() {
		return avgGrade;
	}
	public void setAvgGrade(String avgGrade) {
		this.avgGrade = avgGrade;
	}
	public String getPlayImg() {
		return playImg;
	}
	public void setPlayImg(String playImg) {
		this.playImg = playImg;
	}
	
	
}
