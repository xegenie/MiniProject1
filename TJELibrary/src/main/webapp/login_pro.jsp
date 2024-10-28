<%@page import="tje.DTO.User"%>
<%@page import="tje.Service.UserServiceImpl"%>
<%@page import="tje.Service.UserService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String id = request.getParameter("id");
    String password = request.getParameter("password");

    UserService userService = new UserServiceImpl();
    User user = userService.select(id); // ID로 사용자 조회

    // 비밀번호 확인
    if (user != null && user.getPassword().equals(password)) {
        session.setAttribute("user", user); // 세션에 사용자 정보 저장
        response.sendRedirect("index.jsp"); // 로그인 성공 후 홈으로 리다이렉트
    } else {
        out.println("<script>alert('로그인 실패. 아이디와 비밀번호를 확인하세요.'); history.back();</script>");
    }
%>