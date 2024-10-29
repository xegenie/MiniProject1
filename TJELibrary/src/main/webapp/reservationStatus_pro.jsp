<%@page import="tje.DTO.User"%>
<%@page import="tje.DTO.BookStock"%>
<%@page import="tje.DAO.RentalListDAO"%>
<%@page import="tje.DTO.RentalList"%>
<%@page import="tje.Service.RentalSerivceImpl"%>
<%@page import="tje.Service.RentalService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	RentalService rentalService = new RentalSerivceImpl();
	RentalListDAO rentalListDAO = new RentalListDAO(); 
	BookStock rvBookStock = new BookStock();
	User user = new User();
	if(request.getParameter("rvId") != null) {
		String rvId = request.getParameter("rvId");
		int rvIdNo = Integer.parseInt(rvId);
		
		RentalList rentalList = rentalListDAO.select(rvIdNo); 
		rvBookStock.setBookId(rentalList.getBookId());
		rvBookStock.setStockId(rentalList.getStockId());
		rvBookStock.setStatus("예약 중");
		
		user.setId(rentalList.getId());
		int result=rentalService.rvDelete(rvBookStock, user);
		
	if (result != 0) {
%>
<script type="text/javascript">
	alert('취소 완료!');
</script>
<%
response.sendRedirect("reservationStatus.jsp");
} else {
%>
<script type="text/javascript">
	alert("취소에 실패했습니다. 다시 시도해 주세요.");
	history.back(); // 이전 페이지로 돌아가기
</script>
<%
}
}
%>