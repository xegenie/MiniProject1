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
  <h1>회원가입</h1>
    <form action="signup_pro.jsp" method="post">
        <div>
            <label for="id">아이디</label>
            <input type="text" name="id" id="id" required>
        </div>
        <div>
            <label for="email">이메일</label>
            <input type="text" name="email" id="email" required>
        </div>
        <div>
            <label for="passowrd">비밀번호</label>
            <input type="passowrd" name="passowrd" id="passowrd" required>
        </div>
        <div>
            <label for="passowrd">비밀번호 확인</label>
            <input type="passowrd" name="passowrd" id="passowrd" required>
        </div>
        <div>
            <label for="name">이름</label>
            <input type="text" name="name" id="name" required>
        </div>
        <div>
            <label for="telNumber">휴대전화</label>
            <input type="tel" name="telNumber" id="telNumber" required>
        </div>
        <div>
            <input type="submit" value="회원가입">
        </div>
    </form>
</body>
</html>