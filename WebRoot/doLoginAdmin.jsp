<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import = "bzu_stu_logon.login_jdbc" %>
<%@page import = "bzu_stu_entity.userInfo" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'doLogin.jsp' starting page</title>
    
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
  	String adminName=request.getParameter("adminName");
  	String adminPass=request.getParameter("adminPass");
    login_jdbc lj=new login_jdbc();
    if(lj.getAdminNameAndPass(adminName,adminPass))
    {
  		 session.setAttribute("rememAdminName", adminName);
         response.sendRedirect("oAdminPage.jsp");
    }else{
         request.getRequestDispatcher("login.jsp?errorInfo=����Ա�������").forward(request,response);
    }

   
	  

	 %>
  </body>
</html>
