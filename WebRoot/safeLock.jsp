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
    
    <title>�ܱ��޸�</title>
    
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
				document.getElementById("message").innerHTML = "<font color = 'red'>����𰸲���Ϊ�գ�</font>"
				return false;
			}else if(a2=="")
			{
				document.getElementById("message").innerHTML = "<font color = 'red'>����𰸲���Ϊ�գ�</font>"
				return false;	
			}else if(a3=="")
			{
				document.getElementById("message").innerHTML = "<font color = 'red'>����𰸲���Ϊ�գ�</font>"
				return false;	
			}else if(a1==a2)
			{
				document.getElementById("message").innerHTML = "<font color = 'red'>����𰸲�����ͬ��</font>"
				return false;
			}else if(a2==a3)
			{
				document.getElementById("message").innerHTML = "<font color = 'red'>����𰸲�����ͬ��</font>"
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
	        		<td><a href="index.jsp">��ҳ</a></td>
        			<td>|</td>
	            	<td>���ã�<%=(String)session.getAttribute("rememName") %></td>
	            	<td>|</td>
	                <form method="post" action="logout.jsp"><td><input type="submit" value="�˳�"/></td></form>
	            </tr>
	        </table>
		</div>
		<div id="content">
		  <form  method="post" onSubmit="return judgePass();" action="doSafeLock.jsp">
		    <table align="center" width="400" height="400">
		    	<tr>
		    		<td align="center" colspan="2">�޸��ܱ�</td>
		    	</tr>
		    	<tr>
		            <td align="right" width="136">����һ��</td>
		            <td align="left"><select name = "ques1" id="ques1" style="width:180"><option value="����һ��������˭��">����һ��������˭��</option><option value="���ֻ�����λ�Ƕ��٣�">���ֻ�����λ�Ƕ��٣�</option><option value="����ϲ�����ֻ�Ʒ���ǣ�">����ϲ�����ֻ�Ʒ���ǣ�</option><option value="����һ���У�Ů�����ǣ�">����һ���У�Ů�����ǣ�</option><option value="����ϲ������ɫ�ǣ�">����ϲ������ɫ�ǣ�</option><option value="���ĳ������ǣ�">���ĳ������ǣ�</option><option value="�����ڵĳ����ǣ�">�����ڵĳ����ǣ�</option><option value="�����е������ǣ�">�����е������ǣ�</option><option value="����һ���ϴ�ѧ��">����һ���ϴ�ѧ��</option></select></td>
	            </tr>
	            <tr>
		            <td align="right">��һ��</td>
		            <td align="left"><input type="text" name = "answ1" id="answ1" style="width:180" ></td>
	            </tr>
	            <tr>
		            <td align="right">�������</td>
		            <td align="left"><select name = "ques2" id="ques2" style="width:180"><option value="����ϲ����һ������ʲô��">����ϲ����һ������ʲô��</option><option value="���ĵ�һ���ֻ���ʲô���ӵģ�">���ĵ�һ���ֻ���ʲô���ӵģ�</option><option value="����ĸ�׽�ʲô���֣�">����ĸ�׽�ʲô���֣�</option><option value="����ϲ��ʲô���ӵ��·���">����ϲ��ʲô���ӵ��·���</option><option value="���רҵ�ǣ�">���רҵ�ǣ�</option><option value="�����׵������ǣ�">�����׵������ǣ�</option><option value="����Ӱ�������˵������ǣ�">����Ӱ�������˵������ǣ�</option><option value="����ż�������ǣ�">����ż�������ǣ�</option><option value="����ż�������ǣ�">����ż�������ǣ�</option></select></td>
	            </tr>
	            <tr>
		            <td align="right">�𰸶���</td>
		            <td align="left"><input type="text" name = "answ2" id="answ2" style="width:180" ></td>
	            </tr>
	            <tr>
		            <td align="right">��������</td>
		            <td align="left"><select name = "ques3" id="ques3" style="width:180"><option value="��ĸ�׵����֣�">��ĸ�׵����֣�</option><option value="���Ͷ�������Сѧ��">���Ͷ�������Сѧ��</option><option value="����ѧ���ǣ�">����ѧ���ǣ�</option><option value="����ż�������ǣ�">����ż�������ǣ�</option><option value="�����а����ε������ǣ�">�����а����ε������ǣ�</option><option value="����ϵ��õ������ǣ�">����ϵ��õ������ǣ�</option><option value="����ϲ���ĵ���Ʒ���ǣ�">����ϲ���ĵ���Ʒ���ǣ�</option><option value="����ʲôƷ�ƵĶ�����">����ʲôƷ�ƵĶ�����</option><option value="����һ�γ�����ʲôʱ��">����һ�γ�����ʲôʱ��</option></select></td>
	            </tr>
	            <tr>
		            <td align="right">������</td>
		            <td align="left"><input type="text" name = "answ3" id="answ3" style="width:180" ></td>
	            </tr>
	            <tr>
	            	<td colspan="2" align="center"> <span id="message" style="color:red">&nbsp;<%=errorInfo %></span></td>
	            </tr>
			  	<tr align="center">
			  		<td colspan="2" align="center">
			  			<table>
			  				<tr>
			  					<td><input type="submit" value="ȷ���޸�" onClick="judgePass();"/></td>
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
