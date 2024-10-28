package tje.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import tje.DAO.UserAuthDAO;
import tje.DAO.UserDAO;
import tje.DTO.Board;
import tje.DTO.RentalList;
import tje.DTO.User;
import tje.DTO.UserAuth;

public class UserServiceImpl implements UserService{

	UserDAO userDAO  = new UserDAO();
	UserAuthDAO userAuthDAO  = new UserAuthDAO();
	
	@Override
    public int signUp(User user) {
        int result = 0; // 결과 변수 초기화
        try {
            result = userDAO.signUp(user); // userDAO의 signUp 메서드 호출
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result; // 가입 결과 반환
    }
	
	@Override
	public User select(String id) {
		// 회원 조회
		User user = null;
		try {
			 user = userDAO.select(id);		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	} 

	@Override
	public int delete(String id) {
		// 회원 삭제
		int result = 0;
		try {
			result = userDAO.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (result > 0)
			System.out.println("데이터 삭제 성공!");
		else
			System.err.println("데이터 삭제 실패!");
		return result;
	}


	@Override
	public RentalList select(int no) {
		return null;
	}


	@Override
	public List<User> list() {
		List<User> userList = null;
        try {
            userList = userDAO.list();
        } catch (Exception e) {
            e.printStackTrace();  // 예외 처리
        }
        return userList;
	}
}




