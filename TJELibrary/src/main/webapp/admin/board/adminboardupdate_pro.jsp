<%@page import="tje.DTO.Board"%>
<%@page import="tje.Service.BoardServiceImpl"%>
<%@page import="tje.Service.BoardService"%>
<%@page import="java.io.IOException"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 수정 처리</title>
</head>
<body>
<%
    BoardService boardService = new BoardServiceImpl();
    String message = "";

    // POST 요청일 때 게시글 수정 처리
    if ("post".equalsIgnoreCase(request.getMethod())) {
        String boardIdParam = request.getParameter("board_id");
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        // Board 객체 생성 및 값 설정
        Board board = new Board();
        board.setBoardNo(Integer.parseInt(boardIdParam)); // 게시글 ID
        board.setTitle(title);
        board.setContent(content);

        // 게시글 수정 시도
        int result = boardService.update(board);
        if (result > 0) {
            response.sendRedirect("adminboardlist.jsp"); // 성공 시 목록 페이지로 리다이렉트
            return;
        } else {
            message = "게시글 수정 실패!";
        }
    } else {
        message = "잘못된 접근입니다.";
    }
%>
<p><%= message %></p>
</body>
</html>
