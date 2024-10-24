package tje.Service;

import java.util.HashMap;
import java.util.Map;
import tje.DAO.UserAuthDAO;
import tje.DAO.UserDAO;
import tje.DTO.RentalList;
import tje.DTO.User;
import tje.DTO.UserAuth;

public class UserServiceImpl implements UserService{

	UserDAO userDAO  = new UserDAO();
	UserAuthDAO userAuthDAO  = new UserAuthDAO();
	
	@Override
	public int signUp(User user) {
		int result = 0;
		// 회원 가입
		try {
			result = userDAO.insert(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if( result == 0 ) return 0;
		
		// 회원 권한 등록
		int authResult = 0;
		UserAuth userAuth = new UserAuth();
		userAuth.setUsername(user.getId());
		userAuth.setAuth("ROLE_USER");		// 사용자:ROLE_USER, 관리자:ROLE_ADMIN	
		try {
			authResult = userAuthDAO.insert(userAuth);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return authResult;
	}
	
	
	@Override
	public User select(String id) {
		// 회원 조회
		User user = null;
		try {
			// pk 기준으로 조회
			 user = userDAO.select(id);
			
			// 조건으로 조회
			// WHERE name = '김조은'
			//   AND email = 'joeun@naver.com'
//			Map<Object, Object> fields = new HashMap<Object, Object>() {{
//	            put("name", "김조은");
//	            put("email", "joeun@naver.com");
//	        }};
//			user = userDAO.selectBy(fields);
			
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
		// 적용된 데이터 개수를 반환
		// - result(결과) : 0 --> 데이터 삭제 실패
		// 1 --> 삭제 수정 성공
		if (result > 0)
			System.out.println("데이터 삭제 성공!");
		else
			System.err.println("데이터 삭제 실패!");
		return result;
	}


	@Override
	public RentalList select(int no) {
		// TODO Auto-generated method stub
		return null;
	}
}




