<%@page import="tje.DTO.User"%>
<%@page import="tje.DTO.BookStock"%>
<%@page import="tje.DAO.BookStockDAO"%>
<%@page import="tje.DTO.RentalList"%>
<%@page import="tje.DAO.RentalListDAO"%>
<%@page import="tje.Service.RentalSerivceImpl"%>
<%@page import="tje.Service.RentalService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
RentalService rentalService = new RentalSerivceImpl();
String returnUserNo = request.getParameter("returnUserNo");
int rentalNo = Integer.parseInt(returnUserNo);

RentalListDAO rentalListDAO = new RentalListDAO();
RentalList rental = rentalListDAO.select(rentalNo);

int result = rentalService.returned(rental);
if (result != 0) {
%>
<script type="text/javascript">
	alert('등록 완료!');
</script>
<%
response.sendRedirect("rentallist.jsp");
} else {
%>
<script type="text/javascript">
	alert("등록에 실패했습니다. 다시 시도해 주세요.");
	history.back(); // 이전 페이지로 돌아가기
</script>
<%
}
%>