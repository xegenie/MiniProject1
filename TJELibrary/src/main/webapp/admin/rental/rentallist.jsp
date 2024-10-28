<%@page import="tje.DTO.RentalList"%>
<%@page import="java.util.List"%>
<%@page import="tje.Service.RentalSerivceImpl"%>
<%@page import="tje.Service.RentalService"%>
<%@ include file="/layout/jstl.jsp"%>
<%@ include file="/layout/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	RentalService rentalService = new RentalSerivceImpl();
// 	List<RentalList> rlist = rentalService.selectlist(user); 

%>
<!DOCTYPE html>
<html>
<head>
<title>관리자 게시판 목록</title>
<link rel="stylesheet" href="<%=root%>/static/css/admin_user.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style type="text/css">
/* 검색창 컨테이너 */
.rounded-search-container {
	display: flex;
	align-items: center;
	background-color: rgb(218, 214, 214);
	border-radius: 40px;
	padding: 5px 15px;
	width: 350px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	float: right;
	margin-bottom: 10px;
}

/* 검색 입력창 스타일 */
.rounded-search-input {
	flex-grow: 1;
	border: none;
	outline: none;
	padding: 8px;
	font-size: 14px;
	color: white;
	background-color: transparent;
}

/* 검색 버튼 스타일 */
.rounded-search-btn {
	border: none;
	background: none;
	cursor: pointer;
	color: white;
}

/* 검색 아이콘 크기 */
.rounded-search-btn i {
	font-size: 18px; /* 아이콘 크기 조정 */
}
</style>
</head>
<body>
	<div>
		<%@ include file="/layout/admin/sidebar.jsp"%>
	</div>
	<div class="container border-bottom border-end">
		<div class="container insert rounded-3 m-5">
			<div class="item1 fs-2 fw-bold mb-4">대출 관리</div>

			<form class="item2 d-flex flex-column row-gap-3 align-items-end"
				action="rentallist_pro.jsp" method="post">
				<div class="id">
					<span>회원 ID</span> <input type="text" name="userId">
				</div>
				<div class="book">
					<span>도서 ID</span> <input type="text" name="bookId">
				</div>
				<div class="book-stock">
					<span>재고 ID</span> <input type="text" name="stockId">
				</div>
				<input class="insertBtn rounded-3" type="submit" value="대출">
			</form>
		</div>
	</div>
	<div class="container">
		<div class="pt-5">
			<div class="pb-5">
				<div class="item1 fs-2 fw-bold mb-4">대출 검색</div>
				<div class="rounded-search-container">
					<input type="text" class="rounded-search-input"
						placeholder="search">
					<button class="rounded-search-btn">
						<i class="fa fa-search"></i>
					</button>
				</div>
			</div>
			<div class="mt-3">
				<table class="table">
					<thead>
						<tr class="text-center">
							<th scope="col">회원 ID</th>
							<th scope="col">책 ID / 재고 ID</th>
							<th scope="col">책 제목</th>
							<th scope="col">대출 일자</th>
							<th scope="col">반납 예정 일자</th>
							<th scope="col">서비스 / 상태</th>
						</tr>
					</thead>
					<tbody class="table-group-divider text-center">
						<tr>
							<td><%=  %></td>
							<td>121212<br>/241111
							</td>
							<td>실적 발표 직전</td>
							<td>2024/11/20</td>
							<td>2024/11/20</td>
							<td><span class="badge text-bg-primary"
								style="cursor: pointer;">반납하기</span> <span
								class="badge text-bg-danger">연체</span></td>
						</tr>
						<tr>
							<td>00001
							<td>121212<br>/241111
							</td>
							<td>실적 발표 직전</td>
							<td>2024/11/20</td>
							<td>2024/11/20</td>
							<td><span class="badge text-bg-primary"
								style="cursor: pointer;">반납하기</span> <span
								class="badge text-bg-success">정상</span></td>
						</tr>
						<tr>
							<td>00001
							<td>121212<br>/241111
							</td>
							<td>실적 발표 직전</td>
							<td>2024/11/20</td>
							<td>2024/11/20</td>
							<td><span class="badge text-bg-primary"
								style="cursor: pointer;">반납하기</span> <span
								class="badge text-bg-success">정상</span></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>