package kr.co.mlec.VO;

public class AccountVO {
	private String username;
	private String password;
	private String createdDate;
	private String role;
	private String isDeleted;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(String isDeleted) {
		this.isDeleted = isDeleted;
	}

	@Override
	public String toString() {
		return "AccountVO [username=" + username + ", password=" + password + ", createdDate=" + createdDate + ", role="
				+ role + ", isDeleted=" + isDeleted + "]";
	}
}
