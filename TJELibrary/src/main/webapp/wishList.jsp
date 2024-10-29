<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tje.Service.WishListServiceImpl"%>
<%@page import="tje.Service.WishListService"%>
<%@page import="tje.DTO.WishList"%>
<%@page import="tje.DTO.Book"%>
<%@page import="tje.Service.BookService"%>
<%@page import="tje.Service.BookServiceImpl"%>
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
	// 세션 사용 아이디
	String id = (String) session.getAttribute("user");
	
	User user = new User();
	UserService userService = new UserServiceImpl();
	user = userService.select(id);
// 	user = userService.select("joeun");
	
	BookService bookService = new BookServiceImpl();
	Book book = null;
	
	WishList wishList = new WishList();
	List<Book> bookList = new ArrayList();
	WishListService wishListService = new WishListServiceImpl();
	bookList = wishListService.select(user);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
</head>
<body>
	<jsp:include page="mypage.jsp" />
	<main>
		<div class="container"> <!-- 버튼과 표 -->
				<div class="row d-flex text-center bg-gray"> <!-- 버튼 -->
					<div onClick="location.href='loanStatus.jsp'" class="border border-white col-2 border justify-content-center flex-fill py-2 mpbtn">대출 현황</div>
					<div onClick="location.href='loanHistory.jsp'" class="border border-white col-2 border justify-content-center flex-fill py-2 mpbtn">대출 이력</div>
					<div onClick="location.href='reservationStatus.jsp'" class="border border-white col-2 border justify-content-center flex-fill py-2 mpbtn">예약 현황</div>
					<div onClick="location.href='wishList.jsp'" class="border border-white col-2 border justify-content-center flex-fill py-2 mpbtnnow">찜한 도서</div>
					<div onClick="location.href='hopeBookStatus.jsp'" class="border border-white col-2 border justify-content-center flex-fill py-2 mpbtn">희망 도서</div>
			</div>
			<div class="pt-3">
				<table class="table">
				  <thead>
				    <tr class="text-center bg-gray">
				      <th scope="col">번호</th>				      
				      <th scope="col">도서정보</th>
				      <th scope="col">저자</th>
				      <th scope="col">출판사</th>				      
				    </tr>
				  </thead>
				  <tbody class="table-group-divider text-center">
				  <%
				  	for (int i=0; i<bookList.size(); i++) {
				  %>
				    <tr>
				      <th scope="row"><%=i+1 %></th>
				      <td><%= bookList.get(i).getTitle() %></td>
				      <td><%= bookList.get(i).getAuthor() %></td>
				      <td><%= bookList.get(i).getPublisher() %></td>
				    </tr>
				    <%
				  	}
				    %>
				  </tbody>
				</table>
			</div>	
		</div>
	</main>
	<div class="pt-5">
		<jsp:include page="/layout/footer.jsp" />
	</div>
</body>
</html>