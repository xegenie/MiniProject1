package tje.DAO;

import java.sql.ResultSet;

import com.alohaclass.jdbc.dao.BaseDAOImpl;

import tje.DTO.User;

public class UserDAO extends BaseDAOImpl<User> {

	@Override
	public User map(ResultSet rs) throws Exception {
		User user = new User();
		user.setId(rs.getString("id"));
		user.setPassword(rs.getString("password"));
		user.setName(rs.getString("name"));
		user.setEmail(rs.getString("email"));
		user.setTelNumber(rs.getString("tel_number"));
		return user;
	}

	@Override
	public String pk() {
		return "id";
	}

	@Override
	public String table() {
		return "users";
	}

}
