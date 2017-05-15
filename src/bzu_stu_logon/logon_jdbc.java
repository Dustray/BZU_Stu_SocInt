package bzu_stu_logon;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import bzu_stu_entity.userInfo;


public class logon_jdbc {
	//-------------------------------------------------------------------------------------------------------------------------------------------------
	public int logonUserInformation(userInfo ui){
		int flag=0;
		Connection conn = null;
		PreparedStatement pstmt=null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("找不到驱动");
			e.printStackTrace();
		}
		
		

		try {//2.获取数据库连接
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bzu_stu_pub", "root", "123456");
			//3.获取Statement对象，执行sql语句
			String sql="insert into userInfo (userName,userAge,userSex,userAdd,userEmail,userPass) values (?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, ui.getUsername());
			pstmt.setInt(2, ui.getUserage());
			pstmt.setString(3, ui.getUsersex());
			pstmt.setString(4, ui.getUseraddress());
			pstmt.setString(5, ui.getUseremail());
			pstmt.setString(6, ui.getUserpass());
			flag=pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(pstmt!=null)
				{
					pstmt.close();
				}
				if(conn!=null)
				{
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
			
			
		return flag;
	}

}