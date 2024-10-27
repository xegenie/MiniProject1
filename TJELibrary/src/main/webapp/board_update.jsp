<%@page import="tje.DTO.User"%>
<%@page import="tje.Service.UserServiceImpl"%>
<%@page import="tje.Service.UserService"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	
		// chapter 
		String chapterTitle = "글쓰기";
		String chapter1 = "HOME";
		String chapter2 = "게시판";
		String chapter3 = "게시글 수정";
	%>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 수정</title>
	<link rel="stylesheet" href="static/css/board_update.css">
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
        <div class="title-box">
            <h1 class="main-title">게시글 수정</h1>
        </div>
        <form action="board_update_pro.jsp" method="post">
		    <input type="hidden" name="boardId" value="BoardNo">
		    <div class="input-group">
		        <label for="title">제목</label>
		        <input type="text" name="title" placeholder="제목을 입력하세요" id="title">
		    </div>
		    <div class="input-group">
		        <textarea name="content" id="content" cols="30" rows="10"></textarea>
		    </div>
		    <div class="board-box">
		        <button type="submit" name="action" value="delete" class="btn">삭제</button>
		        <button type="submit" name="action" value="update" class="btn">수정</button>
   		 </div>
</form>
        </section>
    </div>


	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>