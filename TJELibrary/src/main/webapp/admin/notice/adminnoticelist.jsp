<%@page import="tje.DTO.Board"%>
<%@page import="java.util.List"%>
<%@page import="tje.Service.BoardService"%>
<%@page import="tje.Service.BoardServiceImpl"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/AdminAccess.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>관리자 공지사항 목록</title>
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
	
	.insertbtn {
	    padding: 8px 100px;
	    background-color: #4880FF;
	    color: white;
	    cursor: pointer;
	    text-align: center;
	    border-radius: 10px;
	    text-decoration: none; /* 밑줄 제거 */
	}
	
	.insertbtn:hover {
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
	
	.updbtn {
    padding: 5px 10px;
    background-color: #90EE90; /* 연두색 */
    color: white;
    border: none;
    border-radius: 3px;
    cursor: pointer;
}

.updbtn:hover {
    filter: brightness(90%);
}
	</style>
<!-- 	<link rel="stylesheet" href="static/css/adminboardlist.css"> -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
	<%
    // 세션에서 User 객체 가져오기
    User user = (User) session.getAttribute("user");
    if (user == null) {
        out.println("로그인이 필요합니다.");
        return; // 또는 다른 처리를 추가
    }
    
    // 게시글 삭제 처리
    String action = request.getParameter("action"); 
    String boardIdParam = request.getParameter("board_id"); 

    if (boardIdParam != null) {
        int board_id = Integer.parseInt(boardIdParam); 

        // BoardService 인스턴스 생성
        BoardService boardService = new BoardServiceImpl();
        boolean isSuccess = false; // 작업 성공 여부

        // 삭제 요청 처리
        if ("delete".equals(action)) {
            isSuccess = boardService.delete(board_id) > 0; // 삭제 성공 여부 확인
        }

        // 결과에 따른 알림 및 페이지 이동 처리
        if (isSuccess) {
            out.println("<script>alert('게시글이 삭제되었습니다.'); location.href='adminnoticelist.jsp';</script>");
        } else {
            out.println("<script>alert('게시글 삭제에 실패했습니다. 다시 시도하세요.'); history.back();</script>");
        }
    }

    // 게시글 목록 조회 (선택적)
    String bType = "공지사항";
    BoardService boardService = new BoardServiceImpl();
    List<Board> list = boardService.listByType(bType); // 인스턴스 메서드 호출
    pageContext.setAttribute("Boardlist", list);
%>

<body>
	<div>
		<%@ include file="/layout/admin/sidebar.jsp" %>
	</div>
<div style="margin-left:15%;padding:1px 16px;">
  <section>
    <div class="container">
    	<form action="adminnoticeinsert_pro.jsp" method="post">
    <div class="title-box">
        <h1 class="main-title">공지사항 등록</h1>
    </div>
    <p>제목</p>
    <div class="input-group">
        <input type="text" name="title" placeholder="제목을 입력하세요" id="title" required>
    </div>
    <p>내용</p>
    <div class="input-group">
        <textarea name="content" id="content" cols="30" rows="10" placeholder="내용을 입력하세요" required></textarea>
    </div>
    <input type="hidden" name="bType" value="공지사항"> <!-- bType 추가 -->
    <div class="board-box">
        <input type="submit" class="insertbtn" value="등록">
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
				            <td>${user.id}</td>
				            <td>${board.regDate}</td>
				            <td>${board.updDate}</td>
				             <td>
					            <button class="updbtn" onclick="location.href='adminnoticeupdate.jsp?board_id=${board.boardNo}'">수정</button>
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