package tje.Service;

import java.util.List;

import tje.DTO.Book;

public interface BookService {
	
	// 책 목록
	public List<Book> list();
	
	// 책 목록 페이징
	// TODO: 

	// 책 정보 조회
	public Book select(int id);
	
	// 책 등록
	public int insert(Book book);
	
	// 책 삭제
	public int delete(int id);
	
	// 책 수정
	public int update(Book book);
	
}
