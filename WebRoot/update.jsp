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
    
    <title>�����޸�</title>
    
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
	        		<td><a href="index.jsp">��ҳ</a></td>
        			<td>|</td>
	        		<%if(session.getAttribute("rememName")==null){ %>
	            	<td>���ã���<a href="login.jsp">��¼</a></td>
	            	<%} else {%>
	            	<td>���ã�<%=(String)session.getAttribute("rememName") %></td>
	            	<%} %>
	            	<td>|</td>
	                <form method="post" action="logout.jsp"><td><input type="submit" value="�˳�"/></td></form>
	            </tr>
	        </table>
		</div>
		<div id="content">
		  <form id="upInfo" method="post" action="doUpdate.jsp" style="display:block">
		    <table align="center" width="400" height="400" >
		    	<tr>
		    		<td align="center" colspan="2">�޸�����</td>
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
		    		<td align="right">����ǩ��:</td>
		    		<td><input type="text" style="width:160px" id="userSige" name="userSige" value="<%=f.getUsersige() %>"/></td>
		    	</tr>
		      	<tr>	
			  		<td align="right">���䣺</td>
			  		<td align="left"><input type="number" style="width:160px" id="userAge" name="userAge"  value="<%=f.getUserage() %>"/></td>
			  	</tr>
			  	<tr>	
			  		<td align="right"><font face="Adobe Arabic">�Ա�</font></td>
			  		<td align="left"><input type="text" style="width:160px" id="userSex" name="userSex" value="<%=f.getUsersex() %>"/></td>
			  	</tr>
			  	<tr>	
			  		<td align="right">QQ��</td>
			  		<td align="left"><input type="text" style="width:160px" id="userQQ" name="userQQ"  value="<%=f.getUserqq() %>"/></td>
			  	</tr>
			  	<tr>
			  		<td align="right">Email��</td>
			  		<td align="left"><input type="text" style="width:160px" id="userEmail" name="userEmail" value="<%=f.getUseremail() %>"/></td>
			  	</tr>
			  	<tr>	
			  		<td align="right">��ַ��</td>
			  		<td align="left"><input type="text" style="width:160px" id="userAdd" name="userAdd" value="<%=f.getUseraddress() %>"/></td>
			  	</tr>
			  	<%} %>
			  	<tr align="center">
			  		<td colspan="2" align="center">
			  			<table>
			  				<tr>
			  					<td><input type="button" value="�޸�����" onClick="HOSpass();"/></td>
			  					<td><input type="button" value="�޸��ܱ�" onClick="HOSsafe();"/></td>
			  					<td><input type="submit" value="ȷ���޸�"></td>
			  				</tr>
			  			</table>
			  		</td>
			  	</tr>
		    </table>
		  </form>
		  <form id="upPass" method="post"action="doLogin.jsp" style="display:none">
		    <table align="center" width="400" height="400">
		    	<tr>
		    		<td align="center" colspan="2">�޸�����</td>
		    	</tr>
		    	<tr height="270">
		    		<td align="right">����������룺</td>
		    		<td><input type="password" style="width:160px" id="userpass" name="userpass"/></td>
		    	</tr>
		    	<tr align="right">
		    		<td colspan="2" align="center" ><a href="findPassword.jsp">�������룿</a></td>
		    	</tr>
			  	<tr align="center">
			  		<td colspan="2" align="center">
			  			<table>
			  				<tr>
			  					<td><input type="button" value="�޸�����" onClick="HOSinfo();"/></td>
			  					<td><input type="button" value="�޸��ܱ�" onClick="HOSsafe();"/></td>
			  					<td><input type="submit" value="�����޸�"></td>
			  				</tr>
			  			</table>
			  		</td>
			  	</tr>
		    </table>
		  </form>
		  <form id="upSafe" method="post" onSubmit="return judgePass();" action="doCheckSafeLock.jsp" style="display:none">
		    <table align="center" width="400" height="400" >
		    	<tr >
		    		<td align="center" colspan="2">�޸��ܱ�</td>
		    	</tr>
		    	 <%  
		    	 
		    	 //��ѯ�ܱ��Ƿ����
				    safe_jdbc sj=new safe_jdbc();
				    if(sj.selectSafeLock(name)==false)
				    {%>
				    <tr align="center" height="298">
				    	<td><span style="color:red;">��δ�����ܱ�������<a href="safeLock.jsp">�����ܱ�</a>��</span></td>
			  		</tr>
			  		<tr align="center">
				  		<td colspan="2" align="center">
				  			<table>
				  				<tr>
				  					<td><input type="button" value="�޸�����" onClick="HOSpass();"/></td>
				  					<td><input type="button" value="�޸�����" onClick="HOSinfo();"/></td>
				  					<td><a href="safeLock.jsp"><input  type="button" value="�����ܱ�" /></a></td>
				  				</tr>
				  			</table>
				  		</td>
			  		</tr>
				    <%}else{//��֤�ܱ�
				    	  List<safeInfo> lockList=sj.getSafeLock(userName); 
						  for(safeInfo s:lockList)
						  {
				    %>
			    	<tr>
			            <td align="right" width="136">����һ��</td>
			            <td align="left"><input type="hidden" name = "ques1" id = "ques1" value="<%=s.getQues1() %>"/><%=s.getQues1() %></td>
		            </tr>
		            <tr>
			            <td align="right">��һ��</td>
			            <td align="left"><input type="text" name = "answ1" id="answ1" style="width:180" ></td>
		            </tr>
		            <tr>
			            <td align="right">�������</td>
			            <td align="left"><input type="hidden" name = "ques2" id = "ques2" value="<%=s.getQues2() %>"/><%=s.getQues2() %></td>
		            </tr>
		            <tr>
			            <td align="right">�𰸶���</td>
			            <td align="left"><input type="text" name = "answ2" id="answ2" style="width:180" ></td>
		            </tr>
		            <tr>
			            <td align="right">��������</td>
			            <td align="left"><input type="hidden" name = "ques3" id = "ques3" value="<%=s.getQues3() %>"/><%=s.getQues3() %></td>
		            </tr>
		            <tr>
			            <td align="right">������</td>
			            <td align="left"><input type="text" name = "answ3" id="answ3" style="width:180" ></td>
		            </tr>
		            <%} %>
				  	<tr align="center">
				  		<td colspan="2" align="center">
				  			<table>
				  				<tr>
				  					<td><input type="button" value="�޸�����" onClick="HOSpass();"/></td>
				  					<td><input type="button" value="�޸�����" onClick="HOSinfo();"/></td>
				  					<td><input type="submit" value="ȷ���޸�" onClick="judgePass();"></td>
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
