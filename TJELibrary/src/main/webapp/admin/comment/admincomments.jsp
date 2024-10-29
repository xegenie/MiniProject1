<%@ page import="tje.Service.BoardService" %>
<%@ page import="tje.Service.BoardServiceImpl" %>
<%@ page import="tje.DTO.Board" %>
<%@ page import="tje.DTO.Comments" %>
<%@ page import="java.util.List" %>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // 세션에서 User 객체 가져오기
    User user = (User) session.getAttribute("user");
    if (user == null) {
        // user가 null인 경우 처리
        out.println("로그인이 필요합니다.");
        return; // 또는 다른 처리를 추가
    }
    
    // 댓글 삭제 처리
    String action = request.getParameter("action"); // 'delete'
    String commentIdParam = request.getParameter("commentId"); // 댓글 ID
    
    // 댓글 ID를 int로 변환
    if (commentIdParam != null) {
        int commentId = Integer.parseInt(commentIdParam); 

        // BoardService 인스턴스 생성
        BoardService boardService = new BoardServiceImpl();
        boolean isSuccess = false; // 작업 성공 여부

        // 삭제 요청 처리
        if ("delete".equals(action)) {
            isSuccess = boardService.deleteComment(commentId) > 0; // 삭제 성공 여부 확인
        }

        // 결과에 따른 알림 및 페이지 이동 처리
        if (isSuccess) {
            out.println("<script>alert('댓글이 삭제되었습니다.'); location.href='admincomments.jsp';</script>");
        } else {
            out.println("<script>alert('댓글 삭제에 실패했습니다. 다시 시도하세요.'); history.back();</script>");
        }
    }

    // 전체 댓글 조회
    BoardService boardService = new BoardServiceImpl();
    List<Comments> comments = boardService.selectAllComments(user);  // 전체 댓글 조회
    pageContext.setAttribute("comments", comments);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>댓글 관리</title>
    <style>
        /* 스타일 정의 */
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
        .rounded-search-input {
            flex-grow: 1;
            border: none;
            outline: none;
            padding: 8px; 
            font-size: 14px;
            color: white;
            background-color: transparent;
        }
        .rounded-search-btn {
            border: none;
            background: none;
            cursor: pointer;
            color: white;
        }
        .rounded-search-btn i {
            font-size: 18px;
        }
        .board-list {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            margin-top: 10px;
        }
        .board-list th, .board-list td {
            padding: 15px;
            border: 1px solid #ddd;
            text-align: center;
        }
        .board-list td:nth-of-type(2) {
            text-align: left;
        }
        .board-list th {
            background-color: #4880FF;
        }
        .pagenation {
            display: flex;
            justify-content: center;
            margin-top: 20px;
            margin-bottom: 50px;
        }
        .page-link {
            margin: 0 5px;
            border: 1px solid var(--sub-color);
            color: black;
            text-decoration: none;
            box-sizing: border-box;
            width: 40px;
            height: 40px;
            line-height: 40px;
            text-align: center;
        }
        .page-link:hover {
            background-color: #4880FF;
            color: white;
        }
        .page-link.selected {
            background-color: #4880FF;
            color: white;
        }
        a.btn {
            padding: 8px 100px;
            background-color: #4880FF;
            color: white;
            cursor: pointer;
            text-align: center;
            border-radius: 10px;
            text-decoration: none;
        }
        a.btn:hover {
            filter: brightness(90%);
            text-decoration: none;
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <div>
        <%@ include file="/layout/admin/sidebar.jsp" %>
    </div>
    <div style="margin-left:10%;padding:1px 16px;">
        <section>
            <div class="container">
                <div class="title-box">
                    <h1 class="main-title">댓글 관리</h1>
                </div>
                <div class="rounded-search-container">
                    <input type="text" class="rounded-search-input" placeholder="아이디/이름을 검색해주세요">
                    <button class="rounded-search-btn">
                        <i class="fa fa-search"></i>
                    </button>
                </div>
                <table class="board-list">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>작성자 ID</th>
                            <th>내용</th>
                            <th>등록일자</th>
                            <th>게시글 ID</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${comments}" var="comment">
                            <tr>
                                <td>${comment.commentId}</td> <!-- 댓글 번호 -->
                                <td>${user.id}</td> <!-- 작성자 ID -->
                                <td>${comment.content}</td> <!-- 댓글 내용 -->
                                <td>${comment.regDate}</td> <!-- 등록일자 -->
                                <td>${comment.boardId}</td> <!-- 게시글 ID -->
                                <td>
                                    <form action="" method="post" style="display:inline;">
                                        <input type="hidden" name="action" value="delete">
                                        <input type="hidden" name="commentId" value="${comment.commentId}">
                                        <button type="submit">삭제</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="pagenation">
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
            </div>
        </section>
    </div>
</body>
</html>
