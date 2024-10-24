<%@page import="tje.DTO.User"%>
<%@page import="tje.Service.UserServiceImpl"%>
<%@page import="tje.Service.UserService"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	
		// chapter 
		String chapterTitle = "댓글";
		String chapter1 = "HOME";
		String chapter2 = "게시판";
		String chapter3 = "댓글";
	%>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판 등록</title>
	<link rel="stylesheet" href="static/css/board_read.css">
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
</head>
<body>
	<jsp:include page="/layout/header.jsp" />
	<div style="margin-top: 50px;">
		<%@ include file="/layout/chapter.jsp" %>
	</div>
	<div class="container">
        <section>
        <div class="title">
            <label for="title">고1인데 개발을 배워보려고 합니다.</label>
        </div>
        <div>
        	<p>익명게시판 2일전 조회수 26</p>
        </div>
        <hr>
        <div class="content">
        	<h3>내용dddddddddddddddddddddddddddddddddddddddddd<br>
       		dddddddddddddddddddddddddd</h3>
        </div>
        <hr>
        <div class="img-container">
        <div class="heart-group">
		    <img class="icon1" src="static/img/heart.png">
		    <p>0</p>
	    </div>
	    <div class="answer-group">
		    <img class="icon4" src="static/img/answer.png">
		    <p>0</p>
	    </div>
	    </div>
        <div class="input-group">
		    <textarea name="content" id="content" cols="30" rows="10"></textarea>
		</div>
		<div class="button-group">
		    <a href="#" class="btn">작성</a>
	  </div>
        <div class="board-box">
	    		<a href="" class="btn">삭제</a>
	    		<a href="" class="btn">수정</a>
    		</div>
        </section>
    </div>


	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>