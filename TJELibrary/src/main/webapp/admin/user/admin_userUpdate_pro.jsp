<%@page import="tje.DAO.UserDAO"%>
<%@page import="tje.DTO.User"%>
<%@page import="tje.Service.UserServiceImpl"%>
<%@page import="tje.Service.UserService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	UserService userService = new UserServiceImpl();
	UserDAO userDAO = new UserDAO();

	User user = new User();
	user.setId(request.getParameter("userId"));
	user.setPassword(request.getParameter("userPw"));
	user.setName(request.getParameter("userName"));
	user.setEmail(request.getParameter("userEmail"));
	user.setTelNumber(request.getParameter("userPhone"));
	
	int result = userDAO.update(user, "password","name","email","tel_number");
	if (result!=0) {
%>
		<script type="text/javascript">
		alert('수정 완료!');		
		</script>
<%
		response.sendRedirect("admin_user.jsp");
    } else {
%>
		<script type="text/javascript">
            alert("수정에 실패했습니다. 다시 시도해 주세요.");
            history.back(); // 이전 페이지로 돌아가기
        </script>
<%
    }
%>