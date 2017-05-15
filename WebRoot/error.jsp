<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>异常错误</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script  type="text/javascript">
		function go()
		{
			window.history.go(-1);
		}
		setTimeout("go()",3000);
	</script>

  </head>
  
  <body>
   <table align="center">
    <tr align="center">
    	<td>
		  <%if(request.getParameter("errorInfo")!= null)
		  	{
		  	 %><span id="message" style="color:red">&nbsp;<%=request.getParameter("errorInfo") %></span><%
		  	}else
		  	{%>
		  	 <span id="message" style="color:red">未知错误！</span>
		  <%} %>
		  </td>
    </tr>
  	<tr align="center">
  		<td>三秒钟后自动跳转到上一页......</td>
  	</tr>
  	<tr align="center">
  		<td><a href = "javascript:'" onClick="javascript:history.back(-1);"><img src="image/goLastPage1.png" width="100"  border="0" title="立即返回"></a></td>
  	</tr>
  </table>
  </body>
</html>
