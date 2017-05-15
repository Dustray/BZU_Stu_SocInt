package bzu_stu_logon;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bzu_stu_entity.userInfo;
import bzu_stu_other.levelUpdate;

public class getUserInfo_jdbc {

	//�������
	public List<userInfo> getUserInfomation(userInfo nin){
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
			pstmt.setString(1,nin.getUsername());
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
	//��֤�Ƿ�����û���
	public boolean getUserName(String name){
		boolean flag=false;
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
			String sql="select * from userInfo where userName=? ";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,name);
			rs=pstmt.executeQuery();
			if(rs.next()){
				flag=true;
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
		
		return flag;
		
	}
	//�޸�����
	public int updateUserInfomation(userInfo ui){
		int flag=0;
		Connection conn = null;
		PreparedStatement pstmt=null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("�Ҳ�������");
			e.printStackTrace();
		}
		
		

		try {//2.��ȡ���ݿ�����
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bzu_stu_pub", "root", "123456");
			//3.��ȡStatement����ִ��sql���
			String sql="update userInfo set userSige=? , userAge=? , userSex=? , userQQ=? , userAdd=? , userEmail=? where userName=? ";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,ui.getUsersige());
			pstmt.setInt(2,ui.getUserage());
			pstmt.setString(3,ui.getUsersex());
			pstmt.setInt(4,ui.getUserqq());
			pstmt.setString(5,ui.getUseraddress());
			pstmt.setString(6,ui.getUseremail());
			pstmt.setString(7,ui.getUsername());
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
	//�޸�����
	public int updateUserPass(userInfo ui){
		int flag=0;
		Connection conn = null;
		PreparedStatement pstmt=null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("�Ҳ�������");
			e.printStackTrace();
		}
		
		

		try {//2.��ȡ���ݿ�����
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bzu_stu_pub", "root", "123456");
			//3.��ȡStatement����ִ��sql���
			String sql="update userInfo set userPass=? where userName=? ";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,ui.getUserpass());
			pstmt.setString(2,ui.getUsername());
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
	//��ѯ����ֵ
	public int getUserInteg(String name){
		int integ = 0;
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
			String sql="select userInteg from userInfo where userName=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,name);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				integ = rs.getInt("userInteg");
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
		
		return integ;
		
	}
	
	//���Ӿ���ֵ
	public int updateUserIntegAndLevel(String name,int integ){
		levelUpdate lu=new levelUpdate();
		int level=lu.updateLevel(integ);
		
		int flag=0;
		Connection conn = null;
		PreparedStatement pstmt=null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("�Ҳ�������");
			e.printStackTrace();
		}
		
		

		try {//2.��ȡ���ݿ�����
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bzu_stu_pub", "root", "123456");
			//3.��ȡStatement����ִ��sql���
			String sql="update userInfo set userInteg = userInteg+8, userLevel =? where userName=? ";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,level);
			pstmt.setString(2,name);
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
	/*
	//��ѯ�ȼ�
	public int getUserLevel(String name){
		int level = 0;
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("�Ҳ�������");
			e.printStackTrace();
		}
		
		try {//2.��ȡ���ݿ�����
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bzu_stu_pub", "root", "123456");
			//3.��ȡStatement����ִ��sql���
			String sql="select userLevel from userInfo where userName=? ";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,name);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				level = rs.getInt("userIlevel");
			}
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
			
			
		return level;
	}
	//����
	public int updateUserLevel(String name,int integ){
		levelUpdate lu=new levelUpdate();
		
		int level=lu.updateLevel(integ);
		int flag=0;
		Connection conn = null;
		PreparedStatement pstmt=null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("�Ҳ�������");
			e.printStackTrace();
		}
		
		

		try {//2.��ȡ���ݿ�����
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bzu_stu_pub", "root", "123456");
			//3.��ȡStatement����ִ��sql���
			String sql="update userInfo set userLevel =? where userName=? ";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,level);
			pstmt.setString(2,name);
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
	*/
	
}

