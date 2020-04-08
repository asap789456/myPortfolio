package admin_res;

public class adminDTO {
   private int playNo;
   private String playImg;
   private String playName;
   private String playSday;
   private String playEday;
   private String playDate;
   private String time;
   private String seatNo;
   private String userID;
   private int total; //���� �ϳ��� �� ���Ÿż�
   private int sumTotal; // ������ �� ����� ���� a�� ������ �� �ݾ�
   private String seatName;
   
   
   public String getPlayDate() {
      return playDate;
   }
   public void setPlayDate(String playDate) {
      this.playDate = playDate;
   }
   public String getTime() {
      return time;
   }
   public void setTime(String time) {
      this.time = time;
   }
   public String getSeatNo() {
      return seatNo;
   }
   public void setSeatNo(String seatNo) {
      this.seatNo = seatNo;
   }
   
   public int getPlayNo() {
      return playNo;
   }
   public void setPlayNo(int playNo) {
      this.playNo = playNo;
   }
   public String getPlayImg() {
      return playImg;
   }
   public void setPlayImg(String playImg) {
      this.playImg = playImg;
   }
   public String getPlayName() {
      return playName;
   }
   public void setPlayName(String playName) {
      this.playName = playName;
   }

   public String getPlaySday() {
      return playSday;
   }
   public void setPlaySday(String playSday) {
      this.playSday = playSday;
   }
   public String getPlayEday() {
      return playEday;
   }
   public void setPlayEday(String playEday) {
      this.playEday = playEday;
   }
   
   public String getUserID() {
      return userID;
   }
   public void setUserID(String userID) {
      this.userID = userID;
   }
   public int getTotal() {
      return total;
   }
   public void setTotal(int total) {
      this.total = total;
   }
   public int getSumTotal() {
      return sumTotal;
   }
   public void setSumTotal(int sumTotal) {
      this.sumTotal = sumTotal;
   }
   public String getSeatName() {
      return seatName;
   }
   public void setSeatName(String seatName) {
      this.seatName = seatName;
   }
   
}