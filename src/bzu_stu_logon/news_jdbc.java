package bzu_stu_logon;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import bzu_stu_entity.newsInfo;

public class news_jdbc {
	//获取全部news
	public List<newsInfo> getAllNews(){
		List<newsInfo> list = new ArrayList<newsInfo>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		//1.注册驱动，加载驱动包
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("找不到驱动");
			e.printStackTrace();
		}
		
		try {//2.获取数据库连接
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bzu_stu_pub", "root", "123456");
			//3.获取Statement对象，执行sql语句
			String sql="select * from newsInfo order by newsTime desc";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				newsInfo ne = new newsInfo();
				ne.setNewsID(rs.getInt("newsID"));
				ne.setUserName(rs.getString("userName"));
				ne.setNewsBody(rs.getString("newsBody"));
				ne.setNewsTime(rs.getString("newsTime"));
				ne.setNewsGood(rs.getInt("newsGood"));
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
	//获取登陆用户news
	public List<newsInfo> getMyNews(String name){
		List<newsInfo> list = new ArrayList<newsInfo>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		//1.注册驱动，加载驱动包
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("找不到驱动");
			e.printStackTrace();
		}
		
		try {//2.获取数据库连接
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bzu_stu_pub", "root", "123456");
			//3.获取Statement对象，执行sql语句
			String sql="select * from newsInfo where userName=? order by newsTime desc";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,name);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				newsInfo ne = new newsInfo();
				ne.setNewsID(rs.getInt("newsID"));
				ne.setUserName(rs.getString("userName"));
				ne.setNewsBody(rs.getString("newsBody"));
				ne.setNewsTime(rs.getString("newsTime"));
				ne.setNewsGood(rs.getInt("newsGood"));
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
	//添加news
	public int writeNews(newsInfo nin){
		int temp=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		//1.注册驱动，加载驱动包
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("找不到驱动");
			e.printStackTrace();
		}
		
		try {//2.获取数据库连接
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bzu_stu_pub", "root", "123456");
			//3.获取Statement对象，执行sql语句
			String sql="insert into newsInfo(userName,NewsBody,newsTime) values(?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,nin.getUserName());
			pstmt.setString(2,nin.getNewsBody());
			pstmt.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
	
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
	//删除news
	public int deleteNews(String newsID){
		int temp=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		//1.注册驱动，加载驱动包
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("找不到驱动");
			e.printStackTrace();
		}
		
		try {//2.获取数据库连接
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bzu_stu_pub", "root", "123456");
			//3.获取Statement对象，执行sql语句
			String sql="delete from newsInfo where newsID=? ";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,newsID);
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
