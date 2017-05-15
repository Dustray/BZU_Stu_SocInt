package bzu_stu_logon;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bzu_stu_entity.userInfo;

public class getOtherInfo_jdbc {
	//��������û�����
	public List<userInfo> getOtherInfomation(String othersName){
		List<userInfo> list = new ArrayList<userInfo>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		//1.ע������������������
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("�Ҳ�������");
			e.printStackTrace();
		}
		
		try {//2.��ȡ���ݿ�����
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bzu_stu_pub", "root", "123456");
			//3.��ȡStatement����ִ��sql���
			String sql="select * from userInfo where userName=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,othersName);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				userInfo ne = new userInfo();
				ne.setUsersige(rs.getString("userSige"));
				ne.setUserage(rs.getInt("userAge"));
				ne.setUsersex(rs.getString("userSex"));
				ne.setUserqq(rs.getInt("userQQ"));
				ne.setUseraddress(rs.getString("userAdd"));
				ne.setUseremail(rs.getString("userEmail"));
				ne.setUserinteg(rs.getInt("userInteg"));
				ne.setUserlevel(rs.getInt("userLevel"));
				list.add(ne);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(pstmt!=null){
					pstmt.close();
				}
				if(conn!=null){
					conn.close();
				}if(rs!=null)
				{
					rs.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return list;
		
	}

}
