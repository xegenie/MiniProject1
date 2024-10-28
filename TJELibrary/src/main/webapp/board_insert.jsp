<%@page import="tje.DTO.Board"%>
<%@page import="tje.Service.BoardServiceImpl"%>
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
		String chapter3 = "게시글 쓰기";
		
	%>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판 등록</title>
	<link rel="stylesheet" href="static/css/board_insert.css">
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
            <form action="board_insert_pro.jsp" method="post">
                <div class="title-box">
                    <h1 class="main-title">게시글 쓰기</h1>
                </div>
                <div class="input-group">
                    <label for="title">제목</label>
                    <input type="text" name="title" placeholder="제목을 입력하세요" id="title" required>
                </div>

                <input type="hidden" name="bType" value="게시판"> <!-- 기본값으로 설정 -->

                <div class="input-group">
                    <textarea name="content" id="content" cols="30" rows="10" placeholder="내용을 입력하세요" required></textarea>
                </div>
                
                <div class="board-box">
                    <a href="board_list.jsp" class="btn">목록</a>
                    <input type="submit" class="insertbtn" value="글쓰기">
                </div>
            </form>
        </section>
    </div>


	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>