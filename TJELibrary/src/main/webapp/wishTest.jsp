<%@page import="java.util.List"%>
<%@page import="tje.DTO.Book"%>
<%@page import="tje.Service.UserServiceImpl"%>
<%@page import="tje.Service.UserService"%>
<%@page import="tje.DTO.User"%>
<%@page import="tje.Service.WishListServiceImpl"%>
<%@page import="tje.Service.WishListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	WishListService wishListService = new WishListServiceImpl();

	UserService userService = new UserServiceImpl();
	User user = userService.select("joeun");
	
	Book book = new Book();
	book.setId(1);
	
	int result = wishListService.save(user, book);
	
	List<Book> bookList = wishListService.select(user);
	
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
	<br>
	<%= bookList %>
</body>
</html>