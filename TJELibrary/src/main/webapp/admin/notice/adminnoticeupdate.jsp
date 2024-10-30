<%@page import="tje.DTO.Board"%>
<%@page import="java.util.List"%>
<%@page import="tje.Service.BoardServiceImpl"%>
<%@page import="tje.Service.BoardService"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/AdminAccess.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
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
    z-index:1;
}

.input-group textarea{
    width: 645px;
    padding-left: 6px;
    border-radius: 6px;
    border : 1px solid #ddd;
    outline: none;
    resize: none;
    z-index:1;
}

.updatebtn {
    padding: 8px 100px;
    background-color: #4880FF;
    color: white;
    cursor: pointer;
    text-align: center;
    border-radius: 10px;
    text-decoration: none; /* 밑줄 제거 */
}

.updatebtn:hover {
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
	
	
	<%
		String boardIdParam = request.getParameter("board_id");
	    String action = request.getParameter("action"); // 액션 파라미터 추가
	    BoardService boardService = new BoardServiceImpl();
	    Board board = null;

	    // 게시글 삭제 처리
	    if ("delete".equals(action) && boardIdParam != null) {
	        try {
	            int board_id = Integer.parseInt(boardIdParam);
	            boardService.delete(board_id); // 게시글 삭제 메서드 호출
	            out.println("<script>alert('게시글이 삭제되었습니다.'); window.location.href='adminnoticelist.jsp';</script>");
	            return; // 페이지 실행 중단
	        } catch (Exception e) {
	            out.println("<script>alert('게시글 삭제에 실패했습니다.'); window.location.href='adminnoticelist.jsp';</script>");
	            return; // 페이지 실행 중단
	        }
	    }

	    // 게시글 정보 조회
	    if (boardIdParam != null) {
	        try {
	            int board_id = Integer.parseInt(boardIdParam);
	            board = boardService.select(board_id); // 게시글 정보 가져오기
	        } catch (NumberFormatException e) {
	            out.println("<script>alert('유효하지 않은 게시글 ID입니다.'); window.location.href='adminnoticelist.jsp';</script>");
	            return; // 페이지 실행 중단
	        }
	    }

	    // 게시글이 null인지 체크
	    if (board == null) {
	        out.println("<script>alert('게시글을 찾을 수 없습니다.'); window.location.href='adminnoticelist.jsp';</script>");
	        return; // 페이지 실행 중단
	    }

	    // 게시글 목록 조회 (선택적)
	    String bType = "공지사항";
	    List<Board> list = boardService.listByType(bType); // 인스턴스 메서드 호출
	    pageContext.setAttribute("Boardlist", list);
	%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
</head>
<body>
<div>
	<%@ include file="/layout/admin/sidebar.jsp" %>
</div>


<div style="margin-left:15%;padding:1px 16px;">
  <section>
    <div class="container">
        
			<form action="adminnoticeupdate_pro.jsp" method="post">
			<div class="title-box">
		        <h1 class="main-title">공지사항 수정</h1>
		    </div>
                <input type="hidden" name="board_id" value="<%= board.getBoardNo()%>">
                <p>제목</p>
                <div class="input-group">
                    <input type="text" name="title" placeholder="제목을 입력하세요" id="title" value="<%= board.getTitle() %>">
                </div>
                <p>내용</p>
                <div class="input-group">
                    <textarea name="content" id="content" cols="30" rows="10"><%= board.getContent() %></textarea>
                </div>
                <div class="board-box">
			    	<input type="submit" class="updatebtn" value="수정">
			    </div>
			</form>
</div>
<table class="board-list">
    			<thead>
    				<tr>
    					<th>No</th>
    					<th>제목</th>
    					<th>작성자</th>
    					<th>등록일자</th>
    					<th>수정일자</th>
    					<th>관리</th>
    				</tr>
    			</thead>
    			<tbody>
				    <c:forEach items="${Boardlist}" var="board">
				        <tr>
				            <td>${board.boardNo}</td>
				            <td>${board.title}</td>
				            <td>${board.writer}</td>
				            <td>${board.regDate}</td>
				            <td>${board.updDate}</td>
				             <td>
					            <button type="button" onclick="location.href='adminnoticeupdate.jsp';">수정</button>
					            <form action="" method="post" style="display:inline;">
								    <input type="hidden" name="action" value="delete">
								    <input type="hidden" name="board_id" value="${board.boardNo}"> <!-- boardId로 수정 -->
								    <button type="submit">삭제</button>
								</form>
					        </td>
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
</body>
</html>