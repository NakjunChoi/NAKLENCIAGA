package comment;

public class Comment {
	private int boardID;
	private String commentWritter;
	private String content;
	public int getBoardID() {
		return boardID;
	}
	public void setBoardID(int boardID) {
		this.boardID = boardID;
	}
	public String getCommentWritter() {
		return commentWritter;
	}
	public void setCommentWritter(String commentWritter) {
		this.commentWritter = commentWritter;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
