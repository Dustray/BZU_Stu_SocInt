<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册帐号</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    	<script type="text/javascript">
		//根据要求进行显示和隐藏

		var hidAndShow = function(){
			var email = document.getElementById("useremail").value;
			var name = document.getElementById("username").value;
			var age = document.getElementById("userage").value;
			
			
			if(name=="")
			{
				document.getElementById("message").innerHTML = "<font color = 'red'>姓名不能为空！</font>"
			}else

			if(age=="")
			{
				document.getElementById("message").innerHTML = "<font color = 'red'>年龄不能为空！</font>"
			}else
			if(email=="")
			{
				document.getElementById("message").innerHTML = "<font color = 'red'>邮箱不能为空！</font>"
			}else
			
			if(!/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(email))
			{
				document.getElementById("message").innerHTML = "<font color = 'red'>邮箱地址不合法！</font>"
			}
			
			
			
			else{
				document.getElementById("message").innerHTML = ''
				document.getElementById("log1").style.display = 'none'
				document.getElementById("log2").style.display = 'block'
				document.getElementById("butt").style.display = 'none'
				document.getElementById("butt2").style.display = 'block'
			}
		}
		var hidAndShow2 = function()
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
<style type="text/css">
/* css reset */
	body{margin:0;padding:0;border:0}
/* main */
	.main{height:600px;background:#fff;position: relative;min-width: 1000px;}
	.right{ text-align:right}
</style>
	<style type="text/css">
		div#container{width:1000px;margin-left:15%;margin-right:15%; }
		div#header {background-color:#99bbbb; height:50px;width:1000px;position:fixed;top:0px}
		div#falseheader {height:40px;width:1000px;top:0px}
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
  
  <section style="background-color: rgb(194, 8, 9);" class="main" id="mainBg"><!--气泡浮层遮罩-->
    	<div id="container">

	<div id="header">
    	<table align="right" height="20" border="0" bordercolor="red"  style="color:#6C6C6C">
        	<tr>
        		<td><a href="index.jsp">首页</a></td>
        		<td>|</td>
            	<td>您好，请<a href="login.jsp">登录</a></td>
            </tr>
        </table>
	</div>
    <div id="falseheader">
    </div>
  <form name="logonForm" method="post" onSubmit="return hidAndShow2()" action="doLogon.jsp">
  
  
    <table height="500" width="70%" align="center">
  <tr>
  <td >
  
  
  
  
  
    <table width="350" border="0" align="right" height="425" bgcolor="#C5FCFF">
  <tr>
    <td height="20" colspan="4" align="center">注册</td>
  </tr>
  <tr>
    <td height="150"  colspan="4" align="center"><br>


      <div id="log1">
    	<table border="0" width="300"  align="center">
        	<tr>
            	<td class="right">用&nbsp;户&nbsp;名：</td>
                <td><input type = "text" name = 'username' id = 'username'></td>
            </tr>
            <tr>
            	<td class="right">年&nbsp;&nbsp;&nbsp;&nbsp;龄：</td>
                <td><input type = "number" name = "userage" id = "userage"></td>
            </tr>
            <tr>
            	<td class="right">性&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
                <td>
                	<select name = 'usersex' id = 'usersex'>
                    	<option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </td>
            </tr>
            <tr>
            	<td class="right">家庭地址：</td>
                <td><input type = "text" name = 'useradd' id = 'useradd'></td>
            </tr>
            <tr>
            	<td class="right">电子邮箱：</td>
                <td><input type = "text" name = 'useremail' id = 'useremail'></td>
            </tr>
            
    	</table>
      </div>
      
      
      <div id="log2" style="display:none">
      	<table border="0" width="300" align="center">
        	<tr algin="center">
            	<td colspan="2" style="color:green">还差一步哦！请设置登陆密码。</td>
            </tr>
            <tr>
            <td class="right">&nbsp;&nbsp;&nbsp;&nbsp;输入密码：</td>
            <td><input type="password" name = "pass1" id="pass1" ></td>
            </tr>
            <tr>
            <td class="right">再次输入密码：</td>
            <td><input type="password" name = "pass2" id="pass2" ></td>
            </tr>
        </table>
      </div>
      
      
      

      
      
    </td>
  </tr>
  <tr height="15">
  	<td>
    	<table align="center">
    		<tr><td colspan="3"> <span id="message"  style="color: red">&nbsp;<%=errorInfo %></span> </td></tr>
        	<tr align="center">
       		   	<td align="center" colspan="3">
    				<input type="button" value="下一步" id = "butt" onClick="hidAndShow();"/>
       				<input type="submit" value="注册" id = "butt2" style="display:none" onClick="hidAndShow2();"/>
             	</td>
        	</tr>
        	<tr style="color:#6C6C6C" align="left">
        		<td align="right"><a href="index.jsp">随便看看</a></td>
        		<td>|</td>
				<td align="left" >已有账号？立即<a href="login.jsp">登陆</a></td>
        	</tr>
        </table>
        
    </td>
  </tr>
</table>


















  </td>
  </tr>
  </table>
  </form>
  </div>
  </section>
  </body>
</html>
