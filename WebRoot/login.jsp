<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录帐号</title>
    

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		var passIfNull = function()
		{
			var username = document.getElementById("username").value;
			var userpass = document.getElementById("userpass").value;


		    
			if(username == "")
			{
				document.getElementById("message").innerHTML = "<font color = 'red'>用户名不能为空！</font>"
				return false;
			}
			
			if(userpass == "")
			{
				document.getElementById("message").innerHTML = "<font color = 'red'>密码不能为空！</font>"
				return false;
			}
			
		}
		var passIfNull2 = function()
		{
			var username = document.getElementById("adminName").value;
			var userpass = document.getElementById("adminPass").value;


		    
			if(username == "")
			{
				document.getElementById("message2").innerHTML = "<font color = 'red'>用户名不能为空！</font>"
				return false;
			}
			
			if(userpass == "")
			{
				document.getElementById("message2").innerHTML = "<font color = 'red'>密码不能为空！</font>"
				return false;
			}
			
		}
		function writingDiv()
		{
			if(document.getElementById("fullbg").style.display == "block")
			{
				document.getElementById("fullbg").style.display = "none";
			}else{
				document.getElementById("fullbg").style.display = "block";
			}
		}
	</script>
	<style type="text/css">
		<!--
		.adminLoginN
		{
		position:fixed;
		width:406px;
		height:200px;
		left:47%;
		top:40%;
		margin-top:-271px;
		margin-left:60px;
		}
		#fullbg{
		display:none;
		position:fixed;
		top:0px;
		left:0px;
		width:100%;
		height:100%;
		background-color:rgba(0,0,0,0.42);
		}
		
	-->
		div#container{width:1000px;margin-left:15%;margin-right:15%; }
		div#header {background-color:#99bbbb; height:50px;width:1000px;position:fixed;top:0px}
		div#falseheader {height:40px;width:1000px;top:0px}
		div#footer {background-color:#99bbbb;clear:both;text-align:center;}
	</style>
  </head>
    <%	if(session.getAttribute("rememName") != null)
    {
    	response.sendRedirect("index.jsp");
    } 
    String errorInfo=request.getParameter("errorInfo");
    if(request.getParameter("errorInfo")==null)
    {
    	errorInfo="";
    }
    %>

  <body>
  	<div id="container">

	<div id="header">
    	<table align="right" height="20" border="0" bordercolor="red"  style="color:#6C6C6C">
        	<tr>
        		<td><a href="index.jsp">首页</a></td>
        		<td>|</td>
            	<td>您好，请登录</td>
            </tr>
        </table>
	</div>
    <div id="falseheader">
    </div>
    
    <form name="loginForm" method="post" onSubmit="return passIfNull()" action="doLogin.jsp">
    	<table height="600" width="80%" align="center" border="0">
		<tr>
		<td>
		  	<table width="320" border="0" align="right" height="300" bgcolor="#e3f6e0">
		  
			    <tr height="50" valign="bottom">
			  		<td height="20" colspan="4" align="center" class="xiaozibiaoti">登录</td>
				</tr> 
				<tr>
					<td>
				      	<div id="log1">
							<table border="0" width="350">
							   <tr align="center">
    						   	<td colspan="2" align="center"><span id="message" style="color:red">&nbsp;<%=errorInfo %></span></td>
							   </tr>
					           <tr>
					           	<td align="right" width="35%">用户名：</td>
					           	<td colspan="2"><input type="text" style="width:170px" id="username" name="username"/></td>
					           </tr>
					           <tr>
					           	<td align="right" width="35%">密&nbsp;&nbsp;码：</td>
					           	<td colspan="2"><input type="password" style="width:170px" id="userpass" name="userpass"/></td>
					           </tr>
					           <tr style="color:#6C6C6C">
					           	<td colspan="2">
						           	<table align="center" border="0" width="250">
						           		<tr>
								           	<td align="center" width="50%"><input type="submit" value="登录" onClick="passIfNull"/></td>
											<td align="center" >没有账号？<br>立即<a href="logon.jsp">注册</a></td>
										</tr>
										<tr>
											<td align="center" width="50%"><a href="index.jsp">随便看看</a></td>
											<td align="center" ><a href="findPassword.jsp">忘记密码？</a></td>
										</tr>
									</table>
								</td>
					           </tr>
			    			</table>
			      		</div>
	      			</td>
	      		</tr>
      		</table>
  		</table>
   	</form>
   	
   	<div id="fullbg">
		<div id="writingD" class="adminLoginN">
		   	<form name="AdminLoginForm" method="post" onSubmit="return passIfNull2()" action="doLoginAdmin.jsp">
		    	<table height="600" width="80%" align="center" border="0">
				<tr>
				<td>
				  	<table width="320" border="0" align="right" height="300" bgcolor="#e3f6e0">
				  
					    <tr height="50" valign="bottom">
					  		<td height="20" colspan="4" align="center" class="xiaozibiaoti">管理员登录</td>
						</tr> 
						<tr>
							<td>
						      	<div id="log1">
									<table border="0" width="350">
									   <tr align="center">
		    						   	<td colspan="2" align="center"><span id="message2" style="color:red">&nbsp;<%=errorInfo %></span></td>
									   </tr>
							           <tr>
							           	<td align="right" width="35%">用户名：</td>
							           	<td colspan="2"><input type="text" style="width:170px" id="adminName" name="adminName"/></td>
							           </tr>
							           <tr>
							           	<td align="right" width="35%">密&nbsp;&nbsp;码：</td>
							           	<td colspan="2"><input type="password" style="width:170px" id="adminPass" name="adminPass"/></td>
							           </tr>
							           <tr align="center">
							           	<td>&nbsp;</td>
							           </tr>
							           <tr style="color:#6C6C6C">
							           	<td colspan="2">
								           	<table align="center" border="0" width="250">
								           		<tr>
										           	<td align="center" width="50%"><input type="submit" value="登录" onClick="passIfNull2();"/></td>
													<td align="center" width="50%"><input type="button" value="返回" onClick="writingDiv();"/></td>
												</tr>
											</table>
										</td>
							           </tr>
					    			</table>
					      		</div>
			      			</td>
			      		</tr>
		      		</table>
		  		</table>
		   	</form>
	   	</div>
   	</div>
   	
   	
   	
   	<div id="footer">
   		<table align="right">
   			<tr align="right">
   				<td><a href="javascript:void(0);" onClick="writingDiv();">管理员登陆入口</a></td>
   			</tr>
   		</table>
   	</div>
   </div>
  </body>
</html>
