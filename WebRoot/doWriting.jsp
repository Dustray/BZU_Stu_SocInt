<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import = "bzu_stu_logon.news_jdbc" %>
<%@page import = "bzu_stu_entity.newsInfo" %>
<%@page import = "bzu_stu_logon.getUserInfo_jdbc" %>
<%@page import = "bzu_stu_entity.userInfo" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'doWriting.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
	<%
	request.setCharacterEncoding("gbk");
	if(session.getAttribute("rememName") == null)
    {
    	response.sendRedirect("login.jsp");
    	return;
    }
	String userName = (String)session.getAttribute("rememName");
	String newsBody = request.getParameter("textfield");
	//String newsTime = request.getParameter("newsTime");
	newsInfo ni = new newsInfo();
	ni.setUserName(userName);
	ni.setNewsBody(newsBody);
	
	//ni.setNewsTime(newsTime);
	getUserInfo_jdbc gu = new getUserInfo_jdbc();
	int userInteg = gu.getUserInteg(userName);
  	news_jdbc nj=new news_jdbc();
  	if(nj.writeNews(ni)>0){
  		if(gu.updateUserIntegAndLevel(userName,userInteg)<=0)
  		{ 
  			request.getRequestDispatcher("error.jsp?errorInfo=写入失败！（无经验值增加）").forward(request,response);
  		}
  		
          response.sendRedirect("index.jsp");

  	}else{
          request.getRequestDispatcher("error.jsp?errorInfo=写入失败！").forward(request,response);
  	}
	
	 %>
  </body>
</html>
