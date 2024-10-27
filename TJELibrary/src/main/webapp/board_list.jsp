<%@page import="tje.Service.BoardServiceImpl"%>
<%@page import="tje.DTO.Board"%>
<%@page import="java.util.List"%>
<%@page import="tje.Service.BoardService"%>
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
		
		String bType = "게시판";
		BoardService boardService = new BoardServiceImpl();
		List<Board> list = boardService.listByType(bType); // 인스턴스 메서드 호출
		pageContext.setAttribute("Boardlist", list);
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
    					<th>등록일자</th>
    					<th>수정일자</th>
    				</tr>
    			</thead>
    			<tbody>
				    <c:forEach items="${Boardlist}" var="board">
				        <tr>
				            <td>${board.boardNo}</td>
				            <td><a href="board_read.jsp?board_id=${board.boardNo}">${board.title}</a></td>
				            <td>${board.writer}</td>
				            <td>${board.regDate}</td>
				            <td>${board.updDate}</td>
				        </tr>
				    </c:forEach>
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