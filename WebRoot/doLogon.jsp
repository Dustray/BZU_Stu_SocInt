<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import = "bzu_stu_logon.logon_jdbc" %>
<%@page import = "bzu_stu_entity.userInfo" %>
<%@page import = "bzu_stu_logon.getUserInfo_jdbc" %>
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
  String username=request.getParameter("username");
  if(username==null)
  {
  	response.sendRedirect("logon.jsp");
  	return;
  }
  getUserInfo_jdbc lj=new getUserInfo_jdbc();
  if(lj.getUserName(username)==true)
  {
  	request.getRequestDispatcher("logon.jsp?errorInfo=已存在此用户名，请更换。").forward(request,response);
  	return;
  }
  
  int userage=Integer.parseInt(request.getParameter("userage"));
  String usersex=request.getParameter("usersex");
  String useradd=request.getParameter("useradd");
  String useremail=request.getParameter("useremail");
  String userpass=request.getParameter("pass1");
  
  userInfo ui = new userInfo();
  ui.setUsername(username);
  ui.setUserage(userage);
  ui.setUsersex(usersex);
  ui.setUseraddress(useradd);
  ui.setUseremail(useremail);
  ui.setUserpass(userpass);

  
  logon_jdbc ud=new logon_jdbc();
  if(ud.logonUserInformation(ui)>0){
  	      session.setAttribute("rememName", username);
          response.sendRedirect("index.jsp");

  }else{
          request.getRequestDispatcher("logon.jsp?errorInfo=注册失败，请稍后再试。").forward(request,response);
  }
 %>
  </body>
</html>















