<%@ page contentType="text/html;charset=gbk"
    import="java.util.*,wyf.wyy.*"%>
 <html>
  <head>
   <title>主页</title>
   <link href="css/generalstyle.css" type="text/css" rel="stylesheet">
  </head>
 <body>
   <%String title = "欢迎来到海川酒店预定中心";%>
   <%@ include file="title.jsp" %>
   <table align="left" border="0" width="9%">
	 <%if(session.getAttribute("uname")!=null){%>
	 <tr><td align="left"><a href=RegAndLoginServlet?action=logout>注销</a></td></tr>
	 <tr><td align="left"><a href="changeMyInfo.jsp">修改资料</a></td></tr>
	  <%}else{%>
	  <tr><td><a href="login.jsp">登录</a></td></tr> 
	  <tr><td><a target="blank" href="reg.jsp">注册</a></td></tr>
	  <%}%>
  </table>
	<table border="0" width="80%">
	 <%Vector<String[]> v = DB.getGroup();//从数据库得到分组信息
	   for(String []s:v){%>
	 <tr><td colspan="2" align="center"><font color="black" size="5"><%=s[0]%></td></tr>
	 <tr>
	   <td>
	     <a href=ListServlet?action=list&&gId=<%=s[3]%>>
	      <img src=<%=s[1]%> width="250" height="100" border="0"/></a>
	   </td>
	   <td align="left">
	      <font color="GREEN" size="4"><%=s[2]%></font><br/>	     
	       <a href=ListServlet?action=list&&gId=<%=s[3]%>><%="预订"+s[0]%>>></a>
	   </td>
	  </tr>
	  <%}%>
	</table>
  </body>
</html>