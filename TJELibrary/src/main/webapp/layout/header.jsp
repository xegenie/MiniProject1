<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/common.jsp" %>
<header>
	<img src="<%= root %>/static/img/logo.png" width="48" >
	
	<nav>
		<ul>
			<li><a href="<%= root %>/login.jsp">로그인</a></li>
			<li><a href="<%= root %>/signup.jsp">회원가입</a></li>
		</ul>
	</nav>
</header>