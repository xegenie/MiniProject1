<%@page import="tje.DTO.User"%>
<%@page import="tje.Service.UserServiceImpl"%>
<%@page import="tje.Service.UserService"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>project💻 - ALOHA CLASS🌴</title>
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
	<link rel="stylesheet" href="static/css/main.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
	<div class="pb-5">	
		<jsp:include page="/layout/header.jsp" />
	</div>
	<%-- [Contents] ######################################################### --%>
	<main class="pt-5 mainbackground">
			<div class="row d-flex justify-content-center border" style="background-color:rgba(217, 202, 185, 0.8);">
				<div class="border col-2 justify-content-center px-5 text-center">
					<i class="fa-solid fa-magnifying-glass mainicon mx-auto"></i>
					<p>자료탐색</p>
				</div>
				<div class="border col-2 justify-content-center px-5 text-center">
					<i class="fa-solid fa-magnifying-glass mainicon mx-auto"></i>
					<p>자료탐색</p>
				</div>
				<div class="border col-2 justify-content-center px-5 text-center">
					<i class="fa-solid fa-magnifying-glass mainicon mx-auto"></i>
					<p>자료탐색</p>
				</div>
				<div class="border col-2 justify-content-center px-5 text-center">
					<i class="fa-solid fa-magnifying-glass mainicon mx-auto"></i>
					<p>자료탐색</p>
				</div>
		<div class="container">
			</div>
		</div>
	</main>
	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>