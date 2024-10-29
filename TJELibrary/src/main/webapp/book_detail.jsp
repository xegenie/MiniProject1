<%@page import="tje.DTO.Files"%>
<%@page import="tje.Service.FilesServiceImpl"%>
<%@page import="tje.Service.FilesService"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="tje.Service.RentalSerivceImpl"%>
<%@page import="tje.Service.RentalService"%>
<%@page import="tje.DTO.RentalList"%>
<%@page import="tje.DTO.BookStock"%>
<%@page import="tje.DTO.Book"%>
<%@page import="tje.Service.BookServiceImpl"%>
<%@page import="tje.Service.BookService"%>
<%@page import="tje.DTO.User"%>
<%@page import="tje.Service.UserServiceImpl"%>
<%@page import="tje.Service.UserService"%>
<%@ include file="/layout/jstl.jsp"%>
<%@ include file="/layout/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	// chapter 
	String chapterTitle = "상세정보";
	String chapter1 = "HOME";
	String chapter2 = "자료탐색";
	String chapter3 = "상세정보";

	// 요청에서 책 ID 가져오기
    String bookIdStr = request.getParameter("bookId");
    
    // 책 ID가 null인지 확인하고, 숫자로 변환
    int bookId = (bookIdStr != null) ? Integer.parseInt(bookIdStr) : 0;

    BookService bookService = new BookServiceImpl();

    // 책 ID로 책 정보 조회
    Book book = bookService.select(bookId);
    // 책 재고정보 조회
    BookStock bookStock = bookService.selectStock(bookId);
	// 대출내역 조회
	RentalList rentalList =  bookService.selectRental(bookStock.getStockId());
	// 파일 조회
		FilesService filesService = new FilesServiceImpl();
		Files imgfile = filesService.select(bookId); // 파일 정보 조회
		String fullPath = imgfile.getFilePath(); // 전체 파일 경로 가져오기

	    String[] parts = fullPath.split("static\\\\");
	    String imgPath = parts[1]; // "img" 부분이 포함된 경로
    
    // 대여일자 표시 
	    String rentalDay = "-"; // 대출일
	    String returnDay = "-"; // 반납일
	    String overDay = "-"; // 연체일
	    
    // 재고에서 상태 가져와서 상태가 대출중일 때만
    if ( bookStock != null && "대출 불가".equals(bookStock.getStatus()) ) {
	    //대여일
	    Date rentalDate = rentalList.getRentalDate();
	    
	    Calendar calendar = Calendar.getInstance();
	    calendar.setTime(rentalDate);
	    // 7일 더함
	    calendar.add(Calendar.DATE, 7);
	    Date returnDate = calendar.getTime();
	    
        // 현재 날짜와 반납 예정일 비교 (연체일 계산)
        Date currentDate = new Date(); // 현재 날짜
        long diffMillis = currentDate.getTime() - returnDate.getTime();
        long overDays = diffMillis / (1000 * 60 * 60 * 24); // 밀리초 -> 일수 변환

        // 연체일 계산 (음수일 경우 0으로 처리)
        overDay = overDays > 0 ? String.valueOf(overDays) : "0";
	    // 형식맞춤
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    rentalDay = sdf.format(rentalDate);
	    returnDay = sdf.format(returnDate);
    }
    
    // 회원정보 가져오기
    // 세션에서 로그인한 회원 정보 가져오기
    User user = (User)session.getAttribute("user"); 

//     if (user == null) {
//         // 회원 정보가 없을 경우 로그인 페이지로 이동
//         response.sendRedirect("login.jsp");
//         return;
//     }
	String userId = "";	

	if ( user != null ) {
    	userId = user.getId();
	}
	pageContext.setAttribute("userId", userId);
	
	// 재고 ID 가져오기 (안함)
	
    // 책 정보를 페이지 컨텍스트에 저장
    pageContext.setAttribute("book", book);
    pageContext.setAttribute("bookStock", bookStock);
    pageContext.setAttribute("rentalList", rentalList);
    pageContext.setAttribute("rentalDay", rentalDay);
    pageContext.setAttribute("returnDay", returnDay);
    pageContext.setAttribute("overDay", overDay);

