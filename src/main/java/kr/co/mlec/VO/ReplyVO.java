package kr.co.mlec.VO;

public class ReplyVO {
	private int rId;
	private int cId;
	private String user;
	private String content;
	private String createdDate;
	private String updatedDate;
	private String isDeleted;

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
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

	@Override
	public String toString() {
		return "ReplyVO [rId=" + rId + ", cId=" + cId + ", user=" + user + ", content=" + content + ", createdDate="
				+ createdDate + ", updatedDate=" + updatedDate + ", isDeleted=" + isDeleted + "]";
	}
}
