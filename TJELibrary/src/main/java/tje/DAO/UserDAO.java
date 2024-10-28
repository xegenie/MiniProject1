package tje.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

	// 회원가입 메서드
    public int signUp(User user) {
        int result = 0;
        String sql = "INSERT INTO users (id, password, email, name, tel_number) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

        	pstmt.setString(1, user.getId());
        	pstmt.setString(2, user.getPassword());
        	pstmt.setString(3, user.getEmail());
        	pstmt.setString(4, user.getName());
        	pstmt.setString(5, user.getTelNumber());

            result = pstmt.executeUpdate(); // 쿼리 실행
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result; // 결과 반환
    }

	private Connection getConnection() {
		String url = "jdbc:mysql://192.168.30.237:3306/library?serverTimezone=Asia/Seoul&allowPublicKeyRetrieval=true&useSSL=false"; // 데이터베이스 URL
	    String user = "library"; // 사용자명
	    String password = "123456"; // 비밀번호

	    Connection conn = null;
	    try {
	        conn = DriverManager.getConnection(url, user, password);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return conn;
	}
	
}
