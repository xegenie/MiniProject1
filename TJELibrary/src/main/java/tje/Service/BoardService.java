package tje.Service;

import tje.DTO.Board;
import tje.DTO.Comments;

public interface BoardService {
	
	public Board select(int boardID); 
	public Board insert(Board board); 
	public Board delete(int boardID); 
	public Board update(Board board);
	
	public Comments select(String commentID);
	public Comments insert(Comments comments);
}
