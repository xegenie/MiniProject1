package tje.DAO;

import java.sql.ResultSet;

import java.util.Date;

import com.alohaclass.jdbc.dao.BaseDAOImpl;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import tje.DTO.HopeBook;
import tje.DTO.User;

public class HopeBookDAO extends BaseDAOImpl<HopeBook>{
	@Override
	public HopeBook map(ResultSet rs) throws Exception {
		HopeBook hope_book = new HopeBook();
		hope_book.setNo(rs.getInt("no"));
		hope_book.setId(rs.getString("id"));
		hope_book.setBookName(rs.getString("book_name"));
		hope_book.setAuthor(rs.getString("author"));
		hope_book.setPublisher(rs.getString("publisher"));
		return hope_book;
	}

	@Override
	public String pk() {
		return "no";
	}

	@Override
	public String table() {
		return "hope_book";
	}

}