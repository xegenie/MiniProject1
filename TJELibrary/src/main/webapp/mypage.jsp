<%@page import="tje.DTO.User"%>
<%@page import="tje.Service.UserServiceImpl"%>
<%@page import="tje.Service.UserService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//UserService userService = new UserServiceImpl();
	//User user = userService.select("joeun");
	User user = User.builder()
					.id("아이디")
					.telNumber("010-1234-1234")
					.name("조하은")
					.build();
	
	// chapter 
	String chapterTitle = "내 서재";
	String chapter1 = "HOME";
	String chapter2 = "내 서재";
	String chapter3 = "대출현황";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>project💻 - ALOHA CLASS🌴</title>
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
	
</head>
<body>
<%-- 	<jsp:include page="/layout/header.jsp" /> --%>
	<div class="pb-4">
		<%@ include file="/layout/chapter.jsp" %>
	</div>
	<div>
		<div class="container">
			<div class="row px-5 py-4 bg-gray">
				<div class="col-12 col-sm-6 py-1">
					<p><b>회원ID :</b> <%= user.getId() %></p>					
				</div>
				<div class="col-12 col-sm-6 py-1">
					<p><b>전화번호: </b><%= user.getTelNumber() %></p>
				</div>
				<div class="col-12 col-sm-6 py-1">
					<p><b>이름: </b><%= user.getName() %></p>
				</div>
				<div class="col-12 col-sm-6 py-1">
					<p><b>대출 가능 여부: </b></p>
				</div>
			</div>
		</div>
	</div>
	<div>
		<div class="d-flex justify-content-between">
			<div class="row rounded-3 border">
				<div class="col-6">대출(연체)</div>
				<div class="col-6">0</div>
			</div>
			<div class="rounded-3 border">
				
			</div>
			<div class="rounded-3 border">
				
			</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="/layout/script.jsp" />
</body>
</html>