package tje.Service;

import tje.DTO.User;

public interface UserService {

	// 회원가입
	public int signUp (User user);
	
	// 회원조회
	public User select(String id);
	
}
