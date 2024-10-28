<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>관리자 게시판 목록</title>
	<style>
	
	/* 검색창 컨테이너 */
	.rounded-search-container {
	    display: flex;
	    align-items: center;
	    background-color: rgb(218, 214, 214); 
	    border-radius: 40px; 
	    padding: 5px 15px; 
	    width: 350px; 
	    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); 
	    float: right;
	    margin-bottom: 10px;
	}
	
	/* 검색 입력창 스타일 */
	.rounded-search-input {
	    flex-grow: 1;
	    border: none;
	    outline: none;
	    padding: 8px; 
	    font-size: 14px;
	    color: white;
	    background-color: transparent;
	}
	
	/* 검색 버튼 스타일 */
	.rounded-search-btn {
	    border: none;
	    background: none;
	    cursor: pointer;
	    color: white;
	}
	
	/* 검색 아이콘 크기 */
	.rounded-search-btn i {
	    font-size: 18px; /* 아이콘 크기 조정 */
	}
	
	
	/* 게시글 목록 */
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
	
	/* 게시글 등록 */
	.title-box{
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	    margin-bottom:10px;
	
	}
	
	.main-title{
		font-size: 30px;
	}
	
	.input-group{
	    display: flex;
	    justify-content: flex-start;
	    align-items: center;
	    margin-bottom:10px;
	    margin-top: 10px;
	}
	
	.input-group label{
	    width: 10%;
	    text-align: center;
	    font-size:20px;
	}
	
	
	.input-group input{
	    width: 500px;
	    padding: 10px 6px;
	    border-radius: 6px;
	    border : 1px solid #ddd;
	    outline: none;
	    z-index:-1;
	}
	
	.input-group textarea{
	    width: 645px;
	    padding-left: 6px;
	    border-radius: 6px;
	    border : 1px solid #ddd;
	    outline: none;
	    resize: none;
	    z-index:-1;
	}
	
	a.btn {
	    padding: 8px 100px;
	    background-color: #4880FF;
	    color: white;
	    cursor: pointer;
	    text-align: center;
	    border-radius: 10px;
	    text-decoration: none; /* 밑줄 제거 */
	}
	
	a.btn:hover {
	    filter: brightness(90%);
	    text-decoration: none; /* 호버 시에도 밑줄이 생기지 않도록 */
	}
	.board-box{
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	    margin-bottom: 10px;
	    margin-left:425px;
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
<!-- 	<link rel="stylesheet" href="static/css/adminboardlist.css"> -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
	<div>
		<%@ include file="/layout/admin/sidebar.jsp" %>
	</div>
<div style="margin-left:15%;padding:1px 16px;">
  <section>
    <div class="container">
        <div class="title-box">
            <h1 class="main-title">게시글 등록</h1>
        </div>
        <p>제목</p>
        <div class="input-group">
            <input type="text" name="title" placeholder="제목을 입력하세요" id="title">
        </div>
        <p>내용</p>
        <div class="input-group">
            <textarea name="content" id="content" cols="30" rows="10" placeholder="내용을 입력하세요" ></textarea>
        </div>
        <div class="board-box">
	    		<a href="" class="btn">등록</a>
    		</div>
  		<div class="rounded-search-container">
                <input type="text" class="rounded-search-input" placeholder="아이디/이름을 검색해주세요">
                <button class="rounded-search-btn">
                    <i class="fa fa-search"></i>
                </button>
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
            <button type="button" onclick="location.href='adminboardupdate.jsp'; editPost();">수정</button>
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
            <button type="button" onclick="location.href='adminboardupdate.jsp'; editPost();">수정</button>
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
            <button type="button" onclick="location.href='adminboardupdate.jsp'; editPost();">수정</button>
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
            <button type="button" onclick="location.href='adminboardupdate.jsp'; editPost();">수정</button>
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
            <button type="button" onclick="location.href='adminboardupdate.jsp'; editPost();">수정</button>
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
            <button type="button" onclick="location.href='adminboardupdate.jsp'; editPost();">수정</button>
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
            <button type="button" onclick="location.href='adminboardupdate.jsp'; editPost();">수정</button>
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
            <button type="button" onclick="location.href='adminboardupdate.jsp'; editPost();">수정</button>
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
            <button type="button" onclick="location.href='adminboardupdate.jsp'; editPost();">수정</button>
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
            <button type="button" onclick="location.href='adminboardupdate.jsp'; editPost();">수정</button>
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