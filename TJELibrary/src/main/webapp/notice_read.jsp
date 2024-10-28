<%@page import="tje.DTO.Comments"%>
<%@page import="tje.DTO.Board"%>
<%@page import="java.util.List"%>
<%@page import="tje.Service.BoardServiceImpl"%>
<%@page import="tje.Service.BoardService"%>
<%@include file="/layout/jstl.jsp" %>
<%@include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // chapter 
    String chapterTitle = "공지사항";
    String chapter1 = "HOME";
    String chapter2 = "공지사항";
    String chapter3 = "댓글";
    
    int boardNo = Integer.parseInt(request.getParameter("board_id"));
    BoardService boardService = new BoardServiceImpl();
    Board board = boardService.select(boardNo);
    pageContext.setAttribute("board", board);
    
    List<Comments> comments = boardService.selectByBoardId(boardNo);
    pageContext.setAttribute("comments", comments); // 댓글 목록 저장
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>${board.title}</title>
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
            <div class="board-header">
                <h2>${board.title}</h2>
            </div>
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
                        <span class="comment-author">${comment.writer}</span>
                        <span class="comment-date">${comment.regDate}</span>
                    </div>
                    <div class="comment-content">${comment.content}</div>
                </div>
            </c:forEach>
        </section>

        <section class="comment-form">
            <h3>댓글 작성</h3> <!-- 제목 추가 -->
            <form action="comment_add.jsp" method="post">
                <input type="hidden" name="board_id" value="${board.boardNo}">
                <textarea name="content" placeholder="댓글을 입력하세요"></textarea>
                <div class="button-group">
                    <a href="notice.jsp" class="btn">목록</a>
                    <button type="submit">작성</button>
                </div>
            </form>
        </section>
    </div>

    <jsp:include page="/layout/footer.jsp" />
    <jsp:include page="/layout/script.jsp" />
</body>
</html>
