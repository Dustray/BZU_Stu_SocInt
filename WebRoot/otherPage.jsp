<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import = "bzu_stu_logon.news_jdbc" %>
<%@page import = "bzu_stu_entity.newsInfo" %>
<%@page import = "bzu_stu_logon.comm_jdbc" %>
<%@page import = "bzu_stu_entity.commInfo" %>
<%@page import = "bzu_stu_logon.getUserInfo_jdbc" %>
<%@page import = "bzu_stu_logon.getOtherInfo_jdbc" %>
<%@page import = "bzu_stu_entity.userInfo" %>
<%@page import = "bzu_stu_logon.safe_jdbc" %>
<%@page import = "bzu_stu_entity.safeInfo" %>
<%@page import = "bzu_stu_logon.adminAbout_jdbc" %>
<%@page import = "bzu_stu_entity.adminInfo" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我的页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	var j=1;
	function newsPosi()
	{
		var positions = null;
		switch(j)
		{
			case 1:positions = "left";break;
			case 2:positions = "center";break;
			case 3:positions = "right";break;
		}
		j++
		if(j == 3)
		{
			j=1;
		}
		return positions;
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
	function checkEmpty()
	{
		var news = document.getElementById("textfield").value;
			if(news=="")
			{
				document.getElementById("information").innerHTML = "<font color = 'red'>内容不能为空！</font>"
				return false;
			}
	}
	function commingDiv(i)
	{
	 	document.getElementById("getNewsUser").value=document.getElementById(i).value;
		document.getElementById("fulltg").style.display = "block";
		
	}
	function commingDivClose()
	{
		document.getElementById("fulltg").style.display = "none";
	}
	function turnComm()
	{
		var news = document.getElementById("commBody").value;
			if(news=="")
			{
				document.getElementById("commBody").innerHTML = "<font color = 'red'>内容不能为空！</font>"
				return false;
			}
	}

    </script>
	<style type="text/css">
<!--
		.BJblack {
			float: left;
			width: 10%;
		}
		
		.BJxia {
			background-color: #CCFF99;
			clear: both;
			height: 100px;
			width: 80%;
			margin-right: 10%;
			margin-left: 10%;
			margin-top: 4px;
		}
		.centeraaa{
			position:relative;
			min-width:200px;
			background-color:#fff;
			margin:0 auto;
			*zoom:1
		}
		.threelie{
			position:absolute;
		
		}
		.wenby {
			width: 400px;
			text-align: left;
			vertical-align: middle;
		}
		.biaogejz {
			text-align: center;
		}
		.jhgg{
		width: 280px;
		height: 30px;
		text-align: left;
		}
		
		.writingN
		{
		position:fixed;
		width:406px;
		height:200px;
		left:47%;
		top:50%;
		margin-top:-150px;
		margin-left:-150px;
		background-color:rgba(11,108,0,0.56);
		}
		#fullbg,#fulltg{
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
		div#menu {background-color:#ffff99;height:1000px;width:250px;float:left; position:fixed;top:50px}
		div#falsemenu {height:1000px;width:250px;float:left;}
		div#content {background-color:#EEEEEE;width:750px;float:left;top:50px}
		div#footer {background-color:#99bbbb;clear:both;text-align:center;}

	</style>
		<style type="text/css">
	<!--
		a:link,a:visited{
		 text-decoration:none;  /*超链接无下划线*/
		 color:#006666;
		}
		a:hover{
		 text-decoration:underline;  /*鼠标放上去有下划线*/
		 color:#56b946;
		}

	-->
	</style>
  </head>
 
  <body>
  <%   request.setCharacterEncoding("gbk"); %>
  <%
	if(session.getAttribute("rememName") == null)
    {
    	response.sendRedirect("login.jsp");
    	return;
	} 
	String name=(String)session.getAttribute("rememName"); 
	String userName = (String)session.getAttribute("rememName");
	String othersNames = (String)request.getParameter("othersName");
	String othersName =new String(othersNames.getBytes("ISO-8859-1"),"gbk");
	if(othersNames == userName)
	{
		response.sendRedirect("ownPage.jsp");
   		return;
	}%>
  

    
	<div id="container">

	<div id="header">
		<form method="post" action="logout.jsp">
	    	<table align="right" height="20" border="0" bordercolor="red"  style="color:#6C6C6C">
	        	<tr>
	        		<% 
	        		  adminAbout_jdbc aj=new adminAbout_jdbc();
					  List<adminInfo> anno=aj.getAnno();
					  for(adminInfo a:anno)
					  {
	        		%>
	        		<td width="600">
	        			<marquee direction="left" scrolldelay="15" scrollamount="5" behaviour="scroll" width="600" style="color:red"><%=a.getAdminAnno() %></marquee>
	        		</td>
	        		<% }%>
	        		<td><a href="index.jsp">首页</a></td>
	        		<td>|</td>
	        		<%if(session.getAttribute("rememName")==null){ %>
	            	<td>您好，请<a href="login.jsp" >登录</a></td>
	            	<%} else {%>
	            	<td>您好，<a href="ownPage.jsp"><%=(String)session.getAttribute("rememName") %></a></td>
	            	<td>|</td>
	                <td><input class="buttonClass" type="submit" value="退出"/></td>
	                <%} %>
	            </tr>
	        </table>
        </form>
	</div>
    <div id="falseheader">
    </div>

<div id="menu">
  <table align="center" style ="color: #6B6B6B" width="250px">
  	<% 
	  getOtherInfo_jdbc gj=new getOtherInfo_jdbc();
	  List<userInfo> infoList=gj.getOtherInfomation(othersName); 
	  for(userInfo f:infoList)
	  {
	%>
  	<tr>
  		<td colspan="2">
  			<table align="center" border="0">
  				<tr>
			  		<td align="center" ><span style="font-size:21 ">ta的资料</span></td>
  				</tr>
  			</table>
  		</td>
  	</tr>
  	<tr>
  		<td colspan="2"><hr/></td>
  	</tr>
  	<tr>	
  		<td align="right" width="40%">会员名：</td>
  		<td width="60%"><%= othersName %></td>
  	</tr>
  	<tr>	
  		<td align="right">经验：</td>
  		<td><%=f.getUserinteg() %></td>
  	</tr>
  	<tr>	
  		<td align="right">等级：</td>
  		<td><%=f.getUserlevel() %>级</td>
  	</tr>
  	<tr>	
  		<td align="right">签名：</td>
  		<td style="word-break;break-all" ><%=f.getUsersige() %></td>
  	</tr>
  	<tr>	
  		<td align="right">年龄：</td>
  		<td><%=f.getUserage() %></td>
  	</tr>
  	<tr>	
  		<td align="right">性别：</td>
  		<td><%=f.getUsersex() %></td>
  	</tr>
  	<tr>	
  		<td align="right">QQ：</td>
  		<td><%=f.getUserqq() %></td>
  	</tr>
  	<tr>
  		<td align="right">Email：</td>
  		<td style="word-break;break-all"><%=f.getUseremail() %></td>
  	</tr>
  	<tr>	
  		<td align="right">地址：</td>
  		<td style="word-break;break-all" ><%=f.getUseraddress() %></td>
  	</tr>
  	<%} %>
  </table>
</div>
  
<div id="falsemenu"></div>
  
<div id= "bgDiv"></div>
<div id="fulltg">
	<div id="writingD" class="writingN">
		<form method="post" action = "doComm.jsp" onSubmit = "return checkEmpty2()">
		  <table width="400" border="0"  class="biaogejz">
		    <tr>
		      <td><textarea maxlength="140" autofocus name="commBody" id="commBody" style="resize: none;" cols="20" rows="8" class="wenby"></textarea></td>
		    </tr>
		    <tr>
		      <td id="information2">&nbsp; </td>
		      <td><input type="hidden" id="getNewsUser" name="getNewsUser" value=""></td>
		    </tr>
		    <tr align="right">
		      <td >
		        <input type="submit" name="Submit" value="评论" onClick="checkEmpty2();"/>
		        <input type="reset" name="reset" value="清除" />
		        <input type="button" name="closeWrite" value="关闭"  onClick="commingDivClose();"/>	</td>
		    </tr>
		  </table>
		</form>
	</div>
</div>

<!-- -----------------------------------------------发表消息----------------------------------------------------- -->
<div id="content" >
  <%
  news_jdbc td=new news_jdbc();
  List<newsInfo> list=td.getMyNews(othersName);
  int index=0;
  int i=5;
  String everycolor=null;
  for(newsInfo t:list)
  {
  	i++;
  	if(i>5)
  	{i=1;}
  	switch(i)
  	{
  		case 1:everycolor="#fdff85";break;//黄
  		case 2:everycolor="#b3fffd";break;//蓝
  		case 3:everycolor="#ffb3b3";break;//红
  		case 4:everycolor="#c3ffb3";break;//绿
  		case 5:everycolor="#f0b3ff";break;//粉
  		
  	}
  
  
	%><table border="0" bordercolor="#000000" width="700" bgcolor="<%=everycolor %>" align="center">
       	<tr style="color:#FF0004">
  			<td colspan="3"><input type="hidden" id="<%=index %>" value="<%=t.getNewsID() %>"/><a href="otherPage.jsp?othersName=<%=t.getUserName() %>"><%=t.getUserName() %></a></td>
  		</tr>
  		<tr>
  			<td colspan="3" style="word-break:break-all">&nbsp;&nbsp;<%=t.getNewsBody() %></td>
  		</tr>
  		<tr style="color:#6C6C6C">
  			<td width="80%"><%=t.getNewsTime() %></td>
  			<td width="10%" align="right">&nbsp;</td>
  			<td width="10%" id="commentP" onClick="commingDiv(<%=index %>);"><a href="javascript:void(0)">评论</a></td>
  		</tr>
  		<tr align="center">
  			<td align="center" colspan="3">
	  			<table width="698"  bgcolor="white">
					<%
					comm_jdbc cj = new comm_jdbc();
					
					int newsID =t.getNewsID();
					
					commInfo ci = new commInfo();
					ci.setNewsID(newsID);
					
					List<commInfo> list2 = cj.getAllComms(ci);
					int m =1;
					for(commInfo p:list2)
					{%>
					<tr align="left" style="color:#6C6C6C">
						<td style="color:#6C6C6C"><a href="otherPage.jsp?othersName=<%=p.getCommuserName()  %>"><%=p.getCommuserName() %></a>:</td>
					</tr>
					<tr>
						<td style="word-break:break-all">&nbsp;&nbsp;<%=p.getCommBody() %></td>
					</tr>
					<tr align="right">
						<td id="touchComm" name="touchComm" ><span style="color: green"><%=p.getCommTime() %></span></td>
					</tr>
					<%}%>
	
	  			</table>
  			</td>

  		</tr>
	</table>
  
	<table border="0" height="10" width="290">
      <tr></tr>
	</table>
 <% } %>
</div>

<div id="footer"><%= othersName %></div>

</div>
  </body>
</html>
