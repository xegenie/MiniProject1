<%@page import="java.util.UUID"%>
<%@page import="tje.Service.UserServiceImpl"%>
<%@page import="tje.Service.UserService"%>
<%@page import="tje.DTO.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	// User 객체 생성
	User user = User.builder()
						.id(UUID.randomUUID().toString())
						.password(password)
						.name(name)
						.email(email)
						.telNumber(telNumber)
						.enabled(true)
						.build();
	
	// 회원 가입 요청
	UserService userService = new UserServiceImpl();
	int result = userService.signup(User);
	
	// 회원가입 성공
	if( result > 0 ) {
		response.sendRedirect("index.jsp");				// 메인화면으로 이동
	}
	// 회원가입 실패
	else {
		response.sendRedirect("signup.jsp?error=0");	// 다시 회원가입페이지로 (에러포함)
	}
%>