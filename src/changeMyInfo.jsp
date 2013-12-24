<%@ page contentType="text/html;charset=gbk"
    import="java.util.*,wyf.wyy.*"%>
<html>
 <head><title>修改资料</title></head>
 <body>
   <table align=center border="0" width="80%" height=20 cellpadding="2">
	 <tr align="center"> <td width=100% height=15 bgcolor="#3388ee">
	     <font color="#f7f7f7" size="4">修改资料</font>
	  </td></tr>
	</table>
	<%String uname=(String)session.getAttribute("uname");
	  if(uname!=null){
		Vector<String> v = DB.getUserInfo(uname);//得到登陆用户详细信息
		String telNum=v.get(0);//得到用户电话号码
		String realName=v.get(1);//得到用户真实姓名
		String gender=v.get(2);//得到用户性别
		String email=v.get(3);%>
  <%@ include file="changeInfo.jsp" %>
	<%@ include file="changePwd.jsp" %>	
	<%}else{%>
	  <center>
	   <font color="rdn" size="5"><br>对不起，您操作超时，请重新登陆。
	  </center>
	<%}%>
 </body>
</html>