<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import = "bzu_stu_logon.comm_jdbc" %>
<%@page import = "bzu_stu_entity.commInfo" %>
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
    
    <title>My JSP 'doComm.jsp' starting page</title>
    
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
	    if(request.getParameter("commBody") == "")
	    {
	    	response.sendRedirect("index.jsp");
	    }
    if(session.getAttribute("rememName") != null)//普通用户评论
    {
	    int newsID=Integer.parseInt(request.getParameter("getNewsUser"));
	    String commuserName=(String)session.getAttribute("rememName");
	  	String commBody=request.getParameter("commBody");
	  	
	  	commInfo ci = new commInfo();
	  	ci.setNewsID(newsID);
	  	ci.setCommuserName(commuserName);
	  	ci.setCommBody(commBody);
	  	
	  	getUserInfo_jdbc gu = new getUserInfo_jdbc();
		int userInteg = gu.getUserInteg(commuserName);
	  	
	  
	  	comm_jdbc cj=new comm_jdbc();
	  	if(cj.writeComms(ci)>0)
	  	{
	  		if(gu.updateUserIntegAndLevel(commuserName,userInteg)<=0)
	  		{ 
	  			request.getRequestDispatcher("error.jsp?errorInfo=写入失败！（无经验值增加）").forward(request,response);
	  			return;
	  		}
	          response.sendRedirect("index.jsp");
	 	 }else{
	          request.getRequestDispatcher("error.jsp?errorInfo=评论失败！").forward(request,response);
	          return;
	 	 }
  	}
  	if(session.getAttribute("rememAdminName") != null)//管理员评论
 	{
  		int newsID=Integer.parseInt(request.getParameter("getNewsUser"));
	    String commuserName=(String)session.getAttribute("rememAdminName");
	  	String commBody="（管理员）"+request.getParameter("commBody");
	  	
	  	commInfo ci = new commInfo();
	  	ci.setNewsID(newsID);
	  	ci.setCommuserName(commuserName);
	  	ci.setCommBody(commBody);
	  	
	  
	  	comm_jdbc cj=new comm_jdbc();
	  	if(cj.writeComms(ci)>0)
	  	{
	          response.sendRedirect("oAdminPage.jsp");
	          return;
	 	 }else{
	          request.getRequestDispatcher("error.jsp?errorInfo=评论失败！").forward(request,response);
	          return;
	 	 }
  	}
  
  
  
  

  %>
  </body>
</html>
