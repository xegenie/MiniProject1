package tje.Service;

import tje.DTO.BookStock;
import tje.DTO.RentalList;
import tje.DTO.User;

public interface RentalService {
	
	// 대출내역 조회
	public RentalList select(User user);
	
	// 예약상태로 변경하고 대출내역에 등록
	public int Reservation(BookStock bookstcok, User user);
	
	// 예약 삭제
	public int rvDelete(BookStock bookStock, User user);
	
	// 연체
	public long overdue(BookStock bookStock, User user);
	
	// 대출
	public int rental(BookStock bookStock, User user);
	
	// 반납
	public  int returned(BookStock bookStock, User user);
	
}
