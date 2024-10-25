<%@page import="tje.DTO.Board"%>
<%@page import="java.util.List"%>
<%@page import="tje.Service.BoardServiceImpl"%>
<%@page import="tje.Service.BoardService"%>
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
		
		int boardNo = Integer.parseInt(request.getParameter("no"));
	    BoardService boardService = new BoardServiceImpl();
	    Board board = boardService.select(boardNo);
	    pageContext.setAttribute("board", board);
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
            <label for="title">${board.title}</label>
        </div>
        <div>
        	<p>${board.writer} ${board.regDate}</p>
        </div>
        <hr>
        <div class="content">
        	<h3>${board.content}</h3>
        </div>
        <hr>
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