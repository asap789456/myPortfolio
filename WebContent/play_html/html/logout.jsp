<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<script>

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>로그아웃 </title>
</head>
<body>
	<%
	session.invalidate();
		
	%>
	<script>
		location.href = 'index.jsp';
	</script>
</body>
</html>
