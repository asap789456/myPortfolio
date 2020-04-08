<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>APicket Admin User</title>
        <meta name="description" content="A Template by Gozha.net">
        <meta name="keywords" content="HTML, CSS, JavaScript">
        <meta name="author" content="Gozha.net">
    
    <!-- Mobile Specific Metas-->
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="telephone=no" name="format-detection">
    
    <!-- Fonts -->
        <!-- Font awesome - icon font -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <!-- Roboto -->
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,100,700' rel='stylesheet' type='text/css'>
        <!-- Open Sans -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:800italic' rel='stylesheet' type='text/css'>
    
    <!-- Stylesheets -->

        <!-- Mobile menu -->
        <link href="css/gozha-nav.css" rel="stylesheet" />
        <!-- Select -->
        <link href="css/external/jquery.selectbox.css" rel="stylesheet" />

    
        <!-- Custom -->
        <link href="css/style.css?v=1" rel="stylesheet" />

        <!-- Modernizr --> 
        <script src="js/external/modernizr.custom.js"></script>


<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
		    
</head>

<body>

    <div class="wrapper">
        <jsp:include page="admin_common_top.jsp" flush="false" />
        


        <section class="container">
            <div class="col-sm-12">
        		<form action="post" onclick=""></form>
                <h2 class="page-heading">이벤트 관리</h2>
        
<div class="container">
    <table class="table">
    <thead>
	<tr>

		<td>번호</td>

		<td>아이디</td>

		<td>당첨 날짜</td>

		

	</tr>
	</thead>

<%
String event_num, id, event_date;

try {
			//Connection conn = db_Class.openConnection();
			Class.forName("com.mysql.jdbc.Driver");
		  Connection conn = DriverManager.getConnection 
	   		("jdbc:mysql://apicket.com:3306/gy2589?useSSL=false&serverTimezone=UTC","gy2589","asap789456!");
	    if(conn != null){
	 	    System.out.println("DB 연결  : success" + "<br>");
	    }else{
	 	    System.out.println("DB 연결  : fail" + "<br>");
	    };
		  java.sql.Statement stmt = conn.createStatement();

		  ResultSet rs = stmt.executeQuery
				  ("  select eventNo, userID, DATE_FORMAT(eventDate, '%Y-%m-%d') AS eventDate"+
			     " from EVENT ORDER BY eventNo DESC; " );
		while(rs.next()) {
			event_num = rs.getString(1);
			id = rs.getString(2);
			event_date = rs.getString(3);

%> 

			<tr>  	             
			        <td><%=event_num%></td>
			        <td><%=id%></td>
			        <td><%=event_date%></td>	        
			</tr>
			<%
				   }
				   rs.close();
				   stmt.close();
				   conn.close();
			
			} catch (Exception e) {
				out.println(e);
			}
			%>

	</table>
	</div>
	
	</div>
	</section>
	 <jsp:include page="admin_bottom.jsp" flush="false" />
	</div>
	
                



	<!-- JavaScript-->
        <!-- jQuery 3.1.1--> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/external/jquery-3.1.1.min.js"><\/script>')</script>
        <!-- Migrate --> 
        <script src="js/external/jquery-migrate-1.2.1.min.js"></script>
        <!-- Bootstrap 3--> 
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>

        <!-- Slider Revolution core JavaScript files -->
        <script type="text/javascript" src="revolution/js/jquery.themepunch.tools.min.js"></script>
        <script type="text/javascript" src="revolution/js/jquery.themepunch.revolution.min.js"></script>

        <!-- Slider Revolution extension scripts. --> 
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.actions.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.carousel.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.migration.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.navigation.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.parallax.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.video.min.js"></script>

        <!-- Mobile menu -->
        <script src="js/jquery.mobile.menu.js"></script>
         <!-- Select -->
        <script src="js/external/jquery.selectbox-0.2.min.js"></script>
        <!-- Stars rate -->
        <script src="js/external/jquery.raty.js"></script>
        
        <!-- Form element -->
        <script src="js/external/form-element.js"></script>
        <!-- Form validation -->
        <script src="js/form.js"></script>

        <!-- Twitter feed -->
        <script src="js/external/twitterfeed.js"></script>

        <!-- Custom -->
        <script src="js/custom.js"></script>
		
	      <script type="text/javascript">
              $(document).ready(function() {
                init_Home();
              });
		    </script>

</body>
</html>