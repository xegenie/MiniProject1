<%@page import="tje.DTO.HopeBook"%>
<%@page import="java.util.List"%>
<%@page import="tje.Service.HopeBookServiceImpl"%>
<%@page import="tje.Service.HopeBookService"%>
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
	
	HopeBookService hopeBookService = new HopeBookServiceImpl();
	List<HopeBook> hopeList = hopeBookService.selectById(user);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>희망 도서</title>
</head>
<body>
	<jsp:include page="mypage.jsp" />
	<main>
		<div class="container"> <!-- 버튼과 표 -->
				<div class="row d-flex text-center bg-gray"> <!-- 버튼 -->
					<div onClick="location.href='loanStatus.jsp'" class="border border-white col-2 border justify-content-center flex-fill py-2 mpbtn">대출 현황</div>
					<div onClick="location.href='loanHistory.jsp'" class="border border-white col-2 border justify-content-center flex-fill py-2 mpbtn">대출 이력</div>
					<div onClick="location.href='reservationStatus.jsp'" class="border border-white col-2 border justify-content-center flex-fill py-2 mpbtn">예약 현황</div>
					<div onClick="location.href='wishList.jsp'" class="border border-white col-2 border justify-content-center flex-fill py-2 mpbtn">찜한 도서</div>
					<div onClick="location.href='hopeBookSatus.jsp'" class="border border-white col-2 border justify-content-center flex-fill py-2 mpbtnnow"><a href="hopeBookStatus.jsp">희망 도서</a></div>
			</div>
			<div class="pt-3">
				<table class="table">
				  <thead>
				    <tr class="text-center bg-gray">
				      <th scope="col">자료명</th>				      
				      <th scope="col">저자</th>
				      <th scope="col">출판사</th>
				      <th scope="col">신청상태</th>
				    </tr>
				  </thead>
				  <tbody class="table-group-divider text-center">
				  <%
				  for(int i=0; i<hopeList.size(); i++) {
					  
				  %>
				    <tr>
				      <td><%= hopeList.get(i).getBookName() %></td>
				      <td><%= hopeList.get(i).getAuthor() %></td>
				      <td><%= hopeList.get(i).getPublisher() %></td>
				      <td>신청접수</td>
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