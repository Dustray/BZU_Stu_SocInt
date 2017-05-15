<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import = "bzu_stu_logon.getUserInfo_jdbc" %>
<%@page import = "bzu_stu_entity.userInfo" %>
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
    
    <title>找回密码</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		var judgePass = function()
		{
			var a1 = document.getElementById("userName").value;
			if(a1=="")
			{
				document.getElementById("message").innerHTML = "<font color = 'red'>用户名不能为空！</font>"
				return false;
			}
			
		}
	</script>
	<style type="text/css">
		div#container{width:1000px;margin-left:15%;margin-right:15%;top:0px;}
		div#header {background-color:#99bbbb; height:50px;width:1000px;}
		div#content {background-color:#EEEEEE;left:200px;}
	</style>
  </head>
    <%
	if(session.getAttribute("rememName") != null)
    {
	    String nu=null;
	    session.setAttribute("rememName",nu);
    } 
    String errorInfo=request.getParameter("errorInfo");
    if(request.getParameter("errorInfo")==null)
    {
    	errorInfo="";
    }
    %>
    
  <%   request.setCharacterEncoding("gbk"); %>
  <body>
  	<div id="container">
	  	<div id="header">
	    	<table align="right" height="20" border="0" bordercolor="red"  style="color:#6C6C6C">
	        	<tr>
	        		<td><a href="index.jsp">首页</a></td>
        			<td>|</td>
	        		<%if(session.getAttribute("rememName")==null){ %>
	            	<td>您好，请<a href="login.jsp">登录</a></td>
	            	<%}%>
	            	<td>|</td>
	                <form method="post" action="logout.jsp"><td><input type="submit" value="退出"/></td></form>
	            </tr>
	        </table>
		</div>
		<div id="content">

		  <form id="findPass" method="post"action="findPassword_2.jsp" style="display:block">
		    <table align="center" width="400" height="400">
		    	<tr>
		    		<td align="center" colspan="2">找回密码</td>
		    	</tr>
		    	<tr height="270">
		    		<td align="right">请输入用户名：</td>
		    		<td><input type="text" style="width:160px" id="userName" name="userName"/></td>
		    	</tr>
			  	<tr align="center">
			  		<td colspan="2" align="center">
			  			<table>
			  				<tr>
			  					<td><input type="submit" value="立即找回"></td>
			  				</tr>
			  			</table>
			  		</td>
			  	</tr>
		    </table>
		  </form>
		  <table align="center">
		  	<tr align="center">
		  		<td align="center"><span id="message" style="color: red">&nbsp;<%=errorInfo%></span></td>
		  	</tr>
		  </table>
		</div>
    </div>
  </body>
</html>
