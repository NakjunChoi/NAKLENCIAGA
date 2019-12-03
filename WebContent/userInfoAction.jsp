<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="user.User" %>
<%@page import="user.UserDAO" %>
<%@page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NAKLENCIAGA</title>
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
	User user = new UserDAO().getUser(userID);
	
	if(request.getParameter("userPW") == ""){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 입력 되지 않았습니다.')");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
	}
	else{
		UserDAO userDAO = new UserDAO();
		int result = userDAO.update(userID, request.getParameter("userPW"));
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호 변경에 실패하였습니다.')");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
		}
		else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호를 성공하였습니다.')");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
		}
	}
	%>
	
</body>
</html>