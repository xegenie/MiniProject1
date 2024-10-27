<%@page import="tje.DTO.BookStock"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tje.DTO.RentalList"%>
<%@page import="tje.Service.BookService"%>
<%@page import="tje.Service.BookServiceImpl"%>
<%@page import="tje.DTO.Book"%>
<%@page import="java.util.List"%>
<%@page import="tje.Service.RentalSerivceImpl"%>
<%@page import="tje.Service.RentalService"%>
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
// 	String id = (String) session.getAttribute("id");
	
	User user = new User();
	UserService userService = new UserServiceImpl();
// 	user = userService.select(id);
	user = userService.select("joeun");
	
	BookService bookService = new BookServiceImpl();
	Book book = null;
	
	RentalService rentalService = new RentalSerivceImpl();
	List<RentalList> rentalList = rentalService.selectlist(user);
	int count = rentalList.size();
	List<RentalList> loanStatusList = new ArrayList();
	for(int i = 0; i<count; i++){
		RentalList temp = rentalList.get(i);
		if(temp.getState() == "대출") {
			loanStatusList.add(temp);
		}
	}
	
	
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
					<div class="border border-white col-2 border justify-content-center flex-fill py-2 mpbtnnow">대출 현황</div>
					<div onClick="location.href='#'" class="border border-white col-2 border justify-content-center flex-fill py-2 mpbtn">대출 이력</div>
					<div onClick="location.href='#'" class="border border-white col-2 border justify-content-center flex-fill py-2 mpbtn">예약 현황</div>
					<div onClick="location.href='#'" class="border border-white col-2 border justify-content-center flex-fill py-2 mpbtn">찜한 도서</div>
					<div onClick="location.href='#'" class="border border-white col-2 border justify-content-center flex-fill py-2 mpbtn">희망 도서</div>
			</div>
			<div class="pt-3">
				<table class="table">
				  <thead>
				    <tr class="text-center bg-gray">
				      <th scope="col">번호</th>				      
				      <th scope="col">도서 정보</th>
				      <th scope="col">대출일</th>
				      <th scope="col">반납예정일</th>
				      <th scope="col">상태</th>
				    </tr>
				  </thead>
				  <tbody class="table-group-divider text-center">
				    <%
				  	for(int i=0; i<loanStatusList.size(); i++){
				  		book = bookService.select(loanStatusList.get(i).getBookId());
				  %>
				    <tr>
				      <th scope="row"><%= i++ %></th>
				      <td><%= book.getTitle() %></td>
				      <td><%= loanStatusList.get(i).getRentalDate() %></td>
				      <td><%= loanStatusList.get(i).getReturnDate() %></td>
				      <%
				      BookStock ckBookstock = new BookStock();
				      ckBookstock.setBookId(loanStatusList.get(i).getBookId());
				      ckBookstock.setStockId(loanStatusList.get(i).getStockId());
				      ckBookstock.setStatus("대출");
				      	int day = (int)rentalService.overdue(ckBookstock, user);
						if(day>0) {				      
				      %>
				      <td>연체</td>
				      <%
						} else {
				      %>
				      <td>정상</td>
				      <%
						}
				      %>
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