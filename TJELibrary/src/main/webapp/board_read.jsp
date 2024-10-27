<%@page import="tje.DTO.Comments"%>
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
		
		int boardNo = Integer.parseInt(request.getParameter("board_id"));
	    BoardService boardService = new BoardServiceImpl();
	    Board board = boardService.select(boardNo);
	    pageContext.setAttribute("board", board);
	    
	    int commentsNo = Integer.parseInt(request.getParameter("board_id"));
	    BoardService commentService = new BoardServiceImpl();
	    List<Comments> comments = commentService.selectByBoardId(boardNo);
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
        <!-- 게시글 정보 표시 -->
        <section class="board-content">
            <h2>${board.title}</h2>
            <p>${board.writer} | ${board.regDate}</p>
            <hr>
            <div>${board.content}</div>
        </section>

        <!-- 댓글 목록 표시 -->
        <section class="comment-list">
            <h3>댓글</h3>
            <c:forEach var="comment" items="${comments}">
                <div class="comment-item">
                    <div class="comment-header">
                        <span class="comment-author">${comment.author}</span>
                        <span class="comment-date">${comment.regDate}</span>
                    </div>
                    <div class="comment-content">${comment.content}</div>
                </div>
            </c:forEach>
        </section>

        <!-- 댓글 작성 폼 -->
        <section class="comment-form">
            <form action="comment_add.jsp" method="post">
                <input type="hidden" name="board_id" value="${boardNo}">
                <textarea name="content" rows="4" placeholder="댓글을 입력하세요"></textarea>
                <button type="submit">작성</button>
            </form>
        </section>
    </div>


	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>