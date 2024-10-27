<%@page import="tje.DTO.User"%>
<%@page import="tje.Service.UserServiceImpl"%>
<%@page import="tje.Service.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String requestURI = request.getRequestURI();
%>
<!DOCTYPE html>
<html>
<head>
	<title>project💻 - ALOHA CLASS🌴</title>
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<div class="d-flex flex-column flex-shrink-0 p-3 bg-body-tertiary shadow sidebar">
    <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
      <svg class="bi pe-none me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
      <span class="fs-4 text-primary fw-semibold">관리자 페이지</span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item">
        <a href="<%=request.getContextPath() %>/admin/user/admin_user.jsp" class="nav-link  link-body-emphasis managelist <% if(requestURI.contains("/admin/user")) out.print("active"); %>" aria-current="page">
          <svg class="bi pe-none me-2" width="16" height="50"><use xlink:href="#home"></use></svg>
          회원 관리
        </a>
      </li>
      <li>
        <a href="<%=request.getContextPath() %>/admin/board/adminboardlist.jsp" class="nav-link link-body-emphasis  managelist <% if(requestURI.contains("/admin/board")) out.print("active"); %>">
          <svg class="bi pe-none me-2 rounded-3" width="16" height="50"><use xlink:href="#speedometer2"></use></svg>
          게시글 관리
        </a>
      </li>
      <li>
        <a href="<%=request.getContextPath() %>/admin/comment/admincomments.jsp" class="nav-link link-body-emphasis  managelist <% if(requestURI.contains("/admin/comment")) out.print("active"); %>">
          <svg class="bi pe-none me-2 rounded-3" width="16" height="50"><use xlink:href="#speedometer2"></use></svg>
          댓글 관리
        </a>
      </li>
      <li>
        <a href="<%=request.getContextPath() %>/admin/book/book_insert.jsp" class="nav-link link-body-emphasis  managelist <% if(requestURI.contains("/admin/book")) out.print("active"); %>">
          <svg class="bi pe-none me-2 rounded-3" width="16" height="50"><use xlink:href="#speedometer2"></use></svg>
          도서 관리
        </a>
      </li>
      <li>
        <a href="<%=request.getContextPath() %>/admin/rental/rentallist.jsp" class="nav-link link-body-emphasis  managelist <% if(requestURI.contains("/admin/rental")) out.print("active"); %>">
          <svg class="bi pe-none me-2 rounded-3" width="16" height="50"><use xlink:href="#speedometer2"></use></svg>
          대출 관리
        </a>
      </li>
      <li>
        <a href="<%=request.getContextPath() %>/admin/hopebook/adminhopebook.jsp" class="nav-link link-body-emphasis  managelist <% if(requestURI.contains("/admin/hopebook")) out.print("active"); %>">
          <svg class="bi pe-none me-2 rounded-3" width="16" height="50"><use xlink:href="#speedometer2"></use></svg>
          희망도서 관리
        </a>
      </li>
      <li>
        <a href="<%=request.getContextPath() %>/admin/reservation/adminreserve.jsp" class="nav-link link-body-emphasis  managelist <% if(requestURI.contains("/admin/reservation")) out.print("active"); %>">
          <svg class="bi pe-none me-2 rounded-3" width="16" height="50"><use xlink:href="#speedometer2"></use></svg>
          예약 관리
        </a>
      </li>
      <li>
        <a href="<%=request.getContextPath() %>/admin/notice/adminnoticelist.jsp" class="nav-link link-body-emphasis  managelist <% if(requestURI.contains("/admin/notice")) out.print("active"); %>">
          <svg class="bi pe-none me-2 rounded-3" width="16" height="50"><use xlink:href="#speedometer2"></use></svg>
          공지사항
        </a>
      </li>
      
      
    </ul>
	<jsp:include page="/layout/script.jsp" />
	<style>
	  .managelist:hover {
	  	font-weight: bold;
	    background-color: var(--bs-primary-bg-subtle) !important;
	  }
	</style>
</body>
</html>