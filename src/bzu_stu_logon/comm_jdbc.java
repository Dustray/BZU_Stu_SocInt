package bzu_stu_logon;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import bzu_stu_entity.commInfo;

public class comm_jdbc {
	

	//��ȡȫ��commend
	public List<commInfo> getAllComms(commInfo con){
		List<commInfo> list = new ArrayList<commInfo>();
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
			String sql="select * from commInfo where newsID = ? order by commTime asc";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, con.getNewsID());
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				commInfo cm = new commInfo(0,sql, sql, sql);
				cm.setCommuserName(rs.getString("commuserName"));
				cm.setCommBody(rs.getString("commBody"));
				cm.setCommTime(rs.getString("commTime"));
				list.add(cm);
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
	//���commend
	public int writeComms(commInfo con){
		int temp=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
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
			String sql="insert into commInfo(newsID,commuserName,commBody,commTime) values(?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,con.getNewsID());
			pstmt.setString(2,con.getCommuserName());
			pstmt.setString(3, con.getCommBody());
			pstmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
	
			temp=pstmt.executeUpdate();
			
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
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return temp;
		
	}

}
