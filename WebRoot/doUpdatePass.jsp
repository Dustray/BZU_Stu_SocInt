<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
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
    
    <title>My JSP 'doLogon.jsp' starting page</title>
    
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
  
  
  String username=(String)session.getAttribute("rememName");
  String userpass=request.getParameter("pass1");
  
  userInfo ui = new userInfo();
  ui.setUsername(username);
  ui.setUserpass(userpass);

  
  getUserInfo_jdbc gj=new getUserInfo_jdbc();
  if(gj.updateUserPass(ui)>0){
          response.sendRedirect("ownPage.jsp");

  }else{
          request.getRequestDispatcher("updatePass.jsp?errorInfo=ÃÜÂëÉèÖÃÊ§°Ü£¡").forward(request,response);
  }
 %>
  </body>
</html>
