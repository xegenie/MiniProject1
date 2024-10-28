<%@page import="com.alohaclass.jdbc.dto.Page"%>
<%@page import="com.alohaclass.jdbc.dto.PageInfo"%>
<%@page import="java.util.List"%>
<%@page import="tje.Service.BookServiceImpl"%>
<%@page import="tje.Service.BookService"%>
<%@page import="tje.DTO.User"%>
<%@page import="tje.DTO.Book"%>
<%@page import="tje.Service.UserServiceImpl"%>
<%@page import="tje.Service.UserService"%>
<%@ include file="/layout/jstl.jsp"%>
<%@ include file="/layout/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	// 책 목록 전체 조회
	BookService bookService = new BookServiceImpl();
	List<Book> list = bookService.list(); // 모든 책 목록 조회
	
	// 조회된 리스트를 페이지 컨텍스트에 저장
	pageContext.setAttribute("list", list);
	
    // URL 파라미터에서 데이터 받기
    String bookId = request.getParameter("id");
    String bookTitle = request.getParameter("title");
    String bookAuthor = request.getParameter("author");
    String bookPublisher = request.getParameter("publisher");
    String bookIsbn = request.getParameter("isbn");
    String bookOutline = request.getParameter("outline");

%>

<!DOCTYPE html>
<html>
<head>
<title>관리자 도서관리</title>
<jsp:include page="/layout/meta.jsp" />
<jsp:include page="/layout/link.jsp" />
<link rel="stylesheet" href="<%=root%>/static/css/book_insert.css">
</head>
<body>
	<div><%@ include file="/layout/admin/sidebar.jsp"%></div>
	<%-- [Contents] ######################################################### --%>
	<div class="container border-bottom border-end">
		<div class="insert rounded-3 m-5">
			<div class="item1 fs-2 fw-bold mb-4">도서수정</div>
			<div class="item2">
				<form class="d-flex flex-column row-gap-2 align-items-end"
					action="<%=request.getContextPath()%>/admin/book/fileupdate_pro.jsp?bookId=<%= bookId %>"
					method="post" enctype="multipart/form-data">
					<input type="hidden" name="id" value="<%= bookId %>" />
					<div class="title">
						<span>책 제목</span> <input type="text" name="title"
							value="<%= bookTitle %>" required>
					</div>
					<div class="name">
						<span>저자</span> <input type="text" name="author"
							value="<%= bookAuthor %>" required>
					</div>
					<div class="publisher">
						<span>출판사</span> <input type="text" name="publisher"
							value="<%= bookPublisher %>" required>
					</div>
					<div class="isbn">
						<span>ISBN</span> <input type="text" name="isbn"
							value="<%= bookIsbn %>" required>
					</div>
					<div class="outline">
						<span>책 개요</span> <input type="text" name="outline"
							value="<%= bookOutline %>" required>
					</div>
					<div class="files">
						<span>도서 이미지</span> <input type="file" name="file1" required>
					</div>
					<div class="insertBox mt-3 d-flex justify-content-end">
						<input class="insertBtn rounded-3" type="submit" value="수정">
					</div>
				</form>
			</div>

		</div>
	</div>
	<div class="container ps-5">
		<table class="board-list">
			<thead>
				<tr>
					<th>No.</th>
					<th>도서명</th>
					<th>저자</th>
					<th>출판사</th>
					<th>책 개요</th>
					<th>관리</th>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach var="book" items="${list}">
				<tr>
					<td>${ book.id }</td>
					<td>${ book.title }</td>
					<td>${ book.author }</td>
					<td>${ book.publisher }</td>
					<td>${ book.outline }</td>
					<td>
						<a href="book_update.jsp?id=${book.id}&title=${book.title}&author=${book.author}&publisher=${book.publisher}&isbn=${book.isbn}&outline=${book.outline}">
						<button class="updateBtn" type="submit">수정</button>
						</a>
						<a href="filedelete_pro.jsp?id=${book.id}">
						<button type="button">삭제</button>
						</a>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>

	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/layout/script.jsp" />
</body>
</html>