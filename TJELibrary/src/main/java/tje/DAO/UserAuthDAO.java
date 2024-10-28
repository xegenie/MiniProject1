package tje.DAO;

import java.sql.ResultSet;

import com.alohaclass.jdbc.dao.BaseDAOImpl;

import tje.DTO.User;
import tje.DTO.UserAuth;

public class UserAuthDAO extends BaseDAOImpl<UserAuth> {

	@Override
	public UserAuth map(ResultSet rs) throws Exception {
		UserAuth userAuth = new UserAuth();
		userAuth.setNo(rs.getInt("no"));
		userAuth.setUsername(rs.getString("username"));
		userAuth.setAuth(rs.getString("auth"));
		userAuth.setCreatedAt(rs.getTimestamp("created_at"));
		return userAuth;
	}

	@Override
	public String pk() {
		return "username";
	}

	@Override
	public String table() {
		return "user_auth";
	}

}
