<%@page import="tje.DTO.UserAuth"%>
<%@page import="tje.DAO.UserAuthDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="tje.DTO.User"%>
<%@page import="tje.Service.BookServiceImpl"%>
<%@page import="tje.Service.BookService"%>
<%@page import="tje.DTO.RentalList"%>
<%@page import="java.util.List"%>
<%@page import="tje.Service.RentalSerivceImpl"%>
<%@page import="tje.Service.RentalService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
RentalService rentalServiceAd = new RentalSerivceImpl();
List<RentalList> rlist = rentalServiceAd.selectByState("대출"); 
BookService bookServiceAd = new BookServiceImpl();

User userAdmin = (User) session.getAttribute("user");
if (userAdmin == null) {
    out.print("로그인하셈요");
    return;
}

UserAuthDAO AduserAuthDAO = new UserAuthDAO();
UserAuth adUserAuth = AduserAuthDAO.select(userAdmin.getId());
if ("ROLE_USER".equals(adUserAuth.getAuth())) {
    out.print("일반 사용자는 못들어옴요");
    return;
}
%>