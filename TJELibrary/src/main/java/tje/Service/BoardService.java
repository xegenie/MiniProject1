package tje.Service;

import java.util.List;

import tje.DTO.Board;
import tje.DTO.Comments;

public interface BoardService {
	
	List<Board> list();
	
	public Board select(int boardID); 
	public int insert(Board board); 
	public int delete(int boardID); 
	public int update(Board board);
	
	public Comments select(String commentID);
	public Comments insert(Comments comments);
}
