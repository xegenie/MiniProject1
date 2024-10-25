<%@page import="tje.DTO.User"%>
<%@page import="tje.Service.UserServiceImpl"%>
<%@page import="tje.Service.UserService"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>관리자 회원관리</title>
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
	<style>
	.insert {
	width: 1142px;
	height: 300px;
}

.insert .item2 {
	width: 550px;
}

.item2 span {
	display: inline-block;
	width: 150px;
}

.item2 input {
	width: 350px;
	background-color: #F5F6FA;
	border: 1px solid #D5D5D5;
	border-radius: 8px;
}

.item2 .insertBtn {
	width: 270px;
	height: 40px;
	background-color: #4880FF;
	color: white;
	border: none;
}
.item2 .insertBtn:active {
	box-shadow: inset 0 4px 6px rgba(0, 0, 0, 0.2); /* 안쪽 그림자 */
	background-color: #3965cc;
	transform: scale(0.98); /* 살짝 눌린 효과 */
}
.board-list{
	    width: 100%;
	    border-collapse: collapse;
	    margin-bottom: 20px;
	    margin-top: 10px;
	}
	.board-list th, .board-list td{
	    padding: 15px;
	    border: 1px solid #ddd;
	    text-align: center;
	}
	.board-list td:nth-of-type(2){text-align: left;}
	.board-list th{
	    background-color: #4880FF;
	}
	
	/* 페이지네이션 */
	.pagenation{
	    display: flex;
	    justify-content: center;
	    margin-top: 20px;
	    margin-bottom: 50px;
	}
	
	.page-link{
	    margin: 0 5px;
	    border: 1px solid var(--sub-color);
	    /* padding: 4px 10px; */
	    color: black;
	    text-decoration: none;
	    box-sizing: border-box;
	    width: 40px;
	    height: 40px;
	    line-height: 40px;
	    text-align: center;
	}
	.page-link:hover{
	    background-color: #4880FF;
	    color: white;
	}
	.page-link.selected{
	    background-color: #4880FF;
	    color: white;
	}
	td button {
	    margin-right: 5px; 
	    padding: 5px 10px; 
	    background-color: #4CAF50; 
	    color: white;
	    border: none; 
	    border-radius: 3px; 
	    cursor: pointer;
	}
	
	td button:last-child {
	    background-color: #f44336; 
	}
	</style>
</head>
<body>
<div> <%@ include file="/layout/admin/sidebar.jsp" %></div>
	<%-- [Contents] ######################################################### --%>
	<div class="container border-bottom border-end">
		<div class="insert rounded-3 m-5">
			<div class="item1 fs-2 fw-bold mb-4">도서수정</div>
			<div class="item2 d-flex flex-column row-gap-3 align-items-end">
				<div class="book">
					<span>도서명</span>
					<input type="text" placeholder="도서명을 입력하세요.">
				</div>
				<div class="name">
					<span>저자</span>
					<input type="text" placeholder="저자명을 입력하세요.">
				</div>
				<div class="bookname">
					<span>출판사</span>
					<input type="text" placeholder="출판사를 입력하세요.">
				</div>
				<input class="insertBtn rounded-3" type="submit" value="등록">
			</div>
		</div>
<table class="board-list">
    <thead>
        <tr>
            <th>No.</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성날짜</th>
            <th>좋아요</th>
            <th>조회수</th>
            <th>관리</th>
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
</div>
	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/layout/script.jsp" />
</body>
</html>