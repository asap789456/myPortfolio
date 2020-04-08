package play;

public class PlayReserveBean {
	
	private int cinemaNo; //극장번호
	private String playDate; //공연일자
	private String seat; //좌석
	private int playNo; // 연극번호
	private String userID; //아이디
	private String reservationDate; //예매 날짜
	private int price; //결제가격
	private String playName;//연극명
	private String playImg;//연극이미지
	private String cinemaName;//극장명
	private String time;//연극회차시간
	
	public int getCinemaNo() {
		return cinemaNo;
	}
	public void setCinemaNo(int cinemaNo) {
		this.cinemaNo = cinemaNo;
	}
	public String getPlayDate() {
		return playDate;
	}
	public void setPlayDate(String playDate) {
		this.playDate = playDate;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public int getPlayNo() {
		return playNo;
	}
	public void setPlayNo(int playNo) {
		this.playNo = playNo;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getReservationDate() {
		return reservationDate;
	}
	public void setReservationDate(String reservationDate) {
		this.reservationDate = reservationDate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getCinemaName() {
		return cinemaName;
	}
	public void setCinemaName(String cinemaName) {
		this.cinemaName = cinemaName;
	}
	public String getPlayName() {
		return playName;
	}
	public void setPlayName(String playName) {
		this.playName = playName;
	}
	public String getPlayImg() {
		return playImg;
	}
	public void setPlayImg(String playImg) {
		this.playImg = playImg;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	
	
}
