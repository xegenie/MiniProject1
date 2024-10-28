<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="tje.DTO.User"%>
<%@page import="tje.Service.UserServiceImpl"%>
<%@page import="tje.Service.UserService"%>
<%@ include file="/layout/jstl.jsp"%>
<%@ include file="/layout/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	UserService userService = new UserServiceImpl();
	List<User> userList = userService.list();
	
	String deleteUserId = request.getParameter("deleteUserId");
	if (deleteUserId != null && !deleteUserId.isEmpty()) {
        int deleteResult = userService.delete(deleteUserId);
        if (deleteResult!=0) {
%>
            <script type="text/javascript">
                alert("삭제가 완료되었습니다.");
                location.href = "admin_user.jsp";  // 삭제 완료 후 페이지 리로드
            </script>
<%
        } else {
%>
            <script type="text/javascript">
                alert("삭제에 실패했습니다.");
            </script>
<%
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
<title>관리자 회원관리</title>
<jsp:include page="/layout/meta.jsp" />
<jsp:include page="/layout/link.jsp" />
<link rel="stylesheet" href="<%=root%>/static/css/admin_user.css">
</head>
<body>
	<div>
		<jsp:include page="/layout/admin/sidebar.jsp" />
	</div>
	<%-- [Contents] ######################################################### --%>
	<div class="container border-bottom border-end">
		<div class="insert rounded-3 m-5">
			<div class="item1 fs-2 fw-bold mb-4">회원등록</div>

			<form class="item2 d-flex flex-column row-gap-3 align-items-end" action="admin_user_pro.jsp" method="post">
				<div class="id">
					<span>ID</span> <input type="text" name="userId" placeholder="kimjoeun">
				</div>
				<div class="pw">
					<span>PW</span> <input type="text" name="userPw" placeholder="비밀번호를 입력하세요">
				</div>
				<div class="name">
					<span>이름</span> <input type="text" name="userName" placeholder="김조은">
				</div>
				<div class="email">
					<span>이메일</span> <input type="text" name="userEmail" placeholder="kimjoeun@gmail.com">
				</div>
				<div class="phoneNo">
					<span>핸드폰 번호</span> <input type="text" name="userPhone" placeholder="010-0000-0000">
				</div>
			</div>
			<div class="insertBox mt-4 d-flex justify-content-end">
				<input class="insertBtn rounded-3" name="action" type="submit" value="등록">
			</form>
		</div>
	</div>
	<div class="container">
		<div class="rounded-search-container mt-4 mb-4">
			<input type="text" class="rounded-search-input"
				placeholder="아이디/이름을 검색해주세요">
			<button class="rounded-search-btn">
				<i class="fa fa-search"></i>
			</button>
		</div>
	</div>
	<div class="container">
		<table class="board-list">
			<thead>
				<tr>
					<th>No.</th>
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>핸드폰 번호</th>
					<th>관리</th>
				</tr>
			</thead>
			<tbody>
				<!-- (tr>(td{$}+td{게시글 제목 $}+td{작성자$}+td{2024-09-%%}))*10 -->
				<%
				for(int i=0; i<userList.size(); i++) {
					String userId = userList.get(i).getId();
				%>
				<tr>
					<td><%= i+1 %></td>
					<td><%= userList.get(i).getId() %></td>
					<td><%= userList.get(i).getName() %></td>
					<td><%= userList.get(i).getEmail() %></td>
					<td><%= userList.get(i).getTelNumber() %></td>
					<td>
						<button type="button" onclick="location.href='admin_userUpdate.jsp?userId=<%= userId %>';">수정</button>
						<button type="button" onclick="deleteUser('<%= userId %>')">삭제</button>
					</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>

	</div>
<!-- 	<div class="container"> -->
<!-- 		<div class="pagenation"> -->
			<!-- ≪ ＜ ＞ ≫ -->
<!-- 			<a href="" class="page-link">≪</a> -->
<!-- 			<a href="" class="page-link">＜</a> -->
<!-- 			<a href="" class="page-link selected">1</a>  -->
<!-- 			<a href="" class="page-link">2</a>  -->
<!-- 			<a href="" class="page-link">3</a>  -->
<!-- 			<a href="" class="page-link">4</a>  -->
<!-- 			<a href="" class="page-link">5</a> -->
<!-- 			<a href="" class="page-link">＞</a>  -->
<!-- 			<a href="" class="page-link">≫</a> -->
<!-- 		</div> -->
<!-- 	</div> -->
	<%-- [Contents] ######################################################### --%>
	<script type="text/javascript">
		function deleteUser(userId) {
			request = new XMLHttpRequest()
			if(confirm("정말로 삭제하시겠습니까?")) {
				window.location.href = 'admin_user.jsp?deleteUserId=' + encodeURIComponent(userId);
			}
		}
	</script>
	<jsp:include page="/layout/script.jsp" />
</body>
</html>