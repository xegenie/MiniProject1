package tje.Service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
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
        String sql = "INSERT INTO board (title, content, reg_date, upd_date, b_type) VALUES (?, ?, ?, ?, ?)";
        int result = 0;

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getContent());
            pstmt.setTimestamp(3, new java.sql.Timestamp(new Date().getTime())); // 등록일자
            pstmt.setTimestamp(4, new java.sql.Timestamp(new Date().getTime())); // 수정일자
            pstmt.setString(5, board.getBType()); // bType 추가

            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // 에러 출력
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
        String sql = "UPDATE board SET title = ?, content = ?, upd_date = ? WHERE board_id = ?";
        int result = 0;

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getContent());
            pstmt.setTimestamp(3, new java.sql.Timestamp(new Date().getTime())); // 수정일자 설정
            pstmt.setInt(4, board.getBoardNo()); // 여기서 ID를 설정
            
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // 에러 출력
        }

        return result;
    }

    @Override
    public int insert(Comments comment) {
        String sql = "INSERT INTO comments (board_id, content, writer, reg_date) VALUES (?, ?, ?, ?)";
        int result = 0;

        try (Connection conn = getConnection(); // DB 연결
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, comment.getBoardId());
            pstmt.setString(2, comment.getContent());
            pstmt.setString(3, comment.getWriter());
            pstmt.setTimestamp(4, new java.sql.Timestamp(comment.getRegDate().getTime())); // Timestamp 사용

            result = pstmt.executeUpdate(); // 쿼리 실행
        } catch (SQLException e) {
            e.printStackTrace(); // 에러 출력
        }

        return result; // 추가된 행 수 반환
    }
	private Connection getConnection() {
	    String url = "jdbc:mysql://192.168.30.237:3306/library?serverTimezone=Asia/Seoul&allowPublicKeyRetrieval=true&useSSL=false"; // 데이터베이스 URL
	    String user = "library"; // 사용자명
	    String password = "123456"; // 비밀번호

	    Connection conn = null;
	    try {
	        conn = DriverManager.getConnection(url, user, password);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return conn;
	}

	@Override
	public List<Comments> selectByBoardId(int boardID) {
	    List<Comments> comments = new ArrayList<>();
	    String sql = "SELECT * FROM comments WHERE board_id = ?"; // 게시글 ID로 필터링

	    try (Connection conn = getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {

	        pstmt.setInt(1, boardID);
	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {
	            Comments comment = new Comments();
	            comment.setBoardId(boardID);
	            comment.setCommentId(boardID);
	            comment.setContent(rs.getString("content"));
	            comment.setWriter(rs.getString("writer"));
	            comment.setRegDate(rs.getTimestamp("reg_date"));
	            comments.add(comment);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return comments;
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
