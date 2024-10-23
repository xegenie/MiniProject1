package tje.Service;

import tje.DTO.Board;
import tje.DTO.Comments;

public interface BoardService {
	
	public Board select(Board board); 
	public Board insert(Board board); 
	public Board delete(Board board); 
	public Board update(Board board);
	
	public Comments select(Comments comments);
	public Comments insert(Comments comments);
}
