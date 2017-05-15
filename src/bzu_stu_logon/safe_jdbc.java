package bzu_stu_logon;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bzu_stu_entity.safeInfo;

public class safe_jdbc {
	//查看是否存在密保信息
	public boolean selectSafeLock(String userName){
		boolean flag=false;
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("找不到驱动");
			e.printStackTrace();
		}
		
		

		try {//2.获取数据库连接
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bzu_stu_pub", "root", "123456");
			//3.获取Statement对象，执行sql语句
			String sql="select * from safeInfo where userName=? ";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userName);
			rs=pstmt.executeQuery();
			if(rs.next()){
				flag=true;
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
			
			
		return flag;
	}
	//添加密保信息
	public int setSafeLock(safeInfo si){
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
			String sql="insert into safeInfo (userName,ques1,answ1,ques2,answ2,ques3,answ3) values (?,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, si.getUserName());
			pstmt.setString(2, si.getQues1());
			pstmt.setString(3, si.getAnsw1());
			pstmt.setString(4, si.getQues2());
			pstmt.setString(5, si.getAnsw2());
			pstmt.setString(6, si.getQues3());
			pstmt.setString(7, si.getAnsw3());
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
	//获取密保信息
	public List<safeInfo> getSafeLock(String name){
		List<safeInfo> list = new ArrayList<safeInfo>();
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
			String sql="select * from safeInfo where userName=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,name);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				safeInfo si = new safeInfo();
				si.setQues1(rs.getString("ques1"));
				si.setQues2(rs.getString("ques2"));
				si.setQues3(rs.getString("ques3"));
				si.setAnsw1(rs.getString("answ1"));
				si.setAnsw2(rs.getString("answ2"));
				si.setAnsw3(rs.getString("answ3"));
				list.add(si);
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
	//验证密保信息
	public boolean checkSafeLock(safeInfo si){
		boolean flag=false;
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("找不到驱动");
			e.printStackTrace();
		}
		
		

		try {//2.获取数据库连接
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bzu_stu_pub", "root", "123456");
			//3.获取Statement对象，执行sql语句
			String sql="select * from safeInfo where userName=? and ques1=? and ques2=? and ques3=? and answ1=? and answ2=? and answ3=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, si.getUserName());
			pstmt.setString(2, si.getQues1());
			pstmt.setString(3, si.getQues2());
			pstmt.setString(4, si.getQues3());
			pstmt.setString(5, si.getAnsw1());
			pstmt.setString(6, si.getAnsw2());
			pstmt.setString(7, si.getAnsw3());
			rs=pstmt.executeQuery();
			if(rs.next()){
				flag=true;
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
			
			
		return flag;
	}
	//修改密保信息
	public int updateSafeLock(safeInfo si){
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
			String sql="update safeInfo set ques1=?,answ1=?,ques2=?,answ2=?,ques3=?,answ3=? where userName=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, si.getQues1());
			pstmt.setString(2, si.getAnsw1());
			pstmt.setString(3, si.getQues2());
			pstmt.setString(4, si.getAnsw2());
			pstmt.setString(5, si.getQues3());
			pstmt.setString(6, si.getAnsw3());
			pstmt.setString(7, si.getUserName());
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
