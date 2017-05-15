package bzu_stu_entity;

public class commInfo {
	private int newsID;
	private String commuserName;
	private String commBody;
	private String commTime;
	public commInfo( int newsID, String commuserName, String commBody, String commTime) {
		super();
		this.newsID = newsID;
		this.commuserName = commuserName;
		this.commBody = commBody;
		this.commTime = commTime;
	}
	public commInfo(){}
	
	public int getNewsID() {
		return newsID;
	}
	public void setNewsID(int newsID) {
		this.newsID = newsID;
	}
	public String getCommuserName() {
		return commuserName;
	}
	public void setCommuserName(String commuserName) {
		this.commuserName = commuserName;
	}
	public String getCommBody() {
		return commBody;
	}
	public void setCommBody(String commBody) {
		this.commBody = commBody;
	}
	public String getCommTime() {
		return commTime;
	}
	public void setCommTime(String commTime) {
		this.commTime = commTime;
	}
	

}
