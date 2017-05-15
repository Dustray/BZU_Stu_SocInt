package bzu_stu_entity;

public class adminInfo {
	private int adminID;
	private String adminName;
	private String adminRealName;
	private String adminPass;
	private String adminAnno;
	public adminInfo(int adminID, String adminName, String adminRealName,
			String adminPass, String adminAnno) {
		super();
		this.adminID = adminID;
		this.adminName = adminName;
		this.adminRealName = adminRealName;
		this.adminPass = adminPass;
		this.adminAnno = adminAnno;
	}
	public adminInfo(){}
	public int getAdminID() {
		return adminID;
	}
	public void setAdminID(int adminID) {
		this.adminID = adminID;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getAdminRealName() {
		return adminRealName;
	}
	public void setAdminRealName(String adminRealName) {
		this.adminRealName = adminRealName;
	}
	public String getAdminPass() {
		return adminPass;
	}
	public void setAdminPass(String adminPass) {
		this.adminPass = adminPass;
	}
	public String getAdminAnno() {
		return adminAnno;
	}
	public void setAdminAnno(String adminAnno) {
		this.adminAnno = adminAnno;
	}

}
