package user;


public class User{

	private String userID;
	private String userPassword;
	private String userName;
	private String userPhone;
	private String userEmail;
	private int userSex;
	private String userBirth;
	private String userAddress;
	private int userAvailable; //회원탈퇴여부 (1이면 이용중 0이면 탈퇴)
	private String userJoinDate; //회원가입날짜
	private String userClass; //회원등급 (우수회원,일반회원)
	private int userClassNo; //회원등급 (1,2)
	

	public User(String string, String string2, String string3, String string4, String string5, int int1, String string6,
			String string7, int int2, String string8, int int3) {
		// TODO Auto-generated constructor stub
	}
	public User() {
		// TODO Auto-generated constructor stub
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	public int getUserSex() {
		return userSex;
	}
	public void setUserSex(int userSex) {
		this.userSex = userSex;
	}
	public String getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public int getUserAvailable() {
		return userAvailable;
	}
	public void setUserAvailable(int userAvailable) {
		this.userAvailable = userAvailable;
	}
	public String getUserJoinDate() {
		return userJoinDate;
	}
	public void setUserJoinDate(String userJoinDate) {
		this.userJoinDate = userJoinDate;
	}
	public String getUserClass() {
		return userClass;
	}
	public void setUserClass(String userClass) {
		this.userClass = userClass;
	}
	public int getUserClassNo() {
		return userClassNo;
	}
	public void setUserClassNo(int userClassNo) {
		this.userClassNo = userClassNo;
	}


	
	
	
	
	
}
