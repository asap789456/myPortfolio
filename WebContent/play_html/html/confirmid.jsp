<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.*" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<title>id중복확인</title>
<jsp:useBean id="user" class = "user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
		
<style>
input:not(.text){
	border: 0px solid #ffffff;
    background: #ebc34c;
    font-family: 'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;
    background: -webkit-gradient(linear, left top, left bottom, from(#ffd65b), to(#ebc34c));
    background: -webkit-linear-gradient(top, #ffd65b, #ebc34c);
    background: -moz-linear-gradient(top, #ffd65b, #ebc34c);
    background: -ms-linear-gradient(top, #ffd65b, #ebc34c);
    background: -o-linear-gradient(top, #ffd65b, #ebc34c);
    background-image: -ms-linear-gradient(top, #ffd65b 0%, #ebc34c 100%);
    padding: 9.5px 19px;
    -webkit-border-radius: 8px;
    -moz-border-radius: 8px;
    border-radius: 8px;
    -webkit-box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
    -moz-box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
    box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
    text-shadow: #bfbfbf 0 1px 0;
    color: #ffffff;
    font-size: 14px;
    text-decoration: none;
    vertical-align: middle;
}
.col-second{
	display: inline-block;
    width: 50%;
    text-align: center;
    float: left;
    border-radius: 0;
}
</style>
<%
	String userID = request.getParameter("userID");
	UserDAO userdao = new UserDAO();
	int check = userdao.confirmId(userID);
	
	if(check == -1) {%>
		<%=userID%>는 이미 사용중인 아이디입니다.
		<form name="checkForm" method="post" action="confirmid.jsp">
		<b>다른아이디를선택하세요</b><br /><br />
		<div class="col-second">
			<input class="text" type="text" name="userID" />
			<input class="submit" type="submit" value="ID중복확인" />
		</div>
		</form>
		<%
	} else {
	%><center>
		<div class="col-second">
		<b>입력하신 <%=userID%>는 사용가능합니다.</b>
		<input type="button" value="사용하기" onclick="setid()" />
		</div>
		</center>		
	<%}%>
<script language="javascript">
	function setid() {
		opener.document.userinput.userID.value="<%=userID%>";
		opener.document.userinput.idDuplication.value = "idCheck";
		self.close();
	}
</script>