<%@page import="tje.DTO.User"%>
<%@page import="tje.Service.UserServiceImpl"%>
<%@page import="tje.Service.UserService"%>
<%@ include file="/layout/jstl.jsp"%>
<%@ include file="/layout/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

			<div class="item2 d-flex flex-column row-gap-3 align-items-end">
				<div class="no">
					<span>No.</span> <input type="text" placeholder="1">
				</div>
				<div class="id">
					<span>ID</span> <input type="text" placeholder="kimjoeun">
				</div>
				<div class="name">
					<span>이름</span> <input type="text" placeholder="김조은">
				</div>
				<div class="email">
					<span>이메일</span> <input type="text" placeholder="kimjoeun@gmail.com">
				</div>
				<div class="phoneNo">
					<span>핸드폰 번호</span> <input type="text" placeholder="010-0000-0000">
				</div>
			</div>
			<div class="insertBox mt-4 d-flex justify-content-end">
				<input class="insertBtn rounded-3" type="submit" value="등록">
			</div>
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
				<tr>
					<td>1</td>
					<td>id</td>
					<td>name</td>
					<td>email@gmail.com</td>
					<td>phone_number</td>
					<td>
						<button type="button" onclick="location.href='admin_userUpdate.jsp'; editPost();">수정</button>
						<button type="button" onclick="deletePost()">삭제</button>
					</td>
				</tr>
				<tr>
					<td>2</td>
					<td>게시글 제목 2</td>
					<td>작성자2</td>
					<td>2024-10-%%</td>
					<td>좋아요</td>
					<td>
						<button type="button" onclick="location.href='admin_userUpdate.jsp'; editPost();">수정</button>
						<button type="button" onclick="deletePost()">삭제</button>
					</td>
				</tr>
				<tr>
					<td>3</td>
					<td>게시글 제목 3</td>
					<td>작성자3</td>
					<td>2024-10-%%</td>
					<td>좋아요</td>
					<td>
						<button type="button" onclick="location.href='admin_userUpdate.jsp'; editPost();">수정</button>
						<button type="button" onclick="deletePost()">삭제</button>
					</td>
				</tr>
				<tr>
					<td>4</td>
					<td>게시글 제목 4</td>
					<td>작성자4</td>
					<td>2024-10-%%</td>
					<td>좋아요</td>
					<td>
						<button type="button" onclick="location.href='admin_userUpdate.jsp'; editPost();">수정</button>
						<button type="button" onclick="deletePost()">삭제</button>
					</td>
				</tr>
				<tr>
					<td>5</td>
					<td>게시글 제목 5</td>
					<td>작성자5</td>
					<td>2024-10-%%</td>
					<td>좋아요</td>
					<td>
						<button type="button" onclick="location.href='admin_userUpdate.jsp'; editPost();">수정</button>
						<button type="button" onclick="deletePost()">삭제</button>
					</td>
				</tr>
				<tr>
					<td>6</td>
					<td>게시글 제목 6</td>
					<td>작성자6</td>
					<td>2024-10-%%</td>
					<td>좋아요</td>
					<td>
						<button type="button" onclick="location.href='admin_userUpdate.jsp'; editPost();">수정</button>
						<button type="button" onclick="deletePost()">삭제</button>
					</td>
				</tr>
				<tr>
					<td>7</td>
					<td>게시글 제목 7</td>
					<td>작성자7</td>
					<td>2024-10-%%</td>
					<td>좋아요</td>
					<td>
						<button type="button" onclick="location.href='admin_userUpdate.jsp'; editPost();">수정</button>
						<button type="button" onclick="deletePost()">삭제</button>
					</td>
				</tr>
				<tr>
					<td>8</td>
					<td>게시글 제목 8</td>
					<td>작성자8</td>
					<td>2024-10-%%</td>
					<td>좋아요</td>
					<td>
						<button type="button" onclick="location.href='admin_userUpdate.jsp'; editPost();">수정</button>
						<button type="button" onclick="deletePost()">삭제</button>
					</td>
				</tr>
				<tr>
					<td>9</td>
					<td>게시글 제목 9</td>
					<td>작성자9</td>
					<td>2024-10-%%</td>
					<td>좋아요</td>
					<td>
						<button type="button" onclick="location.href='admin_userUpdate.jsp'; editPost();">수정</button>
						<button type="button" onclick="deletePost()">삭제</button>
					</td>
				</tr>
				<tr>
					<td>10</td>
					<td>게시글 제목 10</td>
					<td>작성자10</td>
					<td>2024-10-%%</td>
					<td>좋아요</td>
					<td>
						<button type="button" onclick="location.href='admin_userUpdate.jsp'; editPost();">수정</button>
						<button type="button" onclick="deletePost()">삭제</button>
					</td>
				</tr>
			</tbody>
		</table>

	</div>
	<div class="container">
		<div class="pagenation">
			<!-- ≪ ＜ ＞ ≫ -->
			<a href="" class="page-link">≪</a>
			<a href="" class="page-link">＜</a>
			<a href="" class="page-link selected">1</a> 
			<a href="" class="page-link">2</a> 
			<a href="" class="page-link">3</a> 
			<a href="" class="page-link">4</a> 
			<a href="" class="page-link">5</a>
			<a href="" class="page-link">＞</a> 
			<a href="" class="page-link">≫</a>
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