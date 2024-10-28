<%@ page import="tje.Service.BoardService" %>
<%@ page import="tje.Service.BoardServiceImpl" %>
<%@ page import="tje.DTO.Board" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // 파라미터에서 필요한 데이터 가져오기
    String action = request.getParameter("action"); // 'delete', 'update', 또는 'post'
    String boardIdParam = request.getParameter("board_id"); // 게시글 ID
    String title = request.getParameter("title"); // 제목
    String content = request.getParameter("content"); // 내용

    BoardService boardService = new BoardServiceImpl();
    boolean isSuccess = false; // 작업 성공 여부

    // 삭제 요청 처리
    if ("delete".equals(action)) {
        int board_id = Integer.parseInt(boardIdParam); // boardId를 int로 변환
        isSuccess = boardService.delete(board_id) > 0; // 삭제 성공 여부 확인
    } 
    // 수정 요청 처리
    else if ("update".equals(action)) {
        int board_id = Integer.parseInt(boardIdParam); // boardId를 int로 변환
        Board board = new Board();
        board.setBoardNo(board_id); // Board 객체에 ID 설정
        board.setTitle(title); // Board 객체에 제목 설정
        board.setContent(content); // Board 객체에 내용 설정
        System.out.println("Updating board with ID: " + board.getBoardNo());
        isSuccess = boardService.update(board) > 0; // 수정 성공 여부 확인
    }
    // 게시글 등록 처리
    else if ("post".equalsIgnoreCase(action)) {
        Board board = new Board();
        board.setTitle(title); // Board 객체에 제목 설정
        board.setContent(content); // Board 객체에 내용 설정
        
        // 게시글 등록 시도
        int result = boardService.insert(board);
        isSuccess = result > 0; // 성공 여부 확인
    }

    // 결과에 따른 알림 및 페이지 이동 처리
    if (isSuccess) {
        out.println("<script>alert('작업이 완료되었습니다.'); location.href='adminnoticelist.jsp';</script>");
    } else {
        out.println("<script>alert('다시 시도하세요.'); history.back();</script>");
    }
%>
