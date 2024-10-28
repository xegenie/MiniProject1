<%@page import="tje.DTO.User"%>
<%@ page import="tje.DTO.Board" %>
<%@ page import="tje.Service.BoardServiceImpl" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	BoardServiceImpl boardService = new BoardServiceImpl();
	String message = "";
	
	// POST 요청일 때 게시글 등록 처리
	if ("post".equalsIgnoreCase(request.getMethod())) {
	    String title = request.getParameter("title");
	    String userId = "";
	    User user = (User)session.getAttribute("user");
	    userId = user.getId();
	    String content = request.getParameter("content");
	    String bType = request.getParameter("bType"); // bType 추가
	
	    // Board 객체 생성 및 값 설정
	    Board board = new Board();
	    board.setTitle(title);
	    board.setContent(content);
	    board.setBType(bType); // bType 설정
	
	    // 게시글 등록 시도
	    int result = boardService.insert(board,user);
	    if (result > 0) {
	        response.sendRedirect("board_list.jsp"); // 성공 시 목록 페이지로 리다이렉트
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
    <title>게시글 등록 결과</title>
    <link rel="stylesheet" href="static/css/style.css">
</head>
<body>
    <h1>게시글 등록 결과</h1>
    <div>
        <%= message %> <!-- 결과 메시지 표시 -->
    </div>
    <a href="board_list.jsp">게시글 목록으로 돌아가기</a>
</body>
</html>
