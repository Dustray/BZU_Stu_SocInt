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
    if((session.getAttribute("rememName") == null&&session.getAttribute("rememAdminName") == null)||(session.getAttribute("rememName") != null&&session.getAttribute("rememAdminName") != null))
    {
    	response.sendRedirect("login.jsp");
    	return;
    }
    if(session.getAttribute("rememName") != null)//ÆÕÍ¨ÓÃ»§É¾³ý
    {
		String userName = (String)session.getAttribute("rememName");
		String newsID=request.getParameter("newsID");
		
	
	  	news_jdbc nj=new news_jdbc();
	  	if(nj.deleteNews(newsID)>0){
	          response.sendRedirect("ownPage.jsp");
	  	}else{
	          request.getRequestDispatcher("error.jsp?errorInfo=É¾³ýÊ§°Ü£¡").forward(request,response);
	  	}
  	}
  	if(session.getAttribute("rememAdminName") != null)//¹ÜÀíÔ±É¾³ý
    {
		String userName = (String)session.getAttribute("rememAdminName");
		String newsID=request.getParameter("newsID");
		
	
	  	news_jdbc nj=new news_jdbc();
	  	if(nj.deleteNews(newsID)>0){
	          response.sendRedirect("oAdminPage.jsp");
	  	}else{
	          request.getRequestDispatcher("error.jsp?errorInfo=É¾³ýÊ§°Ü£¡").forward(request,response);
	  	}
  	}
	
	 %>
  </body>
</html>
