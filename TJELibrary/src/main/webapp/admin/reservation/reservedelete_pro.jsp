<%@page import="tje.DAO.RentalListDAO"%>
<%@page import="tje.DAO.BookDAO"%>
<%@page import="tje.DAO.BookStockDAO"%>
<%@page import="tje.DTO.BookStock"%>
<%@page import="tje.Service.BookServiceImpl"%>
<%@page import="tje.Service.BookService"%>
<%@page import="tje.DTO.Book"%>
<%@ include file="/layout/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
    // ID 파라미터 받기
    String idValue = request.getParameter("no");
   	int no = Integer.parseInt(idValue);
	String stockValue = request.getParameter("stockId");
	int stockId = Integer.parseInt(stockValue);

            // 예약 삭제 처리
            RentalListDAO rentalListDAO = new RentalListDAO();
            int result = rentalListDAO.delete(no);
			
            // 재고상태 "대출 가능"으로 변경
            BookStockDAO bookStockDAO = new BookStockDAO();
            BookStock bookStock = bookStockDAO.select(stockId);
            bookStock.setStatus("대출 가능");
            int result2 = bookStockDAO.update(bookStock);
            
        	if( result > 0 && result2 > 0) {
        		response.sendRedirect(root + "/admin/reservation/adminreserve.jsp");
        	}
        	else {
        		response.sendRedirect(root + "/admin/reservation/adminreserve.jsp?error");
        	}
%>
