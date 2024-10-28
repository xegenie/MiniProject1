package tje.Service;

import java.util.List;

import tje.DTO.Board;
import tje.DTO.Comments;

public interface BoardService {
	
	// 게시물 목록
	List<Board> list();
	// 게시글 조회
	public Board select(int boardID); 
	// 게시글 등록
	public int insert(Board board); 
	// 게시글 삭제
	public int delete(int boardID); 
	// 게시글 수정
	public int update(Board board);
	// 댓글 조회
	List<Comments> selectByBoardId(int boardID);
	// 댓글 등록
	public int insert(Comments comments);
	
	List<Board> listByType(String bType);
}
