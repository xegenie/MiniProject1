<%@page import="tje.Service.BoardServiceImpl"%>
<%@page import="tje.Service.BoardService"%>
<%@page import="tje.DTO.Comments"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    // 게시글 ID와 댓글 내용 파라미터를 받아옴
    int boardId = Integer.parseInt(request.getParameter("board_id"));
    String content = request.getParameter("content");

    // 댓글 객체 생성 및 데이터 설정
    Comments comment = new Comments();
    comment.setBoardId(boardId);
    comment.setContent(content);
    comment.setWriter("작성자"); // 작성자는 로그인 사용자 이름으로 설정하는 것이 일반적입니다.

    // 댓글 저장
    BoardService boardService = new BoardServiceImpl();
    int result = boardService.insert(comment);
    
    if (result > 0) {
        System.out.println("댓글 등록 성공!");
    } else {
        System.out.println("댓글 등록 실패!");
    }

    // 저장 후 해당 게시글 페이지로 리다이렉트
    response.sendRedirect("board_read.jsp?board_id=" + boardId);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>