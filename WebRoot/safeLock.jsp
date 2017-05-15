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
    
    <title>密保修改</title>
    
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
		  <form  method="post" onSubmit="return judgePass();" action="doSafeLock.jsp">
		    <table align="center" width="400" height="400">
		    	<tr>
		    		<td align="center" colspan="2">修改密保</td>
		    	</tr>
		    	<tr>
		            <td align="right" width="136">问题一：</td>
		            <td align="left"><select name = "ques1" id="ques1" style="width:180"><option value="您初一班主任是谁？">您初一班主任是谁？</option><option value="您手机后四位是多少？">您手机后四位是多少？</option><option value="您最喜欢的手机品牌是？">您最喜欢的手机品牌是？</option><option value="您第一任男（女）友是？">您第一任男（女）友是？</option><option value="您最喜欢的颜色是？">您最喜欢的颜色是？</option><option value="您的出生地是？">您的出生地是？</option><option value="您所在的城市是？">您所在的城市是？</option><option value="您高中的名字是？">您高中的名字是？</option><option value="您哪一年上大学？">您哪一年上大学？</option></select></td>
	            </tr>
	            <tr>
		            <td align="right">答案一：</td>
		            <td align="left"><input type="text" name = "answ1" id="answ1" style="width:180" ></td>
	            </tr>
	            <tr>
		            <td align="right">问题二：</td>
		            <td align="left"><select name = "ques2" id="ques2" style="width:180"><option value="您最喜欢的一本书是什么？">您最喜欢的一本书是什么？</option><option value="您的第一部手机是什么牌子的？">您的第一部手机是什么牌子的？</option><option value="您的母亲叫什么名字？">您的母亲叫什么名字？</option><option value="您最喜欢什么牌子的衣服？">您最喜欢什么牌子的衣服？</option><option value="你的专业是？">你的专业是？</option><option value="您父亲的生日是？">您父亲的生日是？</option><option value="对您影响最大的人的名字是？">对您影响最大的人的名字是？</option><option value="您配偶的名字是？">您配偶的名字是？</option><option value="您配偶的星座是？">您配偶的星座是？</option></select></td>
	            </tr>
	            <tr>
		            <td align="right">答案二：</td>
		            <td align="left"><input type="text" name = "answ2" id="answ2" style="width:180" ></td>
	            </tr>
	            <tr>
		            <td align="right">问题三：</td>
		            <td align="left"><select name = "ques3" id="ques3" style="width:180"><option value="您母亲的名字？">您母亲的名字？</option><option value="您就读于哪所小学？">您就读于哪所小学？</option><option value="您的学号是？">您的学号是？</option><option value="您配偶的生日是？">您配偶的生日是？</option><option value="您初中班主任的名字是？">您初中班主任的名字是？</option><option value="您关系最好的朋友是？">您关系最好的朋友是？</option><option value="您最喜欢的电脑品牌是？">您最喜欢的电脑品牌是？</option><option value="您用什么品牌的耳机？">您用什么品牌的耳机？</option><option value="您第一次出国是什么时候？">您第一次出国是什么时候？</option></select></td>
	            </tr>
	            <tr>
		            <td align="right">答案三：</td>
		            <td align="left"><input type="text" name = "answ3" id="answ3" style="width:180" ></td>
	            </tr>
	            <tr>
	            	<td colspan="2" align="center"> <span id="message" style="color:red">&nbsp;<%=errorInfo %></span></td>
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
