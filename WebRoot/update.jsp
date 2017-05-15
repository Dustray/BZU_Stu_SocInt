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
    
    <title>资料修改</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		var HOSinfo = function(){
				document.getElementById("upInfo").style.display = 'block'
				document.getElementById("upPass").style.display = 'none'
				document.getElementById("upSafe").style.display = 'none'
		}
		var HOSpass = function(){
				document.getElementById("upInfo").style.display = 'none'
				document.getElementById("upPass").style.display = 'block'
				document.getElementById("upSafe").style.display = 'none'
		}
		var HOSsafe = function(){
				document.getElementById("upSafe").style.display = 'block'
				document.getElementById("upPass").style.display = 'none'
				document.getElementById("upInfo").style.display = 'none'
		}
	</script>
	<script type="text/javascript">
		var judgePass = function()
		{
			var a1 = document.getElementById("answ1").value;
			var a2 = document.getElementById("answ2").value;
			var a3 = document.getElementById("answ3").value;
			if(a1=="")
			{
				document.getElementById("message").innerHTML = "<font color = 'red'>问题答案不能为空！</font>"
				return false;
			}else if(a2=="")
			{
				document.getElementById("message").innerHTML = "<font color = 'red'>问题答案不能为空！</font>"
				return false;	
			}else if(a3=="")
			{
				document.getElementById("message").innerHTML = "<font color = 'red'>问题答案不能为空！</font>"
				return false;	
			}else if(a1==a2)
			{
				document.getElementById("message").innerHTML = "<font color = 'red'>问题答案不能相同！</font>"
				return false;
			}else if(a2==a3)
			{
				document.getElementById("message").innerHTML = "<font color = 'red'>问题答案不能相同！</font>"
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
	        		<%if(session.getAttribute("rememName")==null){ %>
	            	<td>您好，请<a href="login.jsp">登录</a></td>
	            	<%} else {%>
	            	<td>您好，<%=(String)session.getAttribute("rememName") %></td>
	            	<%} %>
	            	<td>|</td>
	                <form method="post" action="logout.jsp"><td><input type="submit" value="退出"/></td></form>
	            </tr>
	        </table>
		</div>
		<div id="content">
		  <form id="upInfo" method="post" action="doUpdate.jsp" style="display:block">
		    <table align="center" width="400" height="400" >
		    	<tr>
		    		<td align="center" colspan="2">修改资料</td>
		    	</tr>
		    	 <%  
				  userInfo ui = new userInfo();
				  ui.setUsername(userName);
				  getUserInfo_jdbc gj=new getUserInfo_jdbc();
				  List<userInfo> infoList=gj.getUserInfomation(ui); 
				  for(userInfo f:infoList)
				  {
				%>
		    	<tr>
		    		<td align="right">个人签名:</td>
		    		<td><input type="text" style="width:160px" id="userSige" name="userSige" value="<%=f.getUsersige() %>"/></td>
		    	</tr>
		      	<tr>	
			  		<td align="right">年龄：</td>
			  		<td align="left"><input type="number" style="width:160px" id="userAge" name="userAge"  value="<%=f.getUserage() %>"/></td>
			  	</tr>
			  	<tr>	
			  		<td align="right"><font face="Adobe Arabic">性别：</font></td>
			  		<td align="left"><input type="text" style="width:160px" id="userSex" name="userSex" value="<%=f.getUsersex() %>"/></td>
			  	</tr>
			  	<tr>	
			  		<td align="right">QQ：</td>
			  		<td align="left"><input type="text" style="width:160px" id="userQQ" name="userQQ"  value="<%=f.getUserqq() %>"/></td>
			  	</tr>
			  	<tr>
			  		<td align="right">Email：</td>
			  		<td align="left"><input type="text" style="width:160px" id="userEmail" name="userEmail" value="<%=f.getUseremail() %>"/></td>
			  	</tr>
			  	<tr>	
			  		<td align="right">地址：</td>
			  		<td align="left"><input type="text" style="width:160px" id="userAdd" name="userAdd" value="<%=f.getUseraddress() %>"/></td>
			  	</tr>
			  	<%} %>
			  	<tr align="center">
			  		<td colspan="2" align="center">
			  			<table>
			  				<tr>
			  					<td><input type="button" value="修改密码" onClick="HOSpass();"/></td>
			  					<td><input type="button" value="修改密保" onClick="HOSsafe();"/></td>
			  					<td><input type="submit" value="确认修改"></td>
			  				</tr>
			  			</table>
			  		</td>
			  	</tr>
		    </table>
		  </form>
		  <form id="upPass" method="post"action="doLogin.jsp" style="display:none">
		    <table align="center" width="400" height="400">
		    	<tr>
		    		<td align="center" colspan="2">修改密码</td>
		    	</tr>
		    	<tr height="270">
		    		<td align="right">请输入旧密码：</td>
		    		<td><input type="password" style="width:160px" id="userpass" name="userpass"/></td>
		    	</tr>
		    	<tr align="right">
		    		<td colspan="2" align="center" ><a href="findPassword.jsp">忘记密码？</a></td>
		    	</tr>
			  	<tr align="center">
			  		<td colspan="2" align="center">
			  			<table>
			  				<tr>
			  					<td><input type="button" value="修改资料" onClick="HOSinfo();"/></td>
			  					<td><input type="button" value="修改密保" onClick="HOSsafe();"/></td>
			  					<td><input type="submit" value="继续修改"></td>
			  				</tr>
			  			</table>
			  		</td>
			  	</tr>
		    </table>
		  </form>
		  <form id="upSafe" method="post" onSubmit="return judgePass();" action="doCheckSafeLock.jsp" style="display:none">
		    <table align="center" width="400" height="400" >
		    	<tr >
		    		<td align="center" colspan="2">修改密保</td>
		    	</tr>
		    	 <%  
		    	 
		    	 //查询密保是否存在
				    safe_jdbc sj=new safe_jdbc();
				    if(sj.selectSafeLock(name)==false)
				    {%>
				    <tr align="center" height="298">
				    	<td><span style="color:red;">您未设置密保，立即<a href="safeLock.jsp">设置密保</a>。</span></td>
			  		</tr>
			  		<tr align="center">
				  		<td colspan="2" align="center">
				  			<table>
				  				<tr>
				  					<td><input type="button" value="修改密码" onClick="HOSpass();"/></td>
				  					<td><input type="button" value="修改资料" onClick="HOSinfo();"/></td>
				  					<td><a href="safeLock.jsp"><input  type="button" value="设置密保" /></a></td>
				  				</tr>
				  			</table>
				  		</td>
			  		</tr>
				    <%}else{//验证密保
				    	  List<safeInfo> lockList=sj.getSafeLock(userName); 
						  for(safeInfo s:lockList)
						  {
				    %>
			    	<tr>
			            <td align="right" width="136">问题一：</td>
			            <td align="left"><input type="hidden" name = "ques1" id = "ques1" value="<%=s.getQues1() %>"/><%=s.getQues1() %></td>
		            </tr>
		            <tr>
			            <td align="right">答案一：</td>
			            <td align="left"><input type="text" name = "answ1" id="answ1" style="width:180" ></td>
		            </tr>
		            <tr>
			            <td align="right">问题二：</td>
			            <td align="left"><input type="hidden" name = "ques2" id = "ques2" value="<%=s.getQues2() %>"/><%=s.getQues2() %></td>
		            </tr>
		            <tr>
			            <td align="right">答案二：</td>
			            <td align="left"><input type="text" name = "answ2" id="answ2" style="width:180" ></td>
		            </tr>
		            <tr>
			            <td align="right">问题三：</td>
			            <td align="left"><input type="hidden" name = "ques3" id = "ques3" value="<%=s.getQues3() %>"/><%=s.getQues3() %></td>
		            </tr>
		            <tr>
			            <td align="right">答案三：</td>
			            <td align="left"><input type="text" name = "answ3" id="answ3" style="width:180" ></td>
		            </tr>
		            <%} %>
				  	<tr align="center">
				  		<td colspan="2" align="center">
				  			<table>
				  				<tr>
				  					<td><input type="button" value="修改密码" onClick="HOSpass();"/></td>
				  					<td><input type="button" value="修改资料" onClick="HOSinfo();"/></td>
				  					<td><input type="submit" value="确认修改" onClick="judgePass();"></td>
				  				</tr>
				  			</table>
				  		</td>
				  	</tr>
			  	<%} %>
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
