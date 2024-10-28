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
	<title>메인 화면</title>
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
	<main class="mainbackground">
		<div class="row d-flex justify-content-center py-2" style="background-color:rgba(217, 202, 185, 0.6);">
			<a href="book_list.jsp" class="d-flex flex-column col-1 justify-content-center text-center">
				<i class="fa-solid fa-magnifying-glass mainicon mx-auto"></i>
				자료탐색
			</a>
			<a href="board_list.jsp" class="d-flex flex-column col-1 justify-content-center text-center">
				<i class="fa-solid fa-users mainicon mx-auto"></i>
				게시판
			</a>
			<a href="notice.jsp" class="d-flex flex-column col-1 justify-content-center text-center">
				<i class="fa-solid fa-bell mainicon mx-auto"></i>
				공지사항
			</a>
			<div class="d-flex flex-column col-1 justify-content-center text-center">
				<i class="fa-solid fa-book mainicon mx-auto"></i>
				<p>희망자료 신청</p>
			</div>
		</div>
		<div class="container pt-5">
			<div class="row d-flex pt-5 pb-3">
				<div class="col-2 mx-auto text-center py-1 bookhead">인기 도서</div>
			</div>
			<div class="row d-flex justify-content-around">
				<div class="col-2">
					<img class="shadow" alt="book1" src="static/img/book1.png">
				</div>
				<div class="col-2">
					<img class="shadow" alt="book2" src="static/img/book2.png">
				</div>
				<div class="col-2">
					<img class="shadow" alt="book3" src="static/img/book3.png">
				</div>
				<div class="col-2">
					<img class="shadow" alt="book4" src="static/img/book4.png">
				</div>
				<div class="col-2">
					<img class="shadow" alt="book5" src="static/img/book5.png">
				</div>
			</div>	
		</div>
		<div class="container py-5">
			<div class="row d-flex pt-5 pb-3">
				<div class="col-2 mx-auto text-center py-1 bookhead">신착 도서</div>
			</div>
			<div class="row d-flex justify-content-around">
				<div class="col-2">
					<img class="shadow" alt="book6" src="static/img/book6.png">
				</div>
				<div class="col-2">
					<img class="shadow" alt="book7" src="static/img/book7.png">
				</div>
				<div class="col-2">
					<img class="shadow" alt="book8" src="static/img/book8.png">
				</div>
				<div class="col-2">
					<img class="shadow" alt="book9" src="static/img/book9.png">
				</div>
				<div class="col-2">
					<img class="shadow" alt="book10" src="static/img/book10.png">
				</div>
			</div>	
		</div>
	</main>
	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>