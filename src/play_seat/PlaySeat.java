package play_seat;

public class PlaySeat {
	private String seatName; //ÁÂ¼®ÀÌ¸§ (A1,A2)
	private int seatAvailable; //ÁÂ¼® ¿¹¾à¿©ºÎ
	private int cinemaNo; //±ØÀå¹øÈ£
	private String cinemaName; //±ØÀåÀÌ¸§
	private String seatGrade; //ÁÂ¼®µî±Ş
	private int seatPrice; //±ØÀå¹øÈ£
	
	public String getSeatName() {
		return seatName;
	}
	public void setSeatName(String seatName) {
		this.seatName = seatName;
	}
	public int getSeatAvailable() {
		return seatAvailable;
	}
	public void setSeatAvailable(int seatAvailable) {
		this.seatAvailable = seatAvailable;
	}
	public int getCinemaNo() {
		return cinemaNo;
	}
	public void setCinemaNo(int cinemaNo) {
		this.cinemaNo = cinemaNo;
	}
	public String getCinemaName() {
		return cinemaName;
	}
	public void setCinemaName(String cinemaName) {
		this.cinemaName = cinemaName;
	}
	public String getSeatGrade() {
		return seatGrade;
	}
	public void setSeatGrade(String seatGrade) {
		this.seatGrade = seatGrade;
	}
	public int getSeatPrice() {
		return seatPrice;
	}
	public void setSeatPrice(int seatPrice) {
		this.seatPrice = seatPrice;
	}

}
