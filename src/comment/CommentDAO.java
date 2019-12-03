package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class CommentDAO {
	private Connection conn;
	private ResultSet rs;
	
	public CommentDAO() {
		
		try {
			String dbURL = "jdbc:mysql://localhost:3306/NJSHOP?serverTimezone=UTC";
			String dbID="root";
			String dbPassword="root";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection(dbURL,dbID,dbPassword);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int doComment(Comment comment) {
		String SQL = "INSERT INTO COMMENT VALUES (?, ?, ?)";
		try {
			PreparedStatement pstmt;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, comment.getBoardID());
			pstmt.setString(2, comment.getCommentWritter());
			pstmt.setString(3, comment.getContent());
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public ArrayList<Comment> getList(int boardID){
		String SQL = "SELECT * FROM COMMENT";
		ArrayList<Comment> list = new ArrayList<Comment>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Comment comment = new Comment();
				comment.setBoardID(rs.getInt(1));
				if(boardID != comment.getBoardID()) continue;
				comment.setCommentWritter(rs.getString(2));
				comment.setContent(rs.getString(3));
				list.add(comment);
			}
		}	catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	
}
