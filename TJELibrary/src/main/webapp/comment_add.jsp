<%@page import="tje.DTO.Board"%>
<%@page import="java.util.Date"%>
<%@page import="tje.DTO.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="tje.DTO.Comments" %>
<%@ page import="tje.Service.BoardServiceImpl" %>
<%@ page import="tje.Service.BoardService" %>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>

<%
	int boardId = Integer.parseInt(request.getParameter("board_id"));
	String content = request.getParameter("content");
	User user = (User) session.getAttribute("user");
    String writer = user != null ? user.getName() : "";
	
	Comments comment = new Comments();
	comment.setBoardId(boardId);
	comment.setContent(content);
	comment.setWriter(writer);
	comment.setRegDate(new Date()); // 현재 날짜
	
	BoardService commentService = new BoardServiceImpl();
	commentService.insert(comment); // 댓글 추가
	
	// 게시글 정보를 조회하여 bType을 확인
	Board board = commentService.select(boardId); // 게시글 정보 조회
	String bType = board.getBType(); // bType 가져오기
	
	// bType에 따라 리다이렉트
	if ("공지사항".equals(bType)) {
	    response.sendRedirect("notice_read.jsp?board_id=" + boardId);
	} else {
	    response.sendRedirect("board_read.jsp?board_id=" + boardId);
	}
%>
