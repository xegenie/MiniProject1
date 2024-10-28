<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <jsp:include page="/layout/meta.jsp" />
    <jsp:include page="/layout/link.jsp" />
    <link rel="stylesheet" href="<%= root %>/static/css/signup.css">
</head>
<body>
    <div class="login-container">
        <div class="form-wrapper">
            <h1 class="heading">회원가입</h1>
            <form action="signup_pro.jsp" method="post" class="sign-in-form">
                <div class="input-container">
                    <label for="id">아이디</label>
                    <input type="text" name="id" id="id" required>
                </div>
                <div class="input-container">
                    <label for="email">이메일</label>
                    <input type="text" name="email" id="email" required>
                </div>
                <div class="input-container">
                    <label for="password">비밀번호</label>
                    <input type="password" name="password" id="password" required>
                </div>
                <div class="input-container">
                    <label for="name">이름</label>
                    <input type="text" name="name" id="name" required>
                </div>
                <div class="input-container">
                    <label for="tel_Number">휴대전화</label>
                    <input type="tel" name="tel_Number" id="tel_Number" required>
                </div>
                <div>
                    <input type="submit" value="회원가입" class="login-button">
                </div>
                 <div>
                    <a href="login.jsp" class="login-button" style="display: inline-block; margin-top: 10px;">뒤로가기</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
