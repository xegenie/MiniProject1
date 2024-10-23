package tje.DAO;

import java.sql.ResultSet;

import com.alohaclass.jdbc.dao.BaseDAO;
import com.alohaclass.jdbc.dao.BaseDAOImpl;

import tje.DTO.BookStock;
import tje.DTO.UserAuth;

public class BookStockDAO extends BaseDAOImpl<BookStock>{
	@Override
	public BookStock map(ResultSet rs) throws Exception {
		BookStock booksStock = new BookStock();
		booksStock.setStockId(rs.getInt("stock_id"));
		booksStock.setBookId(rs.getInt("book_id"));
		booksStock.setStatus(rs.getString("status"));
		return booksStock;
	}

	@Override
	public String pk() {
		return "stock_id";
	}

	@Override
	public String table() {
		return "book_stock";
	}

}