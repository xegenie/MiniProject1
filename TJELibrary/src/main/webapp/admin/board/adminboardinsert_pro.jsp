<%@page import="tje.DTO.Board"%>
<%@page import="tje.DTO.User"%>
<%@page import="tje.Service.BoardServiceImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    BoardServiceImpl boardService = new BoardServiceImpl();
    String message = "";
    
    // POST 요청일 때 게시글 등록 처리
    if ("post".equalsIgnoreCase(request.getMethod())) {
        String title = request.getParameter("title");
        User user = (User)session.getAttribute("user");
        String userId = user != null ? user.getId() : null; // 사용자의 ID 가져오기
        String content = request.getParameter("content");
        String bType = request.getParameter("bType"); // bType 추가

        // Board 객체 생성 및 값 설정
        Board board = new Board();
        board.setTitle(title);
        board.setContent(content);
        board.setBType(bType); // bType 설정
        

        // 게시글 등록 시도
        int result = boardService.insert(board,user); // 사용자 ID를 포함하도록 수정
        if (result > 0) {
            response.sendRedirect("adminboardlist.jsp"); // 성공 시 목록 페이지로 리다이렉트
            return;
        } else {
            message = "게시글 등록 실패!";
        }
    } else {
        message = "잘못된 접근입니다.";
    }
%>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<body>
    <c:if test="${not empty message}">
        <script>alert('${message}');</script>
    </c:if>
</body>
</html>
