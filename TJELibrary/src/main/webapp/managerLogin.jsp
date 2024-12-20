<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 로그인</title>
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
	<style>
		/* Reset basic styling */
		* {
		  margin: 0;
		  padding: 0;
		  box-sizing: border-box;
		}
		
		body, html {
		  height: 100%;
		  font-family: 'Noto Sans KR', sans-serif;
/* 		  background-color: #f0f0f0; */
		}
		
		.login-container {
 		  	background-color: white;
 		  	display: flex;
 		  	justify-content: center;
 		  	align-items: center; 
 		  	height: 100vh; 
		}
		.form-wrapper {
		  max-width: 520px;
		  width: 520px;
		} 
		
		.heading {
		  font-size: 24px;
		  text-align: center;
		  margin-bottom: 30px;
		  color: #333;
		}
		
		.sign-in-form {
		  display: flex;
		  flex-direction: column;
		}
		
		.input-container {
		  margin-bottom: 20px;
		}
		
		.input-container label {
		  display: block;
		  margin-bottom: 8px;
		  color: black;
		  font-size: 20px;
		}
		
		.input-container input {
		  width: 100%;
		  padding: 10px;
		  border: 1px solid #ccc;
		  border-radius: 10px;
		  font-size: 14px;
		}
		
		.checkbox-container {
		  display: flex;
		  align-items: center;
		  justify-content: space-between;
		}
		
		.login-button {
		  width: 100%;
		  padding: 10px;
		  background-color: #947d69;
		  color: #fff;
		  border: none;
		  border-radius: 6px;
		  font-size: 16px;
		  cursor: pointer;
		  transition: background-color 0.3s ease;
		}
		
		.login-button:hover {
		  background-color: #836957;
		}
		
		@media (max-width: 768px) {
		  .form-wrapper {
		    padding: 20px;
		  }
		
		  .login-button {
		    font-size: 14px;
		  }
		}
		.div {
		  color: #ff4438;
		  text-align: center;
		  font-family: "NotoSansKr-Bold", sans-serif;
		  font-size: 13.5625px;
		  line-height: 20px;
		  letter-spacing: 0.01px;
		  font-weight: 700;
		  position: relative;
		  width: 258.38px;
		  height: 50px;
		  display: flex;
		  align-items: center;
		  justify-content: center;
		}
	</style>
</head>
<body>
  <div class="login-container">
    <div class="form-wrapper">
      <h1 class="heading">Manager<br>Sign in</h1>
      <form class="sign-in-form" action="managerLogin_pro.jsp" method="post">
        <div class="input-container">
          <label for="username">아이디</label>
          <input type="text" name="id" placeholder="kimjoeun">
        </div>
        <div class="input-container">
          <label for="password">비밀번호</label>
          <input type="password" name="password" placeholder="••••••••••">
        </div>
        <button type="submit" class="login-button mb-3">로그인</button>
        <a href="signup.jsp" class="text-center my-3 text-danger">회원가입하러 가기</a>
      </form>
    </div>
  </div>
</body>
</html>