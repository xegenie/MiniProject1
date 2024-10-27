package tje.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.alohaclass.jdbc.dao.BaseDAOImpl;

import tje.DTO.Board;

public class BoardDAO extends BaseDAOImpl<Board>{
	
	@Override
	public Board map(ResultSet rs) throws Exception {
		Board board = new Board();
		board.setBoardNo(rs.getInt("board_id"));
		board.setTitle(rs.getString("title"));
		board.setContent(rs.getString("content"));
		board.setWriter(rs.getString("writer"));
		board.setRegDate(rs.getDate("reg_date"));
		board.setUpdDate(rs.getDate("upd_date"));
		board.setBType(rs.getString("b_type"));
		return board;
	}
	
	@Override
	public String pk() {
		return "board_id";
	}

	@Override
	public String table() {
		return "board";
	}
	
	public List<Board> selectByType(String bType) {
        List<Board> result = new ArrayList<>();
        String sql = "SELECT * FROM board WHERE b_type = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
             
            pstmt.setString(1, bType);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Board board = map(rs);
                    result.add(board);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return result;
    }

	private Connection getConnection() {
	    String url = "jdbc:mysql://localhost:3306/your_database"; // 데이터베이스 URL
	    String user = "your_username"; // 사용자명
	    String password = "your_password"; // 비밀번호

	    Connection conn = null;
	    try {
	        conn = DriverManager.getConnection(url, user, password);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return conn;
	}

}
