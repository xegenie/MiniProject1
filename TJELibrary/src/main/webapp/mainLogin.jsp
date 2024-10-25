<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>더조은 도서관 로그인</title>
<style>
.gray-bg {
    background-color: #f3f3f4;
}

div {
    display: block;
    unicode-bidi: isolate;
}

.loginscreen2 h1 {
    padding: 0;
    margin: 0;
    text-align: center;
}

.loginscreen2 h1 img {
    max-width: 100%;
}

element.style {
    margin: 20px auto 0;
}
.text-center {
    text-align: center;
}

.png1{
/*     float: left; */
/*     width: 200px; */
/*     height: 250px; */
    margin: 20px;
    padding-top: 20px;
/*     border: solid 1px; */
    box-sizing: border-box;
}

.png2 {
/*     float: left; */
/*     width: 200px; */
/*     height: 250px; */
/*     margin: 20px; */
    padding-top: 20px;
/*     border: solid 1px; */
    box-sizing: border-box;
}
</style>
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
</head>

<body class="gray-bg">
	<div class="d-flex justify-content-center">
		<div class="text-center loginscreen2">
			<h1 style="margin-top: 50px">
				<a href="main.jsp"><img src="<%= root %>/static/img/logo.png"></a>
			</h1>
			<div class="d-flex justify-content-center column-gap-5 my-5">
				<div class="mx-4">
						<a href="managerLogin.jsp"><img src="<%= root %>/static/img/관리자 로그인 버튼.png" width="180"></a>
				</div>
				<div class="mx-4">
						<a href="login.jsp"><img src="<%= root %>/static/img/사용자 로그인 버튼.png" width="180"></a>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>	
</body>
</html>



