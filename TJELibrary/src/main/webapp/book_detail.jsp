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
%>
<!DOCTYPE html>
<html>
<head>
<title>project💻 - ALOHA CLASS🌴</title>
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
				<img class="books" src="static/img/book1.png" />
			</div>
			<div class="Description px-3 d-flex justify-content-center flex-column row-gap-1">
				<div class="head pb-2 fs-3 fw-bold">필독! 개발자 온보딩 가이드</div>
				<div class="item pb-3 border-bottom d-flex justify-content-between flex-column row-gap-5">
					<div class="middle">크리스 리코미니 지음 ; 붉은 여우 옮김 | 지식의숲 | 2024</div>
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
					<span>재고</span>
				</div>
				<div class="status d-flex justify-content-around align-items-center">
					<span>1</span>
					<span>대출 가능</span>
					<div class="reservation">
					<button class="reserve-btn">예약하기</button>
					</div>
					<span>-</span>
					<span>-</span>
					<span>2</span>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="bookinfo">
			<div class="title1 fs-3 pt-5 pb-2">책 소개</div>

			<div class="content2 m-2">
				<div class="m-3">
					<span>코딩 능률이 올라감</span>
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
    
    // 예약완료 알림 표시
    const reserveButton = document.querySelector('.reserve-btn');

    reserveButton.addEventListener('click', () => {
      alert('예약이 완료되었습니다!');
    });
  </script>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>