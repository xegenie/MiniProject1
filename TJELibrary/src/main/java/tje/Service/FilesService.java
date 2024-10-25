package tje.Service;

import tje.DTO.Files;

public interface FilesService {

	public int insert(Files file);
	
	public Files select(int no);
	
	public int delete(int no);
}
