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
	if(session.getAttribute("rememName") == null)
    {
    	response.sendRedirect("login.jsp");
    	return;
    } 
   %>
  <%
  request.setCharacterEncoding("gbk");
  
  String username=(String)session.getAttribute("rememName");
  String usersige;
  if(request.getParameter("userSige")!="null")
  {
  	usersige=request.getParameter("userSige");
  }else{
  	usersige="";
  }
  int userage=Integer.parseInt(request.getParameter("userAge"));
  String usersex=request.getParameter("userSex");
  int userqq=Integer.parseInt(request.getParameter("userQQ"));
  String useradd;
  if(request.getParameter("userAdd")!="null")
  {
  	useradd=request.getParameter("userAdd");
  }else{
  	useradd="";
  }
  String useremail=request.getParameter("userEmail");
  //String userpass=request.getParameter("pass1");
  
  userInfo ui = new userInfo();
  ui.setUsername(username);
  ui.setUsersige(usersige);
  ui.setUserage(userage);
  ui.setUsersex(usersex);
  ui.setUserqq(userqq);
  ui.setUseraddress(useradd);
  ui.setUseremail(useremail);
  //ui.setUserpass(userpass);

  
  getUserInfo_jdbc gj=new getUserInfo_jdbc();
  if(gj.updateUserInfomation(ui)>0){
          response.sendRedirect("ownPage.jsp");

  }else{
          request.getRequestDispatcher("error.jsp?errorInfo=ÉèÖÃÊ§°Ü!").forward(request,response);
  }
 %>
  </body>
</html>
