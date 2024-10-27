package tje.Service;

import java.util.List;

import com.alohaclass.jdbc.dto.PageInfo;

import tje.DTO.Book;
import tje.DTO.BookStock;
import tje.DTO.RentalList;

public interface BookService {
	
	// 책 목록
	public List<Book> list();
	
	// 책 목록 페이징
	public PageInfo<Book> page(int pageNo, int size);

	// 도서id로 정보 조회
	public Book select(int id);
	
	// 도서id로 재고정보 조회
	public BookStock selectStock(int id);
	// 도서id로 대출내역 조회
	public RentalList selectRental(int id);
	
	// 책 등록
	public int insert(Book book);
	
	// 책 삭제
	public int delete(int id);
	
	// 책 수정
	public int update(Book book);
	
	// 북 id 최댓값
	public int max();
	
	
}



