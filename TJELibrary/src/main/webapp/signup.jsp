<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" href="static/css/signup.css">
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
</head>
<body>
  <div class="login-container">
    <div class="form-wrapper">
      <h1 class="heading">Sign up</h1>
      <form class="sign-in-form">
        <div class="input-container">
          <label for="username">아이디</label>
          <input type="text" id="username" placeholder="kimjoeun">
        </div>
        <div class="input-container">
          <label for="email">이메일</label>
          <input type="text" id="email" placeholder="kimjoeun">
        </div>
        <div class="input-container">
          <label for="password">비밀번호</label>
          <input type="password" id="password" placeholder="••••••••••">
        </div>
        <div class="input-container">
          <label for="password2">비밀번호 확인</label>
          <input type="password2" id="password2" placeholder="••••••••••">
        </div>
        <div class="input-container">
          <label for="name">이름</label>
          <input type="text" id="name" placeholder="이름">
        </div>
        <div class="input-container">
          <label for="phoneNo">휴대전화</label>
          <input type="phoneNo" id="phoneNo" placeholder="••••••••••">
        </div>
		<div class="d-flex justify-content-start align-items-center column-gap-3 mb-3">
		</div>
        <button type="submit" class="login-button">가입하기</button><br>
         <button type="submit" class="login-button">뒤로가기</button>
      </form>
    </div>
  </div>
</body>
</html>