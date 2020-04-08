<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "user.*"
    %>
<%
	request.setCharacterEncoding("utf-8");
	String userID = (String)session.getAttribute("userID");
	UserDAO manager = new UserDAO();
	User user = manager.getMember(userID);
	
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../style.css"/>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
// [수정]버튼 클릭 시 수정폼에 입력한 값을  modifyPro.jsp 실행
$("#modifyProcess").click(function() {
var query = {
	userID : $("#userID").val(),
	userPassword : $("#userPassword").val(),
	userName : $("#userName").val(),
	userEmail : $("#userEmail").val(),
	userPhone : $("#userPhone").val()
};
$.ajax({
	type : "post",
	url : "modifyPro.jsp",
	data : query,
	success : function(data) {
	data = data.trim();
	if(data == "true") {//정보수정 성공
	alert("회원정보가 수정되었습니다.");
	window.location.href = "../../mypage.jsp";
} else {
	alert("정보 변경에 실패하였습니다.");
		}
	}
});
});

// [취소]버튼 클릭 시 index.jsp로 이동
$("#cancel").click(function() {
window.location.href = "../../mypage.jsp";
});
});
</script>
</head>
<body>
<div id="regForm" class="box">
   <ul>
      <li><p class="center">회원 정보 수정</p></li>
      <li><label>아이디</label> <%= user.getUserID() %>
          <input id="userID" name="userID" type="hidden" value="<%= user.getUserID() %>">
      </li>
      <li><label for="userPassword">비밀번호</label>
          <input id="userPassword" name="userPassword" type="password" size="20" placeholder="6~16자 숫자/문자" maxlength="16">
      </li>
      <li><label for="userName">이름</label>  <%= user.getUserName() %>
          <input id="userName" name="userName" type="hidden" size="20" maxlength="10" value="<%= user.getUserName() %>">
      </li>
      <li><label for="userEmail">이메일</label>
          <input id="userEmail" name="userEmail" type="text" size="30" maxlength="50" value="<%= user.getUserEmail() %>">
      </li>
      <li><label for="userPhone">전화번호</label>
          <input id="userPhone" name="userPhone" type="tel" size="20" maxlength="20" value="<%= user.getUserPhone() %>">
      </li>
      <li class="label2"><button id="modifyProcess">수정</button>
          <button id="cancel">취소</button>
      </li>
   </ul>
</div>
</body>
</html>