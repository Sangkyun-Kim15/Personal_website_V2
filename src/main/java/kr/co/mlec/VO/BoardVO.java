package kr.co.mlec.VO;

public class BoardVO {
	private int boardNo;
	private String writer;
	private String title;
	private String content;
	private String regDate;
	private String isDeleted;
	private int cmtNum;

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(String isDeleted) {
		this.isDeleted = isDeleted;
	}

	public int getCmtNum() {
		return cmtNum;
	}

	public void setCmtNum(int cmtNum) {
		this.cmtNum = cmtNum;
	}

	@Override
	public String toString() {
		return "BoardVO [boardNo=" + boardNo + ", writer=" + writer + ", title=" + title + ", content=" + content
				+ ", regDate=" + regDate + ", isDeleted=" + isDeleted + ", cmtNum=" + cmtNum + "]";
	}
}
