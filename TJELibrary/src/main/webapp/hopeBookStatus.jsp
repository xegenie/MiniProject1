<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				    <tr>
				      <td>팔꿈치를 주세요</td>
				      <td>황정은</td>
				      <td>큐큐</td>
				      <td>신청접수</td>
				    </tr>
				    <tr>
				      <td>팔꿈치를 주세요</td>
				      <td>황정은</td>
				      <td>큐큐</td>
				      <td>신청취소</td>
				    </tr>
				    <tr>
				      <td>팔꿈치를 주세요</td>
				      <td>황정은</td>
				      <td>큐큐</td>
				      <td>완료</td>
				    </tr>
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