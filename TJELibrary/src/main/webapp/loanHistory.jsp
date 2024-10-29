<%@page import="tje.Service.RentalSerivceImpl"%>
<%@page import="tje.Service.RentalService"%>
<%@page import="tje.DTO.RentalList"%>
<%@page import="java.util.List"%>
<%@page import="tje.Service.BookServiceImpl"%>
<%@page import="tje.Service.BookService"%>
<%@page import="tje.DTO.Book"%>
<%@page import="tje.Service.UserServiceImpl"%>
<%@page import="tje.Service.UserService"%>
<%@page import="tje.DTO.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//세션 사용 아이디
	User user = (User) session.getAttribute("user");
	UserService userService = new UserServiceImpl();
	
	if (user == null) {
	    out.print("로그인해라...");
	    return;
	}
	
//	user = userService.select("joeun");
	
	RentalService rentalService = new RentalSerivceImpl();
	List<RentalList> rentalList = rentalService.selectlist(user);
	int count = rentalList.size();
	
	Book book = null;
	BookService bookService = new BookServiceImpl();
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>대출 이력</title>
	<link rel="stylesheet" href="static/css/loanHistory.css">
</head>
<body>
<jsp:include page="mypage.jsp" />
<%
	String chapter3 = "대출이력";
 %>
	<main>
		<div class="container"> <!-- 버튼과 표 -->
				<div class="row d-flex text-center bg-gray"> <!-- 버튼 -->
					<div onClick="location.href='loanStatus.jsp'" class="border border-white col-2 border justify-content-center flex-fill py-2 mpbtn">대출 현황</div>
					<div onClick="location.href='loanHistory.jsp'" class="border border-white col-2 border justify-content-center flex-fill py-2 mpbtnnow">대출 이력</div>
					<div onClick="location.href='reservationStatus.jsp'" class="border border-white col-2 border justify-content-center flex-fill py-2 mpbtn">예약 현황</div>
					<div onClick="location.href='wishList.jsp'" class="border border-white col-2 border justify-content-center flex-fill py-2 mpbtn">찜한 도서</div>
					<div onClick="location.href='hopeBookStatus.jsp'" class="border border-white col-2 border justify-content-center flex-fill py-2 mpbtn">희망 도서</div>
			</div>
			<div class="pt-3">
				<table class="table">
				  <thead>
				    <tr class="text-center bg-gray">
				      <th scope="col">번호</th>				      
				      <th scope="col">도서 정보</th>
				      <th scope="col">대출일</th>
				      <th scope="col">반납일</th>
				      <th scope="col">상태</th>
				    </tr>
				  </thead>
				  <tbody class="table-group-divider text-center">
				  <%
				  	for(int i=0; i<count; i++){
				  		RentalList rl = rentalList.get(i);
				  		book = bookService.select(rl.getBookId());
				  %>
					    <tr>
					      <th scope="row"><%= i+1 %></th>
					      <td><%=book.getTitle() %></td>
					      <td><%=rl.getRentalDate() %></td>
					      <td>
							    <%= rl.getState().equals("반납") ? rl.getReturnDate() : "-" %>
						  </td>
					      <td><%= rl.getState() %></td>
					      
					    </tr>
				   <%
				  	}
				   %>
				  </tbody>
				</table>
<!-- 				<div class="pagenation"> -->
<!-- 	             ≪ ＜ ＞ ≫ -->
<!-- 	             <a href="" class="pagelink">≪</a> -->
<!-- 	             <a href="" class="pagelink">＜</a> -->
<!-- 	             <a href="" class="pagelink selected">1</a> -->
<!-- 	             <a href="" class="pagelink">2</a> -->
<!-- 	             <a href="" class="pagelink">3</a> -->
<!-- 	             <a href="" class="pagelink">4</a> -->
<!-- 	             <a href="" class="pagelink">5</a> -->
<!-- 	             <a href="" class="pagelink">＞</a> -->
<!-- 	             <a href="" class="pagelink">≫</a> -->
<!-- 	            </div> -->
			</div>	
		</div>
	</main>
	<div class="pt-5">
		<jsp:include page="/layout/footer.jsp" />
	</div>
</body>
</html>