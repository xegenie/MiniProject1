package tje.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import tje.DAO.HopeBookDAO;
import tje.DTO.HopeBook;
import tje.DTO.User;


public class HopeBookServiceImpl implements HopeBookService{
	
	HopeBookDAO hopeBookDAO = new HopeBookDAO();
	
	@Override
	public int post(HopeBook hopeBook) {
		int result = 0;
		try {
			result = hopeBookDAO.insert(hopeBook);
		} catch (Exception e) {
			System.out.println("희망도서 신청을 하던 중 오류 발생");
			e.printStackTrace();
		}
		if( result == 0 ) return 0;
		return result;
	}

	@Override
	public int delete(HopeBook hopeBook) {
		int result = 0;
		try {
			result = hopeBookDAO.delete(hopeBook.getNo());
		} catch (Exception e) {
			System.out.println("희망신청을 삭제하던 중 오류 발생");
			e.printStackTrace();
		}
		if( result == 0 ) return 0;
		return result;
	}
	
	@Override
	public List<HopeBook> selectById(User user) {
		List<HopeBook> hopeBookList = new ArrayList<HopeBook>();
		Map<Object, Object> fields = new HashMap<Object, Object>() {{
            put("id", user.getId());
        }};
        try {
			hopeBookList = hopeBookDAO.listBy(fields);
		} catch (Exception e) {
			System.out.println("아이디를 통해 희망도서 조회 중 오류");
			e.printStackTrace();
			return null;
		}
		return hopeBookList;
	}
	
	@Override
	public List<HopeBook> selectByManager() {
		List<HopeBook> hopeBookList = new ArrayList<HopeBook>();
		try {
			hopeBookList = hopeBookDAO.list();
		} catch (Exception e) {
			System.out.println("전체 희망도서 조회 중 오류");
			e.printStackTrace();
			return null;
		}
		return hopeBookList;
	}

}
