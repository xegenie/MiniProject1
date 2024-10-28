<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 	String url = "/admin/user";
%>
<!DOCTYPE html>
<html>
<head>
	<title>관리자 게시판 목록</title>
	<link rel="stylesheet" href="static/css/adminboardlist.css">
</head>
<body>
    <%@ include file="/layout/admin/sidebar.jsp" %>
    
<div style="margin-left:25%;padding:1px 16px;">
  <section>
    <div class="container">
        <div class="title-box">
            <h1 class="main-title">게시글 등록</h1>
        </div>
        <div class="input-group">
            <label for="title">제목</label>
            <input type="text" name="title" placeholder="제목을 입력하세요" id="title">
        </div>
        <div class="input-group">
            <textarea name="content" id="content" cols="30" rows="10"></textarea>
        </div>
        <div class="board-box">
	    		<a href="" class="btn">등록</a>
    		</div>
  <input type="text" placeholder="검색어를 입력하세요" name="keyward" class="search-input">
  <input type="submit" class="search-button" value="검색">
</div>
<table class="board-list">
    <thread>
        <tr>
            <th>No</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성날짜</th>
            <th>좋아요</th>
            <th>조회수</th>
            <th>관리</th>
        </tr>
    </thread>
    <tbody>
    <c:forEach items="${Boardlist}" var="board">
				        <tr>
				            <td>${board.boardNo}</td>
				            <td><a href="notice_read.jsp?board_id=${board.boardNo}">${board.title}</a></td>
				            <td>${board.writer}</td>
				            <td>${board.regDate}</td>
				            <td>${board.updDate}</td>
				        </tr>
				    </c:forEach>
    <!-- (tr>(td{$}+td{게시글 제목 $}+td{작성자$}+td{2024-09-%%}))*10 -->
    <tr>
        <td>1</td>
        <td>게시글 제목 1</td>
        <td>작성자1</td>
        <td>2024-10-%%</td>
        <td>좋아요</td>
        <td>조회수</td>
        <td>
            <button type="button" onclick="editPost()">수정</button>
            <button type="button" onclick="deletePost()">삭제</button>
        </td>
    </tr>
    <tr>
        <td>2</td>
        <td>게시글 제목 2</td>
        <td>작성자2</td>
        <td>2024-10-%%</td>
        <td>좋아요</td>
        <td>조회수</td>
        <td>
            <button type="button" onclick="editPost()">수정</button>
            <button type="button" onclick="deletePost()">삭제</button>
        </td>
    </tr>
    <tr>
        <td>3</td>
        <td>게시글 제목 3</td>
        <td>작성자3</td>
        <td>2024-10-%%</td>
        <td>좋아요</td>
        <td>조회수</td>
        <td>
            <button type="button" onclick="editPost()">수정</button>
            <button type="button" onclick="deletePost()">삭제</button>
        </td>
    </tr>
    <tr>
        <td>4</td>
        <td>게시글 제목 4</td>
        <td>작성자4</td>
        <td>2024-10-%%</td>
        <td>좋아요</td>
        <td>조회수</td>
        <td>
            <button type="button" onclick="editPost()">수정</button>
            <button type="button" onclick="deletePost()">삭제</button>
        </td>
    </tr>
    <tr>
        <td>5</td>
        <td>게시글 제목 5</td>
        <td>작성자5</td>
        <td>2024-10-%%</td>
        <td>좋아요</td>
        <td>조회수</td>
        <td>
            <button type="button" onclick="editPost()">수정</button>
            <button type="button" onclick="deletePost()">삭제</button>
        </td>
    </tr>
    <tr>
        <td>6</td>
        <td>게시글 제목 6</td>
        <td>작성자6</td>
        <td>2024-10-%%</td>
        <td>좋아요</td>
        <td>조회수</td>
        <td>
            <button type="button" onclick="editPost()">수정</button>
            <button type="button" onclick="deletePost()">삭제</button>
        </td>
    </tr>
    <tr>
        <td>7</td>
        <td>게시글 제목 7</td>
        <td>작성자7</td>
        <td>2024-10-%%</td>
        <td>좋아요</td>
        <td>조회수</td>
        <td>
            <button type="button" onclick="editPost()">수정</button>
            <button type="button" onclick="deletePost()">삭제</button>
        </td>
    </tr>
    <tr>
        <td>8</td>
        <td>게시글 제목 8</td>
        <td>작성자8</td>
        <td>2024-10-%%</td>
        <td>좋아요</td>
        <td>조회수</td>
        <td>
            <button type="button" onclick="editPost()">수정</button>
            <button type="button" onclick="deletePost()">삭제</button>
        </td>
    </tr>
    <tr>
        <td>9</td>
        <td>게시글 제목 9</td>
        <td>작성자9</td>
        <td>2024-10-%%</td>
        <td>좋아요</td>
        <td>조회수</td>
        <td>
            <button type="button" onclick="editPost()">수정</button>
            <button type="button" onclick="deletePost()">삭제</button>
        </td>
    </tr><tr>
        <td>10</td>
        <td>게시글 제목 10</td>
        <td>작성자10</td>
        <td>2024-10-%%</td>
        <td>좋아요</td>
        <td>조회수</td>
        <td>
            <button type="button" onclick="editPost()">수정</button>
            <button type="button" onclick="deletePost()">삭제</button>
        </td>
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
	
</body>
</html>