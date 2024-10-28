<%@page import="tje.Service.RentalSerivceImpl"%>
<%@page import="tje.Service.RentalService"%>
<%@page import="tje.DTO.BookStock"%>
<%@page import="tje.DTO.User"%>
<%@page import="tje.DTO.RentalList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	RentalList rentalList = new RentalList();
	RentalService rentalService = new RentalSerivceImpl();	

	//회원id, 도서id, 재고 id
	User user = new User();
	BookStock bookStock = new BookStock();
	
	user.setId(request.getParameter("userId"));
	int bookId = Integer.parseInt(request.getParameter("bookId"));
	bookStock.setBookId(bookId);
	int stockId = Integer.parseInt(request.getParameter("stockId"));
	bookStock.setStockId(stockId);
	
	int result = rentalService.rental(bookStock, user);
	if (result!=0){
	%>
		<script type="text/javascript">
		alert('등록 완료!');
<%-- 		window.location.href= '<%= request.getContextPath() %>/rentallist.jsp'; --%>
		</script>
	<%
	response.sendRedirect("admin_user.jsp");
	} else {
		%>
		<script type="text/javascript">
            alert("등록에 실패했습니다. 다시 시도해 주세요.");
            history.back(); // 이전 페이지로 돌아가기
        </script>
		<%
	}
%>