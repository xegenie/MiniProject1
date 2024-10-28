<%@page import="tje.DAO.BookStockDAO"%>
<%@page import="tje.Service.BookStockServiceImpl"%>
<%@page import="tje.Service.BookStockService"%>
<%@page import="tje.DTO.User"%>
<%@page import="tje.DTO.BookStock"%>
<%@page import="tje.Service.RentalSerivceImpl"%>
<%@page import="tje.Service.RentalService"%>
<%@page import="tje.DTO.RentalList"%>
<%@page import="tje.Service.FilesServiceImpl"%>
<%@page import="tje.Service.FilesService"%>
<%@page import="tje.Service.BookServiceImpl"%>
<%@page import="tje.Service.BookService"%>
<%@page import="tje.DTO.Book"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@page import="tje.DTO.Files"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ include file="/layout/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
		String userId = "joeun";
		// User user = (User)session.getAttribute("loginUser"); 
		// userId = user.getId();
		
		String reqBookId = request.getParameter("bookId");
		int bookId = Integer.parseInt( reqBookId == null ? "0" : reqBookId );
		int stockId = Integer.parseInt( request.getParameter("stockId") );
		out.println("bookId : " + bookId);
		out.println("stockId : " + stockId);

		// bookStock으로 넘기기
		int result = 0;
		
		RentalService rentalService = new RentalSerivceImpl();
		BookStockService bookStockService = new BookStockServiceImpl();
		BookStock bookStock = bookStockService.select(stockId);
		
		User user = new User();
		user.setId(userId);
		
		result = rentalService.Reservation(bookStock, user);
		//-------
		
		String bookIdStr = String.valueOf(bookId);
		
	    if ( result > 0 ) {
	    	out.println("예약 완료!");
	        response.sendRedirect(request.getContextPath() + "/book_detail.jsp?bookId=" + bookIdStr);
// 	        return;
	    } else {
	    	response.sendRedirect(request.getContextPath() + "/book_detail.jsp?bookId=" + bookIdStr +"&error");
// 	    	return;
	    }
%>








