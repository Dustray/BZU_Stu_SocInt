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
    
    <title>密码修改</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		div#container{width:1000px;margin-left:15%;margin-right:15%;top:0px;}
		div#header {background-color:#99bbbb; height:50px;width:1000px;}
		div#content {background-color:#EEEEEE;left:200px;}
	</style>
		<script type="text/javascript">
		var judgePass = function()
		{
			var num1 = document.getElementById("pass1").value;
			var num2 = document.getElementById("pass2").value;
			if(num1=="")
			{
				document.getElementById("message").innerHTML = "<font color = 'red'>密码不能为空！</font>"
				return false;
			}else if(num2=="")
			{
				document.getElementById("message").innerHTML = "<font color = 'red'>密码不能为空！</font>"
				return false;	
			}else if(num1!=num2)
			{
				document.getElementById("message").innerHTML = "<font color = 'red'>两次密码输入不一致！</font>"
				return false;
			}else if(num1.length < 6)
			{
				document.getElementById("message").innerHTML = "<font color = 'red'>密码长度至少为6位！</font>"
				return false;	
			}
			
		}
	</script>
  </head>
    <%
	if(session.getAttribute("rememName") == null)
    {
    	response.sendRedirect("login.jsp");
    	return;
    } 
    String errorInfo=request.getParameter("errorInfo");
    if(request.getParameter("errorInfo")==null)
    {
    	errorInfo="";
    }
    %>
      <%String name=(String)session.getAttribute("rememName"); 
      	String userName = (String)session.getAttribute("rememName");%>
  <%   request.setCharacterEncoding("gbk"); %>
  <body>
  	<div id="container">
	  	<div id="header">
	    	<table align="right" height="20" border="0" bordercolor="red"  style="color:#6C6C6C">
	        	<tr>
	        		<td><a href="index.jsp">首页</a></td>
        			<td>|</td>
	            	<td>您好，<%=(String)session.getAttribute("rememName") %></td>
	            	<td>|</td>
	                <form method="post" action="logout.jsp"><td><input type="submit" value="退出"/></td></form>
	            </tr>
	        </table>
		</div>
		<div id="content">
		  <form  method="post" onSubmit="return judgePass();" action="doUpdatePass.jsp">
		    <table align="center" width="400" height="400">
		    	<tr>
		    		<td align="center" colspan="2">修改资料</td>
		    	</tr>
		    	<tr valign="bottom">
		            <td align="right">&nbsp;&nbsp;&nbsp;&nbsp;输入密码：</td>
		            <td align="left"><input type="password" name = "pass1" id="pass1" ></td>
	            </tr>
	            <tr valign="top">
		            <td align="right">再次输入密码：</td>
		            <td align="left"><input type="password" name = "pass2" id="pass2" ></td>
	            </tr>
	            <tr>
	            	<td colspan="2"> <span id="message" >&nbsp;<%=errorInfo %></span></td>
	            </tr>
			  	<tr align="center">
			  		<td colspan="2" align="center">
			  			<table>
			  				<tr>
			  					<td><input type="submit" value="确认修改" onClick="judgePass();"/></td>
			  				</tr>
			  			</table>
			  		</td>
			  	</tr>
		    </table>
		  </form>
		</div>
    </div>
  </body>
</html>
