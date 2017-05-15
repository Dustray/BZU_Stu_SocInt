<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import = "bzu_stu_logon.adminAbout_jdbc" %>
<%@page import = "bzu_stu_entity.adminInfo" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'doUpdate.jsp' starting page</title>
    
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
	if(session.getAttribute("rememAdminName") == null)
    {
    	response.sendRedirect("login.jsp");
    	return;
    } 
   %>
  <%
  request.setCharacterEncoding("gbk");
  
 // String username=(String)session.getAttribute("rememName");

  String adminAnno;
  if(request.getParameter("adminAnno")!="null")
  {
  	adminAnno=" ";
  }
  adminAnno=request.getParameter("adminAnno");
  adminAbout_jdbc ai=new adminAbout_jdbc();
  if(ai.updateAdminAnno(adminAnno)>0){
          response.sendRedirect("oAdminPage.jsp");

  }else{
          request.getRequestDispatcher("error.jsp?errorInfo=¹ã²¥Ê§°Ü!").forward(request,response);
  }
 %>
  </body>
</html>
