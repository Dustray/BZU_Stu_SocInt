<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import = "bzu_stu_logon.safe_jdbc" %>
<%@page import = "bzu_stu_entity.safeInfo" %>
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
  
  
  String userName=(String)session.getAttribute("rememName");
  String ques1=request.getParameter("ques1");
  String ques2=request.getParameter("ques2");
  String ques3=request.getParameter("ques3");
  String answ1=request.getParameter("answ1");
  String answ2=request.getParameter("answ2");
  String answ3=request.getParameter("answ3");
  safeInfo si = new safeInfo();
  si.setUserName(userName);
  si.setQues1(ques1);
  si.setQues2(ques2);
  si.setQues3(ques3);

  si.setAnsw1(answ1);
  si.setAnsw2(answ2);
  si.setAnsw3(answ3);


  
  safe_jdbc sj=new safe_jdbc();
  
  if(sj.selectSafeLock(userName)==true)
  {
	  if(sj.updateSafeLock(si)>0){
	      response.sendRedirect("ownPage.jsp");
	
	  }else{
	      request.getRequestDispatcher("error.jsp?errorInfo=查询密保失败！请确保之前设置过密保或稍后再试。").forward(request,response);
	  }
  }
  else
  {
	  if(sj.setSafeLock(si)>0){
	      response.sendRedirect("ownPage.jsp");
	
	  }else{
	      request.getRequestDispatcher("update.jsp?errorInfo=设置失败！").forward(request,response);
	  }
  }
 %>
  </body>
</html>