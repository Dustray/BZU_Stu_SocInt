package bzu_stu_entity;

public class userInfo 
{
	private String username;
	private String usersige;
	private int userage;
	private String usersex;
	private int userqq;
	private String useraddress;
	private String useremail;
	private int userinteg;
	private int userlevel;
	private String userpass;
	 

	public userInfo(){}


	public userInfo(String username, String usersige, int userage,
			String usersex, int userqq, String useraddress, String useremail,
			int userinteg, int userlevel, String userpass) {
		super();
		this.username = username;
		this.usersige = usersige;
		this.userage = userage;
		this.usersex = usersex;
		this.userqq = userqq;
		this.useraddress = useraddress;
		this.useremail = useremail;
		this.userinteg = userinteg;
		this.userlevel = userlevel;
		this.userpass = userpass;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getUsersige() {
		return usersige;
	}


	public void setUsersige(String usersige) {
		this.usersige = usersige;
	}


	public int getUserage() {
		return userage;
	}


	public void setUserage(int userage) {
		this.userage = userage;
	}


	public String getUsersex() {
		return usersex;
	}


	public void setUsersex(String usersex) {
		this.usersex = usersex;
	}


	public int getUserqq() {
		return userqq;
	}


	public void setUserqq(int userqq) {
		this.userqq = userqq;
	}


	public String getUseraddress() {
		return useraddress;
	}


	public void setUseraddress(String useraddress) {
		this.useraddress = useraddress;
	}


	public String getUseremail() {
		return useremail;
	}


	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}


	public int getUserinteg() {
		return userinteg;
	}


	public void setUserinteg(int userinteg) {
		this.userinteg = userinteg;
	}


	public int getUserlevel() {
		return userlevel;
	}


	public void setUserlevel(int userlevel) {
		this.userlevel = userlevel;
	}


	public String getUserpass() {
		return userpass;
	}


	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}



	
}
