package tje.Service;

import java.util.List;

import tje.DTO.HopeBook;
import tje.DTO.User;

public interface HopeBookService {

	// 희망도서 등록
	public int post(HopeBook hopeBook);
	
	// 희망도서 아이디별 조회
	public List<HopeBook> selectById(User user);
	
	// 희망도서 전부 조회
	public List<HopeBook> selectByManager();
	
	// 희망도서 삭제
	public int delete(HopeBook hopeBook);
}
