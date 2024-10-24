package tje.Service;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import tje.DAO.BookStockDAO;
import tje.DAO.RentalListDAO;
import tje.DAO.UserDAO;
import tje.DTO.BookStock;
import tje.DTO.RentalList;
import tje.DTO.User;

public class RentalSerivceImpl implements RentalService {

	UserDAO userDAO  = new UserDAO();
	RentalListDAO rentalListDAO = new RentalListDAO();
	BookStockDAO bookStockDAO = new BookStockDAO();
	
	@Override
	public RentalList select(User user) {
		
		RentalList rentalList = null;
		
		// 회원ID로 대출내역 조회
		try {
			Map<Object, Object> fields = new HashMap<Object, Object>() {{
				put("id", user.getId());
			}};
			rentalList = rentalListDAO.selectBy(fields);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return rentalList;
	}

	@Override
	public int Reservation(BookStock bookStock, User user) {
	    int result = 0;  // 결과값(성공 여부) 반환용

	    try {
	        // 1. 도서가 '대출 가능'한 상태인지 확인
	        if ("대출 가능".equals(bookStock.getStatus())) {
	            // 2. 도서 상태를 '예약 중'으로 변경
	            bookStock.setStatus("예약 중");
	            bookStockDAO.update(bookStock);  // 변경된 도서 상태 DB에 저장

	            // 3. 대출 내역 등록
	            RentalList rental = new RentalList(bookStock.getStockId(), bookStock.getBookId(), user.getId() );
	            rentalListDAO.insert(rental);  // 대출 내역 DB에 등록

	            System.out.println("예약이 완료되었습니다.");
	            result = 1;  // 성공 시 1 반환
	        } else {
	            System.err.println("이미 예약된 도서이거나 대출 불가능한 도서입니다.");
	        }
	    } catch (Exception e) {
	        System.err.println("예약 처리 중 오류가 발생했습니다: " + e.getMessage());
	        e.printStackTrace();
	    }

	    return result;  // 성공(1) 또는 실패(0) 반환
	}

	@Override
	public int rvDelete(BookStock bookStock, User user) {
	    int result = 0; // 결과값(성공 여부) 반환용

	    try {
	        // 1. 도서가 '예약 중'인지 확인
	        if ("예약 중".equals(bookStock.getStatus())) {
	            // 2. 도서 상태를 '대출 가능'으로 변경
	            bookStock.setStatus("대출 가능");
	            bookStockDAO.update(bookStock);  // 변경된 도서 상태 DB에 저장

	            // 3. 대출 내역 삭제
	            result = rentalListDAO.delete(bookStock);

	            if (result > 0) {
	                System.out.println("예약이 취소되었습니다.");
	                result = 1; // 성공 시 1 반환
	            } else {
	                System.err.println("예약 취소에 실패했습니다.");
	            }
	        } else {
	            System.err.println("예약된 도서가 아닙니다.");
	        }
	    } catch (Exception e) {
	        System.err.println("예약 취소 중 오류가 발생했습니다: " + e.getMessage());
	        e.printStackTrace();
	    }

	    return result;  // 성공(1) 또는 실패(0) 반환
	}

	@Override
	public long overdue(BookStock bookStock, User user) {
		
		// 연체 (반납 예정일)
		
		RentalList rentalList = new RentalList();
		Map<Object, Object> fields = new HashMap<Object, Object>() {{
		put("book_id", bookStock.getBookId());
		put("stock_id", bookStock.getStockId());
		put("id", user.getId());
		put("state", "대출");
		}};
		try {
			rentalList = rentalListDAO.selectBy(fields);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Calendar overday = Calendar.getInstance();  // 오늘 날짜
		overday.setTime(rentalList.getRentalDate()); // RentalList에서 반납 예정일 가져오기
		overday.add(Calendar.DAY_OF_MONTH, 7);

	    Calendar today = Calendar.getInstance();  // 오늘 날짜

	    long dM = today.getTimeInMillis() - overday.getTimeInMillis(); // 밀리초 차이
	    long dD = dM / (24 * 60 * 60 * 1000); // 일수 차이 계산

	    System.out.println("차이(일) : " + dD);

	    // 반납 예정일이 지났다면, dD를 반환하거나 다른 처리 로직을 추가할 수 있습니다.
	    return (dD > 0) ? dD : 0; // 반납 예정일이 지났다면 dD 반환, 그렇지 않으면 0
	}
	
	@Override
	public int rental(BookStock bookStock, User user) {
		// 대출
		
		int result = 0;
		
		RentalList rentalList = new RentalList();
		BookStock bookstock = new BookStock();
		
		rentalList.setId(user.getId());
		rentalList.setBookId(bookstock.getBookId());
		rentalList.setStockId(bookstock.getStockId());
		rentalList.setState("대출");
		
		try {
			result = rentalListDAO.insert(rentalList);
			if ( result > 0 ) System.out.println("대출 등록 성공!");
		} catch (Exception e) {
			System.err.println("대출 등록 실패!");
			e.printStackTrace();
			if ( result == 0 ) return 0;
		}
		
		int statusResult = 0;
		bookstock.setStatus("대출 불가");
		try {
			statusResult = bookStockDAO.update(bookstock);
			if ( statusResult > 0 ) System.out.println("스테이터스 등록 성공!");
		} catch (Exception e) {
			System.err.println("스테이터스 변경 실패!");
			e.printStackTrace();
			if ( statusResult == 0 ) return 0;
		}
		
		return statusResult;
	}

	@Override
	public int returned(BookStock bookStock, User user) {
		// 반납 등록
		int result = 0;
		
		RentalList rentalList = new RentalList();
		BookStock bookstock = new BookStock();
		
		rentalList.setId(user.getId());
		rentalList.setBookId(bookstock.getBookId());
		rentalList.setStockId(bookstock.getStockId());
		rentalList.setState("반납");
		
		long a = overdue(bookstock, user);
		
		if ( a > 0 ) {
			rentalList.setOverDate((int)a);
		}
		
		try {
			result = rentalListDAO.insert(rentalList);
			if ( result > 0 ) System.out.println("반납 등록 성공!");
		} catch (Exception e) {
			System.err.println("반납 등록 실패!");
			e.printStackTrace();
		}
		if ( result == 0 ) return 0;
		
		// 대출 상태
		int statusResult = 0;
		bookstock.setStatus("대출 가능");
		try {
			statusResult = bookStockDAO.update(bookstock);
			if ( statusResult > 0 ) System.out.println("스테이터스 등록 성공!");
		} catch (Exception e) {
			System.err.println("스테이터스 변경 실패!");
			e.printStackTrace();
			if ( statusResult == 0 ) return 0;
		}
		
		return statusResult;
	}

}
