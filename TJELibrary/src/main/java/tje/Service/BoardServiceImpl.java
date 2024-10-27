package tje.Service;

import java.util.List;

import tje.DAO.BoardDAO;
import tje.DAO.CommentDAO;
import tje.DTO.Board;
import tje.DTO.Comments;

public class BoardServiceImpl implements BoardService {
	
	private BoardDAO boardDAO = new BoardDAO();
    private CommentDAO commentDAO = new CommentDAO();

    @Override
    public List<Board> list() {
        List<Board> boardList = null;
        try {
            boardList = boardDAO.list();
        } catch (Exception e) {
            e.printStackTrace();  // 예외 처리
        }
        return boardList;
    }

    @Override
    public Board select(int boardID) {
    	System.out.println(boardID);
        Board board = null;
        try {
            board = boardDAO.select(boardID);
            System.out.println(board);
        } catch (Exception e) {
            e.printStackTrace();  // 예외 처리
        }
        return board;
    }

    @Override
    public int insert(Board board) {
        int result = 0;
        try {
            result = boardDAO.insert(board);
            if(result > 0) System.out.println("게시글 등록 성공!");
        } catch (Exception e) {
        	System.err.println("게시글 등록 실패!");
            e.printStackTrace();  // 예외 처리
        }
        return result;
    }

    @Override
    public int delete(int boardID) {
        int result = 0;
        try {
            result = boardDAO.delete(boardID);
            if(result > 0) System.out.println("게시글 삭제 성공!");
        } catch (Exception e) {
        	System.err.println("게시글 삭제 실패!");
            e.printStackTrace();  // 예외 처리
        }
        return result;
    }

    @Override
    public int update(Board board) {
        int result = 0;
        try {
            result = boardDAO.update(board);
            if(result > 0) System.out.println("게시글 수정 성공!");
        } catch (Exception e) {
        	System.err.println("게시글 수정 실패!");
            e.printStackTrace();  // 예외 처리
        }
        return result;
    }

    @Override
    public int insert(Comments comments) {
    	int result = 0;
    	try {
			result = commentDAO.insert(comments);
			if(result > 0) System.out.println("댓글 등록 성공!");
		} catch (Exception e) {
			System.err.println("댓글 등록 실패!");
			e.printStackTrace();
		}
        return result;
    }

	@Override
	public List<Comments> selectByBoardId(int boardID) {
		List<Comments> commentsList = null;
        try {
        	commentsList = commentDAO.list();
        } catch (Exception e) {
            e.printStackTrace();  // 예외 처리
        }
        return commentsList;
	}
	
	@Override
    public List<Board> listByType(String bType) {
        List<Board> boardList = null;
        try {
            boardList = boardDAO.selectByType(bType);
        } catch (Exception e) {
            e.printStackTrace();  // 예외 처리
        }
        return boardList;
    }
}
