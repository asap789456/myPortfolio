package play_seat;

public class PlaySeat {
	private String seatName; //�¼��̸� (A1,A2)
	private int seatAvailable; //�¼� ���࿩��
	private int cinemaNo; //�����ȣ
	private String cinemaName; //�����̸�
	private String seatGrade; //�¼����
	private int seatPrice; //�����ȣ
	
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
