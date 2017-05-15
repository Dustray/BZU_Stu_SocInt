package bzu_stu_entity;

public class safeInfo {
	private String userName;
	private String ques1;
	private String answ1;
	private String ques2;
	private String answ2;
	private String ques3;
	private String answ3;
	public safeInfo(String userName, String ques1, String answ1, String ques2,
			String answ2, String ques3, String answ3) {
		super();
		this.userName = userName;
		this.ques1 = ques1;
		this.answ1 = answ1;
		this.ques2 = ques2;
		this.answ2 = answ2;
		this.ques3 = ques3;
		this.answ3 = answ3;
	}
	public safeInfo(){}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getQues1() {
		return ques1;
	}
	public void setQues1(String ques1) {
		this.ques1 = ques1;
	}
	public String getAnsw1() {
		return answ1;
	}
	public void setAnsw1(String answ1) {
		this.answ1 = answ1;
	}
	public String getQues2() {
		return ques2;
	}
	public void setQues2(String ques2) {
		this.ques2 = ques2;
	}
	public String getAnsw2() {
		return answ2;
	}
	public void setAnsw2(String answ2) {
		this.answ2 = answ2;
	}
	public String getQues3() {
		return ques3;
	}
	public void setQues3(String ques3) {
		this.ques3 = ques3;
	}
	public String getAnsw3() {
		return answ3;
	}
	public void setAnsw3(String answ3) {
		this.answ3 = answ3;
	}

}
