package tje.Service;

import tje.DAO.BookStockDAO;
import tje.DTO.BookStock;

public class BookStockServiceImpl implements BookStockService {

	BookStockDAO bookStockDAO = new BookStockDAO();
	
	@Override
	public BookStock select(int id) {
		BookStock bookStock = null;
		
		try {
			bookStock = bookStockDAO.select(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bookStock;
	}

	@Override
	public int insert(BookStock bookstock) {
		int result = 0;
		// 책 등록
		try {
			result = bookStockDAO.insert(bookstock);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
