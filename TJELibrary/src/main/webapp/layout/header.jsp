<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/common.jsp" %>
<link rel="stylesheet" href="<%= root %>/static/css/header.css">
<header>
	<div class="header">
		<div class="container">
			<div class="d-flex justify-content-end">
				<div class="inner d-flex column-gap-3">
						<div class="link">
						<a href="">로그인</a>
					</div>
					<div class="link">
						<a href="">내서재</a>
					</div>
					<div class="link">
						<a href="">회원가입</a>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="d-flex justify-content-start align-items-center column-gap-5">
				<div class="item">
					<img class="logo" src="<%= root %>/static/img/logo.png" />
				</div>
				<div class="item ">
					<div class="input background-border">
							<input class="input-search" placeholder="도서검색" />
					</div>
					<div class="search">
						<i class="fa fa-search fa-lg" style="color: #fffafa;"></i>
					</div>
				</div>
				<div class="item">
					<a href="/" class="btn-custom">고급검색</a>
				</div>

			</div>
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</header>