package bzu_stu_entity;


public class newsInfo {
	private int newsID;
	private String userName;
	private String newsBody;
	private String newsTime;
	private int newsGood;
	
	public newsInfo(int newsID, String userName, String newsBody, String newsTime, int newsGood) {
		super();
		this.newsID = newsID;
		this.userName = userName;
		this.newsBody = newsBody;
		this.newsTime = newsTime;
		this.newsGood = newsGood;
	}
	
	public int getNewsID() {
		return newsID;
	}
	public void setNewsID(int newsID) {
		this.newsID = newsID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getNewsBody() {
		return newsBody;
	}
	public void setNewsBody(String newsBody) {
		this.newsBody = newsBody;
	}
	public String getNewsTime() {
		return newsTime;
	}
	public void setNewsTime(String newsTime) {
		this.newsTime = newsTime;
	}
	
	public int getNewsGood() {
		return newsGood;
	}

	public void setNewsGood(int newsGood) {
		this.newsGood = newsGood;
	}

	public newsInfo(){}
	
}
