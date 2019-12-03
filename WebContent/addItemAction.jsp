<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ page import = "item.Item" %>
<%@page import="item.ItemDAO" %>
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
	Item item = new Item();
	if(request.getParameter("itemname")=="" ||request.getParameter("imgurl")=="" ||
			request.getParameter("content")=="" ||request.getParameter("price") == ""){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('내용이 부족합니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
		
	item.setItemname(request.getParameter("itemname"));
	item.setCategory(request.getParameter("category"));
	item.setImglink(request.getParameter("imgurl"));
	item.setPrice( Integer.parseInt(request.getParameter("price") ));
	item.setContent(request.getParameter("content"));
	
	ItemDAO itemDAO  = new ItemDAO();
	int result = itemDAO.addItem(item);
	
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('상품 추가에 실패하였습니다.')");
		script.println("location.href = 'shop.jsp'");
		script.println("</script>");
	}
	else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('상품을 성공적으로 추가하였습니다.')");
		script.println("location.href = 'shop'");
		script.println("</script>");
	}
	
	
	%>
	
	
</body>
</html>