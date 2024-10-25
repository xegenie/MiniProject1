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
	<title>관리자 회원관리</title>
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
	<link rel="stylesheet" href="<%= root %>/static/css/admin_user.css">
</head>
<body>
	<div>
	<jsp:include page="/layout/admin/sidebar.jsp" />
	</div>
	<%-- [Contents] ######################################################### --%>
	<div class="container border-bottom border-end">
		<div class="insert rounded-3 m-5">
			<div class="item1 fs-2 fw-bold mb-4">회원등록</div>
			
			<div class="item2 d-flex flex-column row-gap-3 align-items-end">
				<div class="no">
					<span>No.</span>
					<input type="text">
				</div>
				<div class="id">
					<span>ID</span>
					<input type="text">
				</div>
				<div class="name">
					<span>이름</span>
					<input type="text">
				</div>
				<div class="email">
					<span>이메일</span>
					<input type="text">
				</div>
				<div class="phoneNo">
					<span>핸드폰 번호</span>
					<input type="text">
				</div>
				<input class="insertBtn rounded-3" type="submit" value="등록">
			</div>
		</div>
	</div>

	<%-- [Contents] ######################################################### --%>
	<script>
	// 예약완료 알림 표시
    const insert = document.querySelector('.insertBtn');

    insert.addEventListener('click', () => {
      alert('등록 완료!');
    });
  </script>
	<jsp:include page="/layout/script.jsp" />
</body>
</html>