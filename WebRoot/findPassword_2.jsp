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
    
    <title>密保验证</title>
    
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
	if(session.getAttribute("rememName") != null)
    {
    	String nu=null;
	    session.setAttribute("rememName",nu);
    	//session.invalidate();
    	//session.removeAttribute("rememName");
    } 
    String errorInfo=request.getParameter("errorInfo");
    if(request.getParameter("errorInfo")==null)
    {
    	errorInfo="";
    }
    %>
  <%String userName = request.getParameter("userName"); %>
  <%request.setCharacterEncoding("gbk"); %>
  <%getUserInfo_jdbc lj=new getUserInfo_jdbc();
    if(lj.getUserName(userName)==false)
    {
    	request.getRequestDispatcher("findPassword.jsp?errorInfo=不存在此用户名！").forward(request,response);
    }else{
    session.setAttribute("rememName2", userName);
    %>
    
  <body>
  	<div id="container">
	  	<div id="header">
	    	<table align="right" height="20" border="0" bordercolor="red"  style="color:#6C6C6C">
	        	<tr>
	        		<td><a href="index.jsp">首页</a></td>
        			<td>|</td>
	        		<%if(session.getAttribute("rememName")==null){ %>
	            	<td>您好，请<a href="login.jsp">登录</a></td>
	            	<%} %>
	            	<td>|</td>
	                <form method="post" action="logout.jsp"><td><input type="submit" value="退出"/></td></form>
	            </tr>
	        </table>
		</div>
		<div id="content">

		  
		  <form id="upSafe" method="post" onSubmit="return judgePass();" action="doCheckSafeLock.jsp">
		    <table align="center" width="400" height="400" >
		    	<tr >
		    		<td align="center" colspan="2">验证密保</td>
		    	</tr>
		    	 <% safe_jdbc sj=new safe_jdbc();
				    //验证密保
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
				  	<tr align="center">
				  		<td colspan="2" align="center">
				  			<table>
				  				<tr>
				  					<td><input type="submit" value="找回密码" onClick="judgePass();"></td>
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
  <%} %>
</html>
