<%@page import="tje.DAO.BookDAO"%>
<%@page import="tje.Service.BookStockServiceImpl"%>
<%@page import="tje.Service.BookStockService"%>
<%@page import="tje.DTO.BookStock"%>
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
	String userHome = System.getProperty("user.home");
	String path = userHome + "\\git\\MiniProject1\\TJELibrary\\src\\main\\webapp\\static\\img";

	DiskFileUpload upload = new DiskFileUpload();
	
	upload.setSizeMax(10*1000*1000); 		// 10MB - 파일 최대 크기
	upload.setSizeThreshold( 4 * 1024 );	// 4MB	- 메모리상의 최대 크기
	upload.setRepositoryPath(path);			// 임시 저장 경로
	
	List<FileItem> items = upload.parseRequest(request);
	Iterator params = items.iterator();
	
	int id = 0;
	String title = "";
	String author = "";
	String publisher = "";
	String outline = "";
	String isbn = "";
	
	FileItem fileItem = null;
	while( params.hasNext() ) {
		FileItem item = (FileItem) params.next();
		
		// 일반 데이터
		if( item.isFormField() ) {
			String name = item.getFieldName();
			String value = item.getString("utf-8");
			out.println(name + " : " + value + "<br>");
			if(name.equals("id")) {
				id = Integer.parseInt(value);
			}
			if(name.equals("title")) {
				title = value;
			}
			if(name.equals("author")) {
				author = value;
			}
			if(name.equals("publisher")) {
				publisher = value;
			}
			if(name.equals("outline")) {
				outline = value;
			}
			if(name.equals("isbn")) {
				isbn = value;
			}
		}
		
		// 파일 데이터
		else {
			fileItem = item;
		}	
	}
	
	// 책 정보 수정
	BookDAO bookDAO = new BookDAO();
	Book book = bookDAO.select(id);
	
	if (id <= 0) {
	    response.sendRedirect(root + "/admin/book/book_insert.jsp?error=invalid_id,Id="+id);
	    return;
	}
	
	book.setTitle(title);
	book.setAuthor(author);
	book.setPublisher(publisher);
	book.setIsbn(isbn);
	book.setOutline(outline);
	
	BookService bookService = new BookServiceImpl();
	int result = bookService.update(book);
	
	if( result == 0 ) {
		// 책 정보 업데이트 실패
		response.sendRedirect(root + "/admin/book/book_insert.jsp?error");
	}
	
	// 책 이미지 파일 업로드
	String fileFieldName = fileItem.getFieldName();
	String fileName = fileItem.getName();
	String contentType = fileItem.getContentType();
	
	fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
	long fileSize = fileItem.getSize();
	
	File file = new File(path+ "/" + fileName);
	fileItem.write(file);		// 파일 업로드
	
	// DB 에 파일 데이터 등록
	FilesService fileService = new FilesServiceImpl();
	Files files = fileService.select(id); // 기존 파일 데이터 가져오기

	// 기존 파일 데이터를 기반으로 업데이트할 새 파일 데이터 생성
	files = Files.builder() // Lombok Builder 사용
           .pTable(files.getPTable()) // 기존 테이블 이름 사용
           .pId(files.getPId()) // 기존 ID 사용
           .fileType(files.getFileType()) // 기존 파일 종류 사용 (또는 새로운 값 설정 가능)
           .fileName(fileName) // 새 파일 이름
           .filePath(path + File.separator + fileName) // 새 파일 경로
           .fileSize((int) fileSize) // 새 파일 크기
           .build();

	// 파일 서비스에서 업데이트 수행
	int result2 = fileService.update(files);


	out.println("--------------------------------------------------");
	out.println("요청 파라미터 이름 : " + fileFieldName + "<br>");
	out.println("저장 파일 이름: " + fileName + "<br>");
	out.println("파일 컨텐츠 타입 : " + contentType + "<br>");
	out.println("파일 크기 : " + fileSize + "<br>");
	
	out.println("파일 업데이트 성공");
	
	if( result > 0 && result2 > 0 ) {
		response.sendRedirect(root + "/admin/book/book_insert.jsp");
	}
	else {
		response.sendRedirect(root + "/admin/book/book_insert.jsp?error");
	}
	
%>









