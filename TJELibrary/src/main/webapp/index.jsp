<%@page import="tje.DTO.User"%>
<%@page import="tje.Service.UserServiceImpl"%>
<%@page import="tje.Service.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserService userService = new UserServiceImpl();
	User user =	userService.select("joeun");
	
	user.setId("joeun10");
	int result = userService.signUp(user);
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
</head>
<body>
	<%= user.getName() %>
	<%= result %>
</body>
</html>