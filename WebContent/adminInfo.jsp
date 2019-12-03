
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "java.io.PrintWriter" %>

<%@page import="user.User" %>
<%@page import="user.UserDAO" %>
<%@ page import = "java.util.ArrayList" %>

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
	if(!userID.equals("admin")) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('관리자가 아닙니다.')");
		script.println("location.href='index.jsp'");
		script.println("</script>");
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
          <li class="nav-item">
        		<a class="nav-link" href="adminInfo.jsp?userID=<%=userID%>">admin</a>
        	</li>
        	<li class="nav-item">
          		<a class="nav-link" href="logoutAction.jsp">Logout</a>
          	</li>
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
            <h1>Admin</h1>
            <span class="subheading">Client List</span>
          </div>
        </div>
      </div>
    </div>
  </header>
  
  <div class="container">
		<div class="row" style = "margin:50px;">
			<form method="post" action="userInfoAction.jsp?userID=<%=userID%>">
			<div style="text-align:center;  margin-left: 300px;">
				<div>Change Admin Password</div>
				<input type="password" placeholder="password" name="userPW" maxlength="20">
				<input type="submit" class="btn btn-primary pull-right"  value="Done">
			</div>
			</form>
		</div>
	</div>
	
	<div class="container" style = "margin-left:430px;">
		<strong style="margin-left:220px;">Users Info</strong>
		<table style="text-align: center; border: 2px solid #dddddd">
		<thead style="background-color: #eeeeee; text-align: center;">
			<th>ID</th>
			<th>Password</th>
			<th>Name</th>
			<th>Gender</th>
			<th>Email</th>
		</thead>
		<tbody>
			
			<%
			UserDAO userDAO= new UserDAO();
			ArrayList<User> list = userDAO.getList();
			for(int i=0;i<list.size();i++){
				if(list.get(i).getUserID().equals("admin")) continue;
			%>
			<tr>
			<td><%=list.get(i).getUserID() %></td>
			<td><%=list.get(i).getUserPW() %></td>
			<td><%=list.get(i).getUserName() %></td>
			<td><%=list.get(i).getUserGender() %></td>
			<td><%=list.get(i).getUserEmail() %></td>
			</tr>
			<%} %>
		</tbody>
		</table>
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
