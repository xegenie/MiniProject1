<%@page import="com.alohaclass.jdbc.dto.Page"%>
<%@page import="com.alohaclass.jdbc.dto.PageInfo"%>
<%@page import="tje.DTO.Book"%>
<%@page import="java.util.List"%>
<%@page import="tje.Service.BookServiceImpl"%>
<%@page import="tje.Service.BookService"%>
<%@page import="tje.DTO.BookStock"%>
<%@page import="tje.DTO.User"%>
<%@page import="tje.Service.UserServiceImpl"%>
<%@page import="tje.Service.UserService"%>
<%@ include file="/layout/jstl.jsp"%>
<%@ include file="/layout/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	// chapter 
	String chapterTitle = "통합검색";
	String chapter1 = "HOME";
	String chapter2 = "자료탐색";
	String chapter3 = "통합검색";
	
	String pageNoStr = request.getParameter("pageNo");
	int pageNo = pageNoStr == null ? 1 : Integer.parseInt(pageNoStr);
	
	// 책 목록 조회
	BookService bookService = new BookServiceImpl();
	PageInfo<Book> pageInfo = bookService.page(pageNo, 5);
	List<Book> list = pageInfo.getList();
	Page pageObj = pageInfo.getPage();
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("page", pageObj);
%>
<!DOCTYPE html>
<html>

<head>
<title>도서목록</title>
<jsp:include page="/layout/meta.jsp" />
<jsp:include page="/layout/link.jsp" />
<link rel="stylesheet" href="static/css/book_list.css">
</head>

<body>
	<jsp:include page="/layout/header.jsp" />

	<%-- [Contents] ######################################################### --%>
	<div class="pb-4 pt-5">
		<%@ include file="/layout/chapter.jsp"%>
	</div>
	
	<div class="container">
		
		<c:forEach var="book" items="${list}">
			<div class="book d-flex border-bottom py-2">
				<div class="head">
					<div class="no">NO. ${ book.id }</div>
					<img class="books" src="static/img/book1.png" />
				</div>
				<div class="Description px-3 d-flex flex-column row-gap-5">
					<div class="kind rounded-5">단행본</div>
					<div class="head">
						<h2>${ book.title }</h2>
					</div>
<!-- 					<div class="middle">크리스 리코미니 지음 ; 붉은 여우 옮김 | 지식의숲 | 2024</div> -->
					<div class="middle">${ book.author } 지음 | ${ book.publisher } | 2024 </div>
					<div class="bottom d-flex justify-content-between align-items-end;">
						<div>
							<span class="popular">인기도서</span> <span>&nbsp;|&nbsp;도서정보</span>
						</div>
						<button class="wishbtn d-flex flex-column align-items-center pt-2">
							<i class="fa fa-heart"></i> <span>찜하기</span>
						</button>
					</div>
				</div>
			</div>
		</c:forEach>
		
		<div class="pageNo d-flex justify-content-center column-gap-3 py-5">
		    <div>
		    	<a href="<%= root %>/book_list.jsp?pageNo=${page.first}">&lt;&lt;</a>
		    </div>
		    <div>
		    	<a href="<%= root %>/book_list.jsp?pageNo=${page.prev}">&lt;</a>
		    </div>
		    <c:forEach var="i" begin="${page.start}" end="${page.end}">
		        <div class="${i == page.page ? 'active' : ''}">
		        	<a href="<%= root %>/book_list.jsp?pageNo=${i}">${i}</a>
		        </div>
		    </c:forEach>
		    <div>
		    	<a href="<%= root %>/book_list.jsp?pageNo=${page.next}">&gt;</a>
		    </div>
		    <div>
		    	<a href="<%= root %>/book_list.jsp?pageNo=${page.last}">&gt;&gt;</a>
		    </div>
		</div>
	</div>
	
	<script>
	  const heartButtons = document.querySelectorAll('.wishbtn');
	
	  // 각 버튼에 클릭 이벤트를 개별적으로 추가합니다.
	  heartButtons.forEach((button) => {
	    button.addEventListener('click', () => {
	      button.classList.toggle('active'); // 클릭 시 active 클래스 토글
	    });
	  });
	</script>

	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>

</html>