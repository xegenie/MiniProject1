<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" href="static/css/adminboardupdate.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
</head>
<body>
	<div>
    <ul>
        <p class="sub-title">관리자 페이지</p>
        <li><a class="list" href="#">회원 관리</a></li>
        <li><a href="#">게시글 관리</a></li>
        <li><a href="#">댓글 관리</a></li>
        <li><a href="#">도서 관리</a></li>
        <li><a href="#">대출 관리</a></li>
        <li><a href="#">희망도서 관리</a></li>
        <li><a href="#">예약 관리</a></li>
        <li><a href="#">공지사항</a></li>
    </ul>

<div style="margin-left:25%;padding:1px 16px;">
  <section>
    <div class="container">
        <div class="title-box">
            <h1 class="main-title">게시글 수정</h1>
        </div>
        <p>제목</p>
        <div class="input-group">
            <input type="text" name="title" placeholder="제목을 입력하세요" id="title">
        </div>
        <p>내용</p>
        <div class="input-group">
            <textarea name="content" id="content" cols="30" rows="10" placeholder="내용을 입력하세요"></textarea>
        </div>
        <div class="board-box">
	    		<a href="" class="btn">수정</a>
    		</div>
            <div class="rounded-search-container">
                <input type="text" class="rounded-search-input" placeholder="아이디/이름을 검색해주세요">
                <button class="rounded-search-btn">
                    <i class="fa fa-search"></i>
                </button>
            </div>
</div>
<table class="board-list">
    <thread>
        <tr>
            <th>No.</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성날짜</th>
            <th>좋아요</th>
            <th>조회수</th>
            <th>관리</th>
        </tr>
    </thread>
    <tbody>
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