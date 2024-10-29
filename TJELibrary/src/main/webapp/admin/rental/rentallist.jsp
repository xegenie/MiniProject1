<%@page import="tje.DTO.BookStock"%>
<%@page import="tje.DAO.BookStockDAO"%>
<%@page import="tje.DAO.RentalListDAO"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="tje.Service.BookServiceImpl"%>
<%@page import="tje.Service.BookService"%>
<%@page import="tje.DTO.Book"%>
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
	List<RentalList> rlist = rentalService.selectByState("대출"); 
	BookService bookService = new BookServiceImpl();
	
%>
<!DOCTYPE html>
<html>
<head>
<title>관리자 게시판 목록</title>
<link rel="stylesheet" href="<%=root%>/static/css/admin_user.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
					<%
						for (int i=0; i<rlist.size(); i++) {
						Book book= bookService.select(rlist.get(i).getBookId());
						Date returnDate = rlist.get(i).getRentalDate();
						LocalDate localDate = returnDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
						LocalDate newLocalDate = localDate.plusDays(7);
						Date newReturnDate = Date.from(newLocalDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
						LocalDate today = LocalDate.now();
						int bookNo = rlist.get(i).getNo();
					%>
						<tr>
							<td><%= rlist.get(i).getId() %></td>
							<td><%=rlist.get(i).getBookId() %><br>/<%= rlist.get(i).getStockId() %>
							</td>
							<td><%= book.getTitle() %></td>
							<td><%= rlist.get(i).getRentalDate() %></td>
							<td><%= newReturnDate %></td>
							<td><button class="badge text-bg-primary"
								onclick="returnBook('<%= bookNo %>')"
								style="cursor: pointer;">반납하기</button> 
							<%
								if(newLocalDate.isBefore(today)) {
							%>
								<span class="badge text-bg-danger">연체</span>
							<%
								} else {
							%>
								<span class="badge text-bg-success">정상</span>
							<%
								}
							%></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	 function returnBook(rentalNo) {
		 if (confirm("정말로 반납하시겠습니까?")) {
			 window.location.href = 'returnBook.jsp?returnUserNo='
					+ encodeURIComponent(rentalNo);
		    }
	    }
	</script>
</body>
</html>