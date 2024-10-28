<%@page import="tje.DTO.User"%>
<%@page import="tje.Service.UserServiceImpl"%>
<%@page import="tje.Service.UserService"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
// chapter 
String chapterTitle = "고급검색";
String chapter1 = "HOME";
String chapter2 = "자료검색";
String chapter3 = "고급검색";
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="static/css/search.css">
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
</head>
<body>
	<jsp:include page="/layout/header.jsp" />
	<%-- [Contents] ######################################################### --%>
	<div class="pb-4 pt-5">
		<%@ include file="/layout/chapter.jsp"%>
	</div>
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