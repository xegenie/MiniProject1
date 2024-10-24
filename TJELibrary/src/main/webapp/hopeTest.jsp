<%@page import="java.util.List"%>
<%@page import="tje.DTO.User"%>
<%@page import="tje.Service.UserService"%>
<%@page import="tje.Service.UserServiceImpl"%>
<%@page import="tje.DTO.HopeBook"%>
<%@page import="tje.Service.HopeBookServiceImpl"%>
<%@page import="tje.Service.HopeBookService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HopeBookService hopeBookService = new HopeBookServiceImpl();
	
	UserService userService = new UserServiceImpl();
	User user = userService.select("joeun");

// 	HopeBook hb1 = new HopeBook("joeun", "컴퓨터 감성 공학", "황인준", "드림미디어");
// 	int result = hopeBookService.post(hb1);
	
	List<HopeBook> hbl1 = hopeBookService.selectById(user);
	out.print(hbl1.size());
	List<HopeBook> hbl2 = hopeBookService.selectByManager();
	HopeBook hb2 = new HopeBook();
	hb2.setNo(2);
	int result2 = hopeBookService.delete(hb2);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
</head>
<body>
<%-- 	<%= hb1 %> --%>
<%-- 	<%= result %> --%>
	<%= hbl1 %>
	<br>
	<%= hbl2 %>
	<br>
	<%= result2 %>
</body>
</html>