<%@page import="tje.DTO.User"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<%
    // 세션에서 사용자 정보를 확인
    User user = (User) session.getAttribute("user");
    if (user != null) {
        response.sendRedirect("index.jsp"); // 로그인된 상태에서 홈으로 리다이렉트
        return;
    }
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" href="static/css/login.css">
</head>
<body>
    <div class="login-container">
        <div class="form-wrapper">
            <h1 class="heading">로그인</h1>
            <form action="login_pro.jsp" method="post" class="sign-in-form">
                <div class="input-container">
                    <label for="id">아이디</label>
                    <input type="text" name="id" id="id" required>
                </div>
                <div class="input-container">
                    <label for="password">비밀번호</label>
                    <input type="password" name="password" id="password" required>
                </div>
                <div>
                    <input type="submit" class="login-button" value="로그인">
                </div>
            </form>
            <p class="div">아직 회원이 아니신가요? <a href="signup.jsp">회원가입</a></p>
        </div>
    </div>
</body>
</html>