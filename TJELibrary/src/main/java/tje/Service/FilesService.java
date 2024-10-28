package tje.Service;

import com.alohaclass.jdbc.dto.PageInfo;

import tje.DTO.Files;

public interface FilesService {

	public int insert(Files file);
	
	public Files select(int no);
	
	public int delete(int no);
	
	public PageInfo<Files> page(int pageNo, int size);
}
