package tje.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import tje.DAO.BookDAO;
import tje.DAO.UserAuthDAO;
import tje.DAO.UserDAO;
import tje.DTO.Book;
import tje.DTO.User;

public class BookServiceImpl implements BookService{

	UserDAO userDAO  = new UserDAO();
	UserAuthDAO userAuthDAO  = new UserAuthDAO();
	BookDAO bookDAO = new BookDAO();
	
	@Override
	public Book select(int id) {
		// 책 정보 조회
		Book book = null;
		try {
			// pk 기준으로 조회
			 book = bookDAO.select(id);
			
			// 조건으로 조회
			// WHERE name = '김조은'
			//   AND email = 'joeun@naver.com'
//			Map<Object, Object> fields = new HashMap<Object, Object>() {{
//	            put("name", "김조은");
//	            put("email", "joeun@naver.com");
//	        }};
//			user = userDAO.selectBy(fields);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return book;
	}
	@Override
	public int insert(Book book) {
		int result = 0;
		// 책 등록
		try {
			result = bookDAO.insert(book);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int delete(int id) {
		// 책 삭제
		int result = 0;
		try {
			result = userDAO.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 적용된 데이터 개수를 반환
		// - result(결과)	: 0 --> 데이터 삭제 실패
		//				  1 --> 삭제 수정 성공
		if( result > 0 ) System.out.println("데이터 삭제 성공!");
		else System.err.println("데이터 삭제 실패!");
		return result;
		
	}
	
	@Override
	public int update(Book book) {
		// 책 수정
		int result = 0;
		try {
			result = bookDAO.update(book);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 적용된 데이터 개수를 반환
		// - result(결과)	: 0 --> 데이터 수정 실패
		//				      1 --> 데이터 수정 성공
		if( result > 0 ) System.out.println("책 수정 성공!");
		else System.err.println("책 수정 실패!");
		return result;
	}
	
	
	@Override
	public List<Book> list() {
		
		List<Book> list = null;
		
		try {
			list = bookDAO.list();
		} catch (Exception e) {
			System.err.println("책 목록 조회 실패");
			e.printStackTrace();
		}
		
		
		return list;
	}
}


		
		
		




