package tje.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
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
	
	public int max() {
        int maxValue = -1; // 기본값 설정
        String sql = "SELECT MAX(id) AS max_no FROM book"; // MAX(no) 조회 SQL 문
        try {
        	psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
            if (rs.next()) {
                maxValue = rs.getInt("max_no"); // 결과에서 최대값을 가져옴
            }
        } catch (SQLException e) {
            e.printStackTrace(); // 예외 처리
        }
        return maxValue; // 최대값 반환
    }

}

















