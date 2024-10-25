<%@ page import="tje.DTO.Board" %>
<%@ page import="tje.Service.BoardServiceImpl" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    BoardServiceImpl boardService = new BoardServiceImpl();
    String message = "";
    
    // GET 요청 시 게시글 정보 로드
    int boardID = Integer.parseInt(request.getParameter("boardID"));
    Board board = boardService.select(boardID);

    // POST 요청 시 수정 또는 삭제 처리
    if ("post".equalsIgnoreCase(request.getMethod())) {
        String action = request.getParameter("action");

        if ("update".equals(action)) {
            String title = request.getParameter("title");
            String content = request.getParameter("content");

            board.setTitle(title);
            board.setContent(content);

            int result = boardService.update(board);
            if (result > 0) {
                message = "게시글 수정 성공!";
                response.sendRedirect("board_list.jsp");
                return;
            } else {
                message = "게시글 수정 실패!";
            }
        } else if ("delete".equals(action)) {
            int result = boardService.delete(boardID);
            if (result > 0) {
                message = "게시글 삭제 성공!";
                response.sendRedirect("board_list.jsp");
                return;
            } else {
                message = "게시글 삭제 실패!";
            }
        }
    }
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 수정</title>
    <link rel="stylesheet" href="static/css/board_update.css">
</head>
<body>
    <h1>게시글 수정</h1>
    <form method="post">
        <input type="hidden" name="boardID" value="<%= board.getBoardNo() %>">
        <div class="input-group">
            <label for="title">제목</label>
            <input type="text" name="title" placeholder="제목을 입력하세요" id="title" value="<%= board.getTitle() %>" required>
        </div>
        <div class="input-group">
            <label for="content">내용</label>
            <textarea name="content" id="content" cols="30" rows="10" required><%= board.getContent() %></textarea>
        </div>
        <div class="board-box">
            <input type="submit" name="action" value="수정" class="btn">
            <input type="submit" name="action" value="삭제" class="btn" onclick="return confirm('정말 삭제하시겠습니까?');">
        </div>
    </form>
    <div>
        <%= message %> <!-- 결과 메시지 표시 -->
    </div>
</body>
</html>
