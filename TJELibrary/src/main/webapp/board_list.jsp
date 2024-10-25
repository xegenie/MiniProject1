<%@page import="tje.DTO.User"%>
<%@page import="tje.Service.UserServiceImpl"%>
<%@page import="tje.Service.UserService"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
		// chapter 
		String chapterTitle = "게시판";
		String chapter1 = "HOME";
		String chapter2 = "게시판";
		String chapter3 = "게시글 목록";
	%>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 목록</title>
	<link rel="stylesheet" href="static/css/board_list.css">
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
    		<div class="board-box">
	    		<h1 class ="board-title">게시판</h1>
	    		<a href="board_insert.jsp" class="btn">글쓰기</a>
    		</div>
    		<div class="search-filter">
                <!-- 검색ui -->
                <div class="item">
                    <form action="/board" method="get">
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
    		<table class="board-list">
    			<thead>
    				<tr>
    					<th>No</th>
    					<th>제목</th>
    					<th>작성자</th>
    					<th>작성날짜</th>
    					<th>좋아요</th>
    					<th>조회수</th>
    				</tr>
    			</thead>
    			<tbody>
                <!-- (tr>(td{$}+td{게시글 제목 $}+td{작성자$}+td{2024-09-%%}))*10 -->
                <tr>
                    <td>1</td>
                    <td>게시글 제목 1</td>
                    <td>작성자1</td>
                    <td>2024-10-%%</td>
                    <td>좋아요</td>
                    <td>조회수</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>게시글 제목 2</td>
                    <td>작성자2</td>
                    <td>2024-10-%%</td>
                    <td>좋아요</td>
                    <td>조회수</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>게시글 제목 3</td>
                    <td>작성자3</td>
                    <td>2024-10-%%</td>
                    <td>좋아요</td>
                    <td>조회수</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>게시글 제목 4</td>
                    <td>작성자4</td>
                    <td>2024-10-%%</td>
                    <td>좋아요</td>
                    <td>조회수</td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>게시글 제목 5</td>
                    <td>작성자5</td>
                    <td>2024-10-%%</td>
                    <td>좋아요</td>
                    <td>조회수</td>
                </tr>
                <tr>
                    <td>6</td>
                    <td>게시글 제목 6</td>
                    <td>작성자6</td>
                    <td>2024-10-%%</td>
                    <td>좋아요</td>
                    <td>조회수</td>
                </tr>
                <tr>
                    <td>7</td>
                    <td>게시글 제목 7</td>
                    <td>작성자7</td>
                    <td>2024-10-%%</td>
                    <td>좋아요</td>
                    <td>조회수</td>
                </tr>
                <tr>
                    <td>8</td>
                    <td>게시글 제목 8</td>
                    <td>작성자8</td>
                    <td>2024-10-%%</td>
                    <td>좋아요</td>
                    <td>조회수</td>
                </tr>
                <tr>
                    <td>9</td>
                    <td>게시글 제목 9</td>
                    <td>작성자9</td>
                    <td>2024-10-%%</td>
                    <td>좋아요</td>
                    <td>조회수</td>
                </tr><tr>
                    <td>10</td>
                    <td>게시글 제목 10</td>
                    <td>작성자10</td>
                    <td>2024-10-%%</td>
                    <td>좋아요</td>
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