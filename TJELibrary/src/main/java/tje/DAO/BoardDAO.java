package tje.DAO;

import java.sql.ResultSet;

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

}
