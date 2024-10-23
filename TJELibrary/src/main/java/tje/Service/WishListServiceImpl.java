package tje.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import tje.DAO.BookDAO;
import tje.DAO.UserDAO;
import tje.DAO.WishListDAO;
import tje.DTO.Book;
import tje.DTO.User;
import tje.DTO.WishList;

public class WishListServiceImpl implements WishListService{

	WishListDAO wishListDAO = new WishListDAO();
	UserDAO userDAO = new UserDAO();
	BookDAO bookDAO = new BookDAO(); 
	
	@Override
	public int save(User user, Book book) {
		WishList wl = new WishList();
		wl.setId(user.getId());
		wl.setBookId(book.getId());
		int result = 0;
		try {
			result = wishListDAO.insert(wl);
		} catch (Exception e) {
			System.out.println("찜 등록을 하던 중 오류 발생");
			e.printStackTrace();
		}
		if( result == 0 ) return 0;
		
		
		return result;
	}

	@Override
	public int cancel(User user, Book book) {
		int result = 0;
		Map<Object, Object> fields = new HashMap<Object, Object>() {{
            put("id", user.getId());
            put("book_id", book.getId());
        }};
        try {
			result = wishListDAO.deleteBy(fields);
		} catch (Exception e) {
			System.out.println("찜을 취소하던 중 오류 발생");
			e.printStackTrace();
		}
        if( result == 0 ) return 0;
        
		return result;
	}

	@Override
	public List<Book> select(User user) {
		List<WishList> wishlistList = new ArrayList<WishList>();
		List<Book> bookList = new ArrayList<Book>();
		Map<Object, Object> fields = new HashMap<Object, Object>() {{
            put("id", user.getId());
        }};
        try {
        	wishlistList = wishListDAO.listBy(fields);
        	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        if(wishlistList == null) return null;
        
        for (WishList wishList : wishlistList) {
        	try {
				Book book = bookDAO.select(wishList.getBookId());
				bookList.add(book);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return bookList;
	}

	@Override
	public boolean isSaved(User user, Book book) {
		WishList result = null;
		Map<Object, Object> fields = new HashMap<Object, Object>() {{
            put("id", user.getId());
            put("book_id", book.getId());
        }};
        try {
			result = wishListDAO.selectBy(fields);
		} catch (Exception e) {
			System.out.println("찜 여부 확인 중 오류");
			e.printStackTrace();
		}
        if(result == null) return false;
        
		return true;
	}

}