%>

<!DOCTYPE html>
<html>
<head>
<title>도서 상세목록 페이지</title>
<jsp:include page="/layout/meta.jsp" />
<jsp:include page="/layout/link.jsp" />
<link rel="stylesheet" href="static/css/book_detail.css">
</head>
<body>
	<jsp:include page="/layout/header.jsp" />
	<%-- [Contents] ######################################################### --%>
	<div class="pb-4 pt-5">
		<%@ include file="/layout/chapter.jsp"%>
	</div>

	<div class="container">
		<div class="book d-flex py-2">
			<div class="head d-flex flex-column">
				<a href="book_list.jsp" class="backward p-2 rounded-2">
					 <i class="fa fa-arrow-left d-flex align-items-center" style="color: white;"></i>
				</a>
				<img class="books" src="${pageContext.request.contextPath}/static/<%= imgPath %>" />
			</div>
			<div class="Description px-3 d-flex justify-content-center flex-column row-gap-1">
				<div class="head pb-2 fs-3 fw-bold">${ book.title }</div>
				<div class="item pb-3 border-bottom d-flex justify-content-between flex-column row-gap-5">
					<div class="middle">${ book.author } 지음 | ${ book.publisher } | 2024 </div>
					<div class="middle">ISBN : ${ book.isbn } </div>
					<div>
						<span class="fw-bold" style="color: #4a18ff">인기도서</span> <span class="fw-bold" style="color:blueviolet">&nbsp;|&nbsp;신착도서</span>
					</div>
					<div class="bottom d-flex justify-content-end align-items-end;">
						<button class="wishbtn d-flex flex-column align-items-center pt-2"
							id="heartButton">
							<i class="fa fa-heart"></i> <span>찜하기</span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="bookinfo">
			<div class="title1 fs-3 pt-5 pb-2">책 정보</div>
			
			<div class="content1 m-5">
				<div class="menu d-flex justify-content-around bg-dark-subtle">
					<span>도서 ID</span>
					<span>대출상태</span>
					<span>서비스</span>
					<span>반납예정</span>
					<span>연체기간</span>
					<span>재고 ID</span>
				</div>
				<div class="status d-flex justify-content-around align-items-center">
					<span>${ book.id }</span>
					<span>${ bookStock.status }</span>
					<div class="reservation">
						<c:choose>
						    <c:when test="${bookStock.status == '대출 가능'}">
						        <!-- 예약 버튼 폼 -->
						        <form action="<%= request.getContextPath() %>/reserveUpload.jsp" method="post">
						            <input type="hidden" name="userId" value="<%= userId %>" />
						            <input type="hidden" name="bookId" value="<%= book.getId() %>" />
						            <input type="hidden" name="stockId" value="<%= bookStock.getStockId() %>" />
						            <input class="reserve-btn" type="submit" value="예약하기" />
						        </form>
						    </c:when>
						    <c:otherwise>
						        <span class="stockStatus">${bookStock.status}</span>
						    </c:otherwise>
						</c:choose>
					</div>
					<span>${ returnDay }</span>
					<span>${ overDay }</span>
					<span>${ bookStock.stockId }</span>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="bookinfo">
			<div class="title1 fs-3 pt-5 pb-2">책 소개</div>

			<div class="content2 m-2">
				<div class="m-3">
					<span>${ book.outline }</span>
				</div>
			</div>
		</div>
	</div>
	<%-- [Contents] ######################################################### --%>
	<script>
    // 클릭 시 active 상태를 토글
    const heartButton = document.getElementById('heartButton');

    heartButton.addEventListener('click', () => {
        heartButton.classList.toggle('active');
      });
    
  </script>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>