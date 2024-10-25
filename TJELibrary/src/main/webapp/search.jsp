<%@page import="tje.DTO.User"%>
<%@page import="tje.Service.UserServiceImpl"%>
<%@page import="tje.Service.UserService"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
// chapter 
String chapterTitle = "통합검색";
String chapter1 = "HOME";
String chapter2 = "자료검색";
String chapter3 = "통합검색";
%>
<!DOCTYPE html>
<html>
<head>
	<title>project💻 - ALOHA CLASS🌴</title>
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
</head>
<body>
	<jsp:include page="/layout/header.jsp" />
	<%-- [Contents] ######################################################### --%>
	<div class="pb-4 pt-5">
		<%@ include file="/layout/chapter.jsp"%>
	</div>
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
		  max-width: 920px;
		  width: 920px;
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
		  align-items: flex-end;
		}
		
		.input-container label {
		  display: block;
		  margin-bottom: 8px;
		  color: black;
		  font-size: 20px;
		}
		
		.input-container input {
		  width: 91%;
		  padding: 10px;
		  border: 1px solid #ccc;
		  border-radius: 10px;
		  font-size: 14px;
		  align-items: flex-end;
		}
		
		.login-button {
		  width: 100px;
		  padding: 10px;
		  background-color: #d6cfc9;
		  color: gray;
		  border: none;
		  border-radius: 6px;
		  font-size: 16px;
		  cursor: pointer;
		  transition: background-color 0.3s ease;
		}
		.search-button {
		  width: 100px;
		  padding: 10px;
		  background-color: gray;
		  color: gray;
		  border: none;
		  border-radius: 6px;
		  font-size: 16px;
		  cursor: pointer;
		  transition: background-color 0.3s ease;
		}
		
		.login-button:hover {
		  background-color: #b5ada5;
		}
		
		.search-button:hover {
		  background-color: #3d3b39;
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
      <form class="sign-in-form">
        <div class="input-container">
        <div class="d-flex justify-content-end column-gap-2 mb-3">
          <label for="title">제목</label>
          <input type="text" id="title" placeholder="책제목">
        </div>
        </div>
        <div class="input-container">
        <div class="d-flex justify-content-end column-gap-2 mb-3">
          <label for="password">저자</label>
          <input type="password" id="password" placeholder="김조은">
        </div>
        </div>
        <div class="input-container">
        <div class="d-flex justify-content-end column-gap-2 mb-3">
          <label for="password">발행처</label>
          <input type="password" id="password" placeholder="가나출판사">
        </div>
        </div>
        <div class="input-container">
        <div class="d-flex justify-content-end column-gap-2 mb-3">
          <label for="isbn">isbn</label>
          <input type="isbn" id="isbn" placeholder="987654321234">
        </div>
        </div>
        <div class="input-container">
        <div class="d-flex justify-content-end column-gap-2 mb-3">
          <label for="password">분류번호</label>
          <input type="password" id="password" placeholder="813.12">
          </div>
        </div><hr><br><br><br><br><br>
		<div class="d-flex justify-content-center column-gap-2 mb-3">
		<div class="item">
        <button type="submit" class="login-button text-black">입력초기화</button>
         </div>
         <div class="item">
         <button type="submit" class="search-button text-light">검색</button>
         </div>
		</div>
         <hr>
      </form>
    </div>
  </div>
	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>