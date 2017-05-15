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
    
    <title>My JSP 'doCheckSafeLock.jsp' starting page</title>
    
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
  String userName;
  if(session.getAttribute("rememName")==null&&session.getAttribute("rememName2")==null)
  {
  	response.sendRedirect("login.jsp");
  	return;
  }
  if(session.getAttribute("rememName")!=null)
  {
  	userName=(String)session.getAttribute("rememName");
  }else
  {
  	userName=(String)session.getAttribute("rememName2");
  }
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
  if(sj.checkSafeLock(si)==true){//判断密保是否正确，
  		if(session.getAttribute("rememName2")!=null)//如果正确，判断是否为从findPassword_2.jsp传过来的,
  		{
  			session.setAttribute("rememName", userName);//如果是，则使登陆用户名改为验证过的用户名,
  			//session.invalidate();
    		session.removeAttribute("rememName2");//并销毁rememName2
  			response.sendRedirect("updatePass.jsp");//并且传送到修改密码页面（updatePass.jsp）
  		}else{//否则直接跳到修改密保页面
          response.sendRedirect("safeLock.jsp");
          }

  }else{//如果不正确返回错误提示语句
          request.getRequestDispatcher("update.jsp?errorInfo=密保验证错误！").forward(request,response);
  }
 %>
  </body>
</html>
