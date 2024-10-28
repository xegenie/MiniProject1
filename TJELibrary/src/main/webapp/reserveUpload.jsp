<%@page import="tje.DTO.User"%>
<%@page import="tje.DTO.BookStock"%>
<%@page import="tje.Service.RentalSerivceImpl"%>
<%@page import="tje.Service.RentalService"%>
<%@page import="tje.DTO.RentalList"%>
<%@page import="tje.Service.FilesServiceImpl"%>
<%@page import="tje.Service.FilesService"%>
<%@page import="tje.Service.BookServiceImpl"%>
<%@page import="tje.Service.BookService"%>
<%@page import="tje.DTO.Book"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@page import="tje.DTO.Files"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@ include file="/layout/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
try {
	String userId = "";
	int bookId = 0;

	DiskFileUpload upload = new DiskFileUpload();

	List<FileItem> items = upload.parseRequest(request);
	Iterator params = items.iterator();

	FileItem fileItem = null;
	while (params.hasNext()) {
		FileItem item = (FileItem) params.next();

		// 일반 데이터
		if (item.isFormField()) {
			String name = item.getFieldName();
			String value = item.getString("utf-8");
			out.println(name + " : " + value + "<br>");
			// 			if(name.equals("userId")) {
			// 				userId = value;
			// 			}
			if (name.equals("bookId")) {
				bookId = Integer.parseInt(value);
			}
		}

		// 대출기록 정보
// 		RentalList rentalList = new RentalList();
// 		rentalList.setBookId(bookId);
// 		rentalList.setId("joeun");
// 		rentalList.setState("예약 중");
// 		rentalList.setStockId(1);
// 		rentalList.setOverDate(0);
		RentalService rentalService = new RentalSerivceImpl();


		// 수정해본 것
		BookStock bookStock = new BookStock();
		bookStock.setBookId(bookId);
		bookStock.setStockId(1);
		bookStock.setStatus("예약 중");
		
		User user = new User();
		user.setId("joeun");
		
		int result = rentalService.Reservation(bookStock, user);
		//-------여기까지 수정

		if (result == 0) {
	// 책 정보 등록 실패
	response.sendRedirect(root + "/book_detail.jsp?error");
		}

		if (result > 0) {
	request.getSession().setAttribute("message", "예약이 완료되었습니다!");
	response.sendRedirect(root + "/book_detail.jsp");
		} else {
	request.getSession().setAttribute("error", "예약 실패했습니다.");
	response.sendRedirect(root + "/book_detail.jsp?error");
		}
	}
} catch (Exception e) {
	e.printStackTrace(); // 예외 발생 시 스택 트레이스 출력
	request.getSession().setAttribute("error", "오류가 발생했습니다: " + e.getMessage());
	response.sendRedirect(root + "/book_detail.jsp?error");
}
%>









