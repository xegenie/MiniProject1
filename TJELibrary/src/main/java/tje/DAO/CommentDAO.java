package tje.DAO;

import java.sql.ResultSet;

import com.alohaclass.jdbc.dao.BaseDAOImpl;

import tje.DTO.Comments;

public class CommentDAO extends BaseDAOImpl<Comments>{
	
	@Override
	public Comments map(ResultSet rs) throws Exception {
		Comments comments = new Comments();
		comments.setBoardID(rs.getInt("board_id"));
		comments.setCommentID(rs.getString("comment_id"));
		comments.setContent(rs.getString("content"));
		comments.setWriter(rs.getString("writer"));
		comments.setRegDate(rs.getDate("reg_date"));
		return comments;
	}

	@Override
	public String table() {
		return "comments";
	}

	@Override
	public String pk() {
		return null;
	}
}
