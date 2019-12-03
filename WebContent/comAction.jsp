<%@page import="comment.Comment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "comment.Comment" %>
<%@page import="comment.CommentDAO" %>
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
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'login'");
		script.println("</script>");
	}
	int bbsID = 0;
	if(request.getParameter("bbsID") != null){
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	
	Comment com = new Comment();
	com.setBoardID(bbsID);
	com.setCommentWritter(userID);
	com.setContent(request.getParameter("comment"));
	
	CommentDAO comDAO = new CommentDAO();
	int result = comDAO.doComment(com);
	
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('댓글 작성 실패')");
		script.println("location.href = 'review'");
		script.println("</script>");
	}
	else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('댓글이 작성 되었습니다.')");
		script.println("location.href= 'review'");
		script.println("</script>");
	}
	%>
	
</body>
</html>