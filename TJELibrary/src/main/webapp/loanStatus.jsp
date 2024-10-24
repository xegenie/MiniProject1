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
				    <tr>
				      <th scope="row">1</th>
				      <td>팔꿈치를 주세요</td>
				      <td>2024/09/05</td>
				      <td>2024/09/05</td>
				      <td>정상</td>
				    </tr>
				    <tr>
				      <th scope="row">2</th>
				      <td>팔꿈치를 주세요하이하이집갈래</td>
				      <td>2024/09/05</td>
				      <td>2024/09/05</td>
				      <td>정상</td>
				    </tr>
				    <tr>
				      <th scope="row">3</th>
				      <td>팔꿈치를 주세요</td>
				      <td>2024/09/05</td>
				      <td>2024/09/05</td>
				      <td>정상</td>
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