package tje.Service;

import tje.DAO.FilesDAO;
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

}




