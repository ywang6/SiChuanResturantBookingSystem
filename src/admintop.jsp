<%@ page contentType="text/html;charset=gbk"%>
<link href="css/generalstyle.css" type="text/css" rel="stylesheet"><br>
<table align=center border="0" width="100%" height=20 >
  <tr align="center">
    <td height=15 bgcolor="#3388ee" colspan="5">
	  <font color="#f7f7f7" size="5">酒店预订管理</font>
	</td>
  </tr>
  <tr>
   <td align="center" colspan="5">
  	<%String adname = (String)session.getAttribute("adname");
  	  if(adname!=null){
  	   out.println("<marquee>管理员"+adname+"您好</marquee>");
  	   }%>
    </td>
   </tr>
</table>
<table align="center" border="0" width="80%">
  <tr>
   <td><a href="adindex.jsp">登录</a></td>
   <td><a href=RegAndLoginServlet?action=adlogout>注销</a></td>
   <td><a href=adminChangePwd.jsp>修改密码</a></td>
   <td><a href=ListServlet?action=admanage>管理员管理</a></td>
   <td><a href=ListServlet?action=adminGroup>分组管理</a></td>
   <td><a href=ListServlet?action=adminList&&gId=0>资源管理</a></td>
   <td><a href=OrderServlet?action=allOrders&&condition=1>订单管理</a></td>
  </tr>
</table>