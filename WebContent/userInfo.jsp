
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "java.io.PrintWriter" %>

<%@page import="user.User" %>
<%@page import="user.UserDAO" %>

<!DOCTYPE html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>NAKLENCIAGA</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

  <!-- Custom styles for this template -->
  <link href="css/clean-blog.min.css" rel="stylesheet">

</head>

<body>
	
	<%
	String userID = null;
	if(session.getAttribute("userID") !=null){
		userID = (String) session.getAttribute("userID");		
	}
	User user = new UserDAO().getUser(userID);
	
	%>
	
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand" href="index.jsp">NAKLENCIAGA</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="index.jsp">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="shop">Shop</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="review">Review</a>
          </li>
          
          <%if(userID==null){ %>
          <li class="nav-item">
            <a class="nav-link" href="login">Login</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="join">join</a>
          </li>
          <%} else{ %>
          
        	<%if(userID.equals("admin") ==true){ %>
        	 <li class="nav-item">
        	 	<a class="nav-link" href="adminInfo.jsp?userID=<%=userID%>">admin</a>
        	 </li>
        	<%} else{%>
        	 <li class="nav-item">
        	 	<a class="nav-link" href="userInfo?userID=<%=userID%>">userInfo</a>
        	 </li>
        	 <%}%>
        	 <li class="nav-item">
          		<a class="nav-link" href="logoutAction.jsp">Logout</a>
          	 </li>
          <%} %>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Header -->
  <header class="masthead" style="background-image: url('img/info-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="site-heading">
            <h1>User Info</h1>
            <span class="subheading"><%=userID%></span>
          </div>
        </div>
      </div>
    </div>
  </header>
  
  <div class="container">
		<div class="row" style = "margin:50px;">
			<form method="post" action="userInfo?userID=<%=userID%>">
			<table style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th width="1200" colspan="2" style="background-color: #eeeeee; text-align: center;">User Info</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>UserID</td>
						<td><%=user.getUserID() %></td>
					</tr>
					<tr>
						<td>UserName</td>
						<td><%=user.getUserName() %></td>
					</tr>
					<tr>
						<td>UserGender</td>
						<td><%=user.getUserGender() %></td>
					</tr>
					<tr>
						<td>UserEmail</td>
						<td><%=user.getUserEmail() %></td>
					</tr>
					<tr>
						<td>Change Password</td>
						<td><input type="password" placeholder="password" name="userPW" maxlength="20"></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-primary pull-right" style="float: right;" value="Done">
			</form>
		</div>
	</div>
  	  <!-- Footer -->
  <footer>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <ul class="list-inline text-center">
            <li class="list-inline-item">
              <a href="#">
                <span class="fa-stack fa-lg">
                  <i class="fas fa-circle fa-stack-2x"></i>
                  <i class="fab fa-twitter fa-stack-1x fa-inverse"></i>
                </span>
              </a>
            </li>
            <li class="list-inline-item">
              <a href="#">
                <span class="fa-stack fa-lg">
                  <i class="fas fa-circle fa-stack-2x"></i>
                  <i class="fab fa-facebook-f fa-stack-1x fa-inverse"></i>
                </span>
              </a>
            </li>
            <li class="list-inline-item">
              <a href="#">
                <span class="fa-stack fa-lg">
                  <i class="fas fa-circle fa-stack-2x"></i>
                  <i class="fab fa-github fa-stack-1x fa-inverse"></i>
                </span>
              </a>
            </li>
          </ul>
          <p class="copyright text-muted">Copyright &copy; NAKLENCIAGA 2019</p>
        </div>
      </div>
    </div>
  </footer>
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="js/clean-blog.min.js"></script>

</body>

</html>
