package kr.co.mlec.VO;

public class CommentVO {
	private int cId;
	private int bId;
	private int pId;
	private String user;
	private String content;
	private String createdDate;
	private String updatedDate;
	private String isDeleted;
	private int repNum;
	
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public String getUpdatedDate() {
		return updatedDate;
	}
	public void setUpdatedDate(String updatedDate) {
		this.updatedDate = updatedDate;
	}
	public String getIsDeleted() {
		return isDeleted;
	}
	public void setIsDeleted(String isDeleted) {
		this.isDeleted = isDeleted;
	}
	public int getRepNum() {
		return repNum;
	}
	public void setRepNum(int repNum) {
		this.repNum = repNum;
	}
	@Override
	public String toString() {
		return "CommentVO [cId=" + cId + ", bId=" + bId + ", pId=" + pId + ", user=" + user + ", content=" + content
				+ ", createdDate=" + createdDate + ", updatedDate=" + updatedDate + ", isDeleted=" + isDeleted
				+ ", repNum=" + repNum + "]";
	}

	
}
