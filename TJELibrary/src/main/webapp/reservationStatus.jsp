<%@page import="tje.DTO.BookStock"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tje.DTO.Book"%>
<%@page import="tje.Service.BookServiceImpl"%>
<%@page import="tje.Service.BookService"%>
<%@page import="tje.DTO.RentalList"%>
<%@page import="java.util.List"%>
<%@page import="tje.Service.RentalService"%>
<%@page import="tje.Service.RentalSerivceImpl"%>
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
	
//	user = userService.select("joeun");
	
	BookService bookService = new BookServiceImpl();
	Book book = null;
	
	RentalService rentalService = new RentalSerivceImpl();
	List<RentalList> rentalList = rentalService.selectlist(user);
	int count = rentalList.size();
	List<RentalList> rvStatusList = new ArrayList<RentalList>();
	for(int i = 0; i<count; i++){
		RentalList temp = rentalList.get(i);
		if(temp.getState().equals("예약") ) {
			rvStatusList.add(temp);
		}
	}
	List<BookStock> rvBookStockList = new ArrayList<BookStock>();
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
					<div onClick="location.href='reservationStatus.jsp'" class="border border-white col-2 border justify-content-center flex-fill py-2 mpbtnnow">예약 현황</div>
					<div onClick="location.href='wishList.jsp'" class="border border-white col-2 border justify-content-center flex-fill py-2 mpbtn">찜한 도서</div>
					<div onClick="location.href='hopeBookStatus.jsp'" class="border border-white col-2 border justify-content-center flex-fill py-2 mpbtn">희망 도서</div>
			</div>
			<div class="pt-3">
				<table class="table">
				  <thead>
				    <tr class="text-center bg-gray">
				      <th scope="col">번호</th>				      
				      <th scope="col">도서정보</th>
				      <th scope="col">예약일</th>
				      <th scope="col">예약취소</th>
				    </tr>
				  </thead>
				  <tbody class="table-group-divider text-center">
				  <%
				  	for(int i=0; i<rvStatusList.size(); i++){
				  		book = bookService.select(rvStatusList.get(i).getBookId());
				  		BookStock rvBookStock = new BookStock();
				  		rvBookStock.setBookId(rvStatusList.get(i).getBookId());
				  		rvBookStock.setStockId(rvStatusList.get(i).getStockId());
				  		rvBookStock.setStatus("예약 중");
				  		rvBookStockList.add(rvBookStock);
				  %>
				    <tr>
				      <th scope="row"><%= i+1 %></th>
				      <td><%= book.getTitle() %></td>
				      <td><%= rvStatusList.get(i).getRentalDate() %></td>
				      <td>
				      	<button type="submit" onclick="rvDelete('<%= rvStatusList.get(i).getNo() %>')" name="rvdelete" class="btn btn-primary">
				      	예약취소</button>
				      </td>
				    </tr>
					<%} %>
				  </tbody>
				</table>
			</div>	
		</div>
	</main>
	<div class="pt-5">
		<jsp:include page="/layout/footer.jsp" />
	</div>
	<script type="text/javascript">
	 function rvDelete(rvId) {
		 if (confirm("정말로 취소하시겠습니까?")) {
			 window.location.href = 'reservationStatus_pro.jsp?rvId='
					+ encodeURIComponent(rvId);
		    }
	    }
	</script>
</body>
</html>