package tje.DAO;

import java.sql.ResultSet;
import java.util.List;
import java.util.Map;

import com.alohaclass.jdbc.dao.BaseDAO;
import com.alohaclass.jdbc.dao.BaseDAOImpl;
import com.alohaclass.jdbc.dto.Page;
import com.alohaclass.jdbc.dto.PageInfo;

import tje.DTO.Book;

public class BookDAO extends BaseDAOImpl<Book> {
	@Override
	public Book map(ResultSet rs) throws Exception {
		Book book = new Book();
		book.setId(rs.getInt("id"));
		book.setIsbn(rs.getString("isbn"));
		book.setTitle(rs.getString("title"));
		book.setAuthor(rs.getString("author"));
		book.setPublisher(rs.getString("publisher"));
		book.setOutline(rs.getString("outline"));
		return book;
	}

	@Override
	public String pk() {
		return "id";
	}

	@Override
	public String table() {
		return "book";
	}

}