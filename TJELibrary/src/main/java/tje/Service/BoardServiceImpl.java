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
        Board board = null;
        try {
            board = boardDAO.select(boardID);
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
        } catch (Exception e) {
            e.printStackTrace();  // 예외 처리
        }
        return result;
    }

    @Override
    public int delete(int boardID) {
        int result = 0;
        try {
            result = boardDAO.delete(boardID);
        } catch (Exception e) {
            e.printStackTrace();  // 예외 처리
        }
        return result;
    }

    @Override
    public int update(Board board) {
        int result = 0;
        try {
            result = boardDAO.update(board);
        } catch (Exception e) {
            e.printStackTrace();  // 예외 처리
        }
        return result;
    }

    @Override
    public Comments select(String commentID) {
    	Comments comments = null;
    	try {
			
		} catch (Exception e) {
			// TODO: handle exception
		}
        return comments;
    }

    @Override
    public int insert(Comments comments) {
        return commentDAO.insert(comments);
    }
}
