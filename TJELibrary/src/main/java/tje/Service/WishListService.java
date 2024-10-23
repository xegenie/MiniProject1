package tje.Service;

import java.util.List;

import tje.DTO.Book;
import tje.DTO.User;

public interface WishListService {
	
	// 찜 등록
	public int save(User user, Book book);

	// 찜 취소
	public int cancel(User user, Book book);
	
	// 찜 조회
	public List<Book> select(User user);
	
	// 찜 여부 확인
	public boolean isSaved(User user, Book book);
}
