package tje.Service;

import java.util.List;

import com.alohaclass.jdbc.dto.Page;
import com.alohaclass.jdbc.dto.PageInfo;

import tje.DAO.FilesDAO;
import tje.DTO.Book;
import tje.DTO.Files;

public class FilesServiceImpl implements FilesService {

	FilesDAO filesDAO = new FilesDAO();
	
	@Override
	public int insert(Files file) {
		int result = 0;
		
		try {
			result = filesDAO.insert(file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public Files select(int no) {
		Files file = null;
		
		try {
			file = filesDAO.select(no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return file;
	}

	@Override
	public int delete(int no) {
		int result = 0;
		
		try {
			result = filesDAO.delete(no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public PageInfo<Files> page(int pageNo, int size) {
		Page page = new Page();
		page.setPage(pageNo);
		page.setSize(size);
		page.calc();
		PageInfo<Files> pageInfo = null;
		try {
			pageInfo = filesDAO.page(page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageInfo;
	}

	@Override
	public List<Files> list() {
		List<Files> list = null;
		
		try {
			list = filesDAO.list();
		} catch (Exception e) {
			System.err.println("책 목록 조회 실패");
			e.printStackTrace();
		}
		
		
		return list;
	}

}




