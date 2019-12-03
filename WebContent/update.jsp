
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "bbs.BbsDAO" %>
<%@ page import = "bbs.Bbs" %>
<%@ page import = "java.util.ArrayList" %>

<!DOCTYPE html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

	<style type="text/css">
	a,a:hover{
		color:#000000;
		text-decoration:none;
	}
</style>
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
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}
	int bbsID = 0;
	if(request.getParameter("bbsID") != null){
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	if(bbsID == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('잘못된글 입니다.')");
		script.println("location.href = 'review.jsp'");
		script.println("</script>");		
	}
	Bbs bbs = new BbsDAO().getBbs(bbsID);
	if(!userID.equals(bbs.getUserID())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('작성자가 아닙니다.')");
		script.println("location.href = 'review.jsp'");
		script.println("</script>");
	}
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
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Header -->
  <header class="masthead" style="background-image: url('img/review-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="site-heading">
            <h1>Review</h1>
            <span class="subheading">Write your review</span>
          </div>
        </div>
      </div>
    </div>
  </header>
	<div class="container">
		<div class="row" style = "margin:50px;">
			<form method="post" action="updateAction.jsp?bbsID=<%=bbsID%>">
			<table style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th width="1200" colspan="2" style="background-color: #eeeeee; text-align: center;">Modify Review</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" name="bbsTitle" maxlength="50" value="<%=bbs.getBbsTitle() %>"></td>
					</tr>
					<tr>
						<td><textarea class="form-control"  name="bbsContent" maxlength="2048" style="height:350px;" ><%=bbs.getBbsContent() %></textarea></td>
					</tr>
				</tbody>
				
			</table>
			<input type="submit" class="btn btn-primary pull-right"  value="Done">
			</form>
		</div>
	</div>
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="js/clean-blog.min.js"></script>

</body>

</html>
