<%@page import="tje.DTO.User"%>
<%@page import="tje.DTO.BookStock"%>
<%@page import="tje.DAO.BookStockDAO"%>
<%@page import="tje.DTO.RentalList"%>
<%@page import="tje.DAO.RentalListDAO"%>
<%@page import="tje.Service.RentalSerivceImpl"%>
<%@page import="tje.Service.RentalService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    RentalService rentalService = new RentalSerivceImpl();
    int rentalNo = Integer.parseInt(request.getParameter("rentalNo"));
    
   	RentalListDAO rentalListDAO = new RentalListDAO();
   	RentalList rental = rentalListDAO.select(rentalNo);

	BookStockDAO bookStockDAO = new BookStockDAO();
	BookStock bookStock = bookStockDAO.select(rental.getStockId());
	bookStock.setStatus("대출 가능");
	
	User user =new User();
	user.setId(rental.getId());
	
	try {
		int result = rentalService.returned(bookStock, user);
		response.setStatus(200);		
	} catch (Exception e) {
		response.setStatus(500);		
		out.print("오류: " + e.getMessage());
	}
%>