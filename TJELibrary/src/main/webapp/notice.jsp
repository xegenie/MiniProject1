<%@page import="tje.DTO.User"%>
<%@page import="tje.Service.UserServiceImpl"%>
<%@page import="tje.Service.UserService"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	
		// chapter 
		String chapterTitle = "공지사항";
		String chapter1 = "HOME";
		String chapter2 = "공지사항";
		String chapter3 = "공지사항 목록";
	%>
<html>
<head>
	<meta charset="UTF-8">
	<title>공지사항 목록</title>
	<link rel="stylesheet" href="static/css/notice.css">
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
</head>
<body>
	<jsp:include page="/layout/header.jsp" />
	<div style="margin-top: 50px;">
		<%@ include file="/layout/chapter.jsp" %>
	</div>
    <div class ="container">
    	<section>
    		<div class="notice-box">
	    		<h1 class ="notice-title">공지사항</h1>
    		</div>
    		<div class="search-filter">
                <!-- 검색ui -->
                <div class="item">
                    <form action="/notice" method="get">
                    <select name="category" id="category" class="filter-select">
                        <option value="0">전체</option>
                        <option value="0">제목+내용</option>
                        <option value="0">제목</option>
                        <option value="0">작성자</option>
                        <option value="0">내용</option>
                    </select>
                    <input type="text" placeholder="검색어를 입력하세요" name="keyward" class="search-input">
                    <input type="submit" class="search-button" value="검색">
                </form>
            </div>
         
        </div>
    		<table class="notice-list">
    			<thread>
    				<tr>
    					<th>No</th>
    					<th>제목</th>
    					<th>작성자</th>
    					<th>작성날짜</th>
    					<th>조회수</th>
    				</tr>
    			</thread>
    			<tbody>
                <!-- (tr>(td{$}+td{게시글 제목 $}+td{작성자$}+td{2024-09-%%}))*10 -->
                <tr>
                    <td>1</td>
                    <td>공지사항 1</td>
                    <td>작성자1</td>
                    <td>2024-10-%%</td>
                    <td>조회수</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>공지사항 2</td>
                    <td>작성자2</td>
                    <td>2024-10-%%</td>
                    <td>조회수</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>공지사항 3</td>
                    <td>작성자3</td>
                    <td>2024-10-%%</td>
                    <td>조회수</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>공지사항 4</td>
                    <td>작성자4</td>
                    <td>2024-10-%%</td>
                    <td>조회수</td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>공지사항 5</td>
                    <td>작성자5</td>
                    <td>2024-10-%%</td>
                    <td>조회수</td>
                </tr>
                <tr>
                    <td>6</td>
                    <td>공지사항 6</td>
                    <td>작성자6</td>
                    <td>2024-10-%%</td>
                    <td>조회수</td>
                </tr>
                <tr>
                    <td>7</td>
                    <td>공지사항 7</td>
                    <td>작성자7</td>
                    <td>2024-10-%%</td>
                    <td>조회수</td>
                </tr>
                <tr>
                    <td>8</td>
                    <td>공지사항 8</td>
                    <td>작성자8</td>
                    <td>2024-10-%%</td>
                    <td>조회수</td>
                </tr>
                <tr>
                    <td>9</td>
                    <td>공지사항 9</td>
                    <td>작성자9</td>
                    <td>2024-10-%%</td>
                    <td>조회수</td>
                </tr>
                    <td>10</td>
                    <td>공지사항 10</td>
                    <td>작성자10</td>
                    <td>2024-10-%%</td>
                    <td>조회수</td>
                </tr>
            	</tbody>
    		</table>
    			<div class="pagenation">
             <!-- ≪ ＜ ＞ ≫ -->
             <a href="" class="page-link">≪</a>
             <a href="" class="page-link">＜</a>
             <a href="" class="page-link selected">1</a>
             <a href="" class="page-link">2</a>
             <a href="" class="page-link">3</a>
             <a href="" class="page-link">4</a>
             <a href="" class="page-link">5</a>
             <a href="" class="page-link">＞</a>
             <a href="" class="page-link">≫</a>
            </div>
    	</section>
    
    </div>
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>