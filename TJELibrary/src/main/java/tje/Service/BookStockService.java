package tje.Service;

import tje.DTO.BookStock;

public interface BookStockService {
	
	public BookStock select(int id);
	
	public int insert(BookStock bookstock);

}
