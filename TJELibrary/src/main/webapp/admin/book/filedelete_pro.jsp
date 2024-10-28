<%@page import="tje.DAO.BookDAO"%>
<%@page import="tje.DAO.BookStockDAO"%>
<%@page import="tje.Service.BookStockServiceImpl"%>
<%@page import="tje.Service.BookStockService"%>
<%@page import="tje.DTO.BookStock"%>
<%@page import="tje.Service.BookServiceImpl"%>
<%@page import="tje.Service.BookService"%>
<%@page import="tje.DTO.Book"%>
<%@ include file="/layout/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
    // ID 파라미터 받기
    String idValue = request.getParameter("id");
            int id = Integer.parseInt(idValue);

            // 책 삭제 처리
            BookDAO bookDAO = new BookDAO();
            int result = bookDAO.delete(id);

            BookStockDAO bookStockDAO = new BookStockDAO();
            int result2 = bookStockDAO.delete(id);
            
        	if( result > 0 && result2 > 0) {
        		response.sendRedirect(root + "/admin/book/book_insert.jsp");
        	}
        	else {
        		response.sendRedirect(root + "/admin/book/book_insert.jsp?error");
        	}
%>
