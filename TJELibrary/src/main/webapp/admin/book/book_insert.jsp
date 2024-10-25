<%@page import="tje.DTO.User"%>
<%@page import="tje.Service.UserServiceImpl"%>
<%@page import="tje.Service.UserService"%>
<%@ include file="/layout/jstl.jsp"%>
<%@ include file="/layout/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>관리자 도서관리</title>
<jsp:include page="/layout/meta.jsp" />
<jsp:include page="/layout/link.jsp" />
<link rel="stylesheet" href="<%=root%>/static/css/book_insert.css">
</head>
<body>
	<div><%@ include file="/layout/admin/sidebar.jsp"%></div>
	<%-- [Contents] ######################################################### --%>
	<div class="container border-bottom border-end">
		<div class="insert rounded-3 m-5">
			<div class="item1 fs-2 fw-bold mb-4">도서등록</div>
			<div class="item2">
				<form class="d-flex flex-column row-gap-3 align-items-end"
					action="<%=request.getContextPath()%>/admin/book/fileupload_pro.jsp"
					method="post" enctype="multipart/form-data">
					<div class="title">
						<span>도서명</span> <input type="text" name="title"
							placeholder="도서명을 입력하세요." required>
					</div>
					<div class="name">
						<span>저자</span> <input type="text" name="author"
							placeholder="저자명을 입력하세요." required>
					</div>
					<div class="publisher">
						<span>출판사</span> <input type="text" name="publisher"
							placeholder="출판사를 입력하세요." required>
					</div>
					<div class="files">
						<span>파일 업로드</span> <input type="file" name="file1" required>
					</div>
					<div class="insertBox mt-4 d-flex justify-content-end">
						<input class="insertBtn rounded-3" type="submit" value="등록">
					</div>
				</form>
			</div>

		</div>
	</div>
	<div class="container">
		<table class="board-list">
			<thead>
				<tr>
					<th>No.</th>
					<th>도서명</th>
					<th>저자</th>
					<th>작성날짜</th>
					<th>출판사</th>
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
					<td>조회수</td>
					<td>
						<button type="button" onclick="editPost()">수정</button>
						<button type="button" onclick="deletePost()">삭제</button>
					</td>
				</tr>
				<tr>
					<td>10</td>
					<td>게시글 제목 10</td>
					<td>작성자10</td>
					<td>2024-10-%%</td>
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