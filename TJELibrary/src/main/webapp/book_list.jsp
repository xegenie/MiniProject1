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
		<div class="book d-flex border-bottom py-2">
			<div class="head">
				<div class="no">NO. 1</div>
				<img class="books" src="static/img/book1.png" />
			</div>
			<div class="Description px-3 d-flex flex-column row-gap-5">
				<div class="kind rounded-5">단행본</div>
				<div class="head">
					<h2>필독! 개발자 온보딩 가이드</h2>
				</div>
				<div class="middle">크리스 리코미니 지음 ; 붉은 여우 옮김 | 지식의숲 | 2024</div>
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
		<div class="book d-flex border-bottom py-2">
			<div class="head">
				<div class="no">NO. 2</div>
				<img class="books" src="static/img/book2.png" />
			</div>
			<div class="Description px-3 d-flex flex-column row-gap-5">
				<div class="kind rounded-5">단행본</div>
				<div class="head">
					<h2>세상에서 가장 쉬운 코딩책</h2>
				</div>
				<div class="middle">위캔코딩 지음 ; 붉은 여우 옮김 | 지식의숲 | 2024</div>
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
		<div class="book d-flex border-bottom py-2">
			<div class="head">
				<div class="no">NO. 3</div>
				<img class="books" src="static/img/book3.png" />
			</div>
			<div class="Description px-3 d-flex flex-column row-gap-5">
				<div class="kind rounded-5">단행본</div>
				<div class="head">
					<h2>어떤 개발자가 되고 싶니?</h2>
				</div>
				<div class="middle">박동기 글; 송진욱 그림; 안미연 옮김 | 좋은책어린이 | 2024</div>
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
		<div class="book d-flex border-bottom py-2">
			<div class="head">
				<div class="no">NO. 4</div>
				<img class="books" src="static/img/book4.png" />
			</div>
			<div class="Description px-3 d-flex flex-column row-gap-5">
				<div class="kind rounded-5">단행본</div>
				<div class="head">
					<h2>GPT 제너레이션</h2>
				</div>
				<div class="middle">이시한 지음; 김난령 옮김; 최승혜 그림 | 좋은책어린이 | 2024</div>
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
		<div class="book d-flex border-bottom py-2">
			<div class="head">
				<div class="no">NO. 5</div>
				<img class="books" src="static/img/book5.png" />
			</div>
			<div class="Description px-3 d-flex flex-column row-gap-5">
				<div class="kind rounded-5">단행본</div>
				<div class="head">
					<h2>챗 GPT</h2>
				</div>
				<div class="middle">반병현 지음 | 행복우물 | 2024</div>
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
		<div class="pageNo d-flex justify-content-center column-gap-3 py-5">
			<div class="_1">1</div>
			<div class="_2">2</div>
			<div class="_3">3</div>
			<div class="_4">4</div>
			<div class="_5">5</div>
			<div class="div7">&gt;</div>
			<div class="div8">&gt;&gt;</div>
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