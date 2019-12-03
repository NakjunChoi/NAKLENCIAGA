
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "bbs.BbsDAO" %>
<%@ page import = "bbs.Bbs" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "comment.Comment" %>
<%@ page import = "comment.CommentDAO" %>


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
.simple_table { width: 100%; border: none; border-collapse: separate; border-spacing: 2px;}
.simple_table th { padding: 15px; border: none; border-left: 5px solid #C03; border-bottom: 1px solid #DDD; background: #FCF0F3; font-weight: normal; text-align:center; text-shadow: 0 1px #FFF; vertical-align: middle;}
.simple_table td { padding: 15px; border: none; border-bottom: 1px solid #DDD; text-align: left; vertical-align: baseline;}

	
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
		<div class="row">
			
			<table class="table" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">Review</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">Title</td>
						<td colspan="2"><%=bbs.getBbsTitle().replaceAll(" ","&nbsp") %></td>
					</tr>
					<tr>
						<td style="width: 20%;">Writer</td>
						<td colspan="2"><%=bbs.getUserID() %></td>
					</tr>
					<tr>
						<td style="width: 20%;">Date</td>
						<td colspan="2"><%=bbs.getBbsDate().substring(0,11) + bbs.getBbsDate().substring(11,13) + "시" +bbs.getBbsDate().substring(14,16) +"분"%></td>
					</tr>
					<tr>
						<td>content</td>
						<td colspan="2" style="min-height: 200px; text-align:left;"><%=bbs.getBbsContent().replaceAll(" ","&nbsp").replaceAll("\n","<br>")%></td>
					</tr>
					
				</tbody>
			</table>
			</div>	
			<br>
			<div class="container">
				<form method="post" action="comAction.jsp?bbsID=<%=bbsID%>">
				<table class="simple_table" style="text-align:center">
					<tr>
						<td colspan='3'style="text-align:center" > Comments </td>
					</tr>
					<tr>
						<td><%=userID %></td>
						<td><textarea name="comment" placeholder="Write comment here" cols= "80px"></textarea></td>
						<td><input type="submit" value="작성" ></td>
					</tr>
					
					<%
					CommentDAO comDAO= new CommentDAO();
					ArrayList<Comment> list2 = comDAO.getList(bbsID);
					for(int i=0;i<list2.size();i++){
					%>
					<tr>
					<td ><%=list2.get(i).getCommentWritter() %></td>
					<td colspan="2" ><%=list2.get(i).getContent() %></td>
					</tr>
					<%} %>
					
				</table>			
				</form> 
			</div>
			
			
			
			
			<div style="float:right;">
			<a href="review" class="btn btn-primary">list</a>
			<%
			if(userID!= null &&( userID.equals(bbs.getUserID()) || userID.equals("admin"))){
			%>	
				<a href="update.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">Modify</a>		
				<a onclick="return confirm('삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">Delete</a>
				
			<%}%>
			</div>
	</div>
	
	
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="js/clean-blog.min.js"></script>


</body>

</html>
