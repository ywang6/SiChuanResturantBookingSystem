<%@ page contentType="text/html;charset=gbk"%>
<link href="css/generalstyle.css" type="text/css" rel="stylesheet">
<table align=center border="0" width="80%" height=20 cellpadding="2">
  <tr align="center">
	<td height=15 bgcolor="#3388ee">
	   <font color="#f7f7f7" size="4"><%= title %></font>
	</td>
  </tr>
  <tr>
   <td align="center">
     <%String uname = (String)session.getAttribute("uname");
	   String msg = "";
	   if(uname!=null)//登陆的情况
	   {msg=uname+"您好，今天是："+new Date().toLocaleString();}
	   else//没有登陆的情况
	   {msg="游客您好，今天是："+new Date().toLocaleString();}%>
	<marquee width=800><%= msg %></marquee>
   </td>
  </tr>
  <tr>
    <td>
     <a href="main.jsp">主页</a>&nbsp;&nbsp;&nbsp;&nbsp;
     <a href="myOrder.jsp">当前订单</a>&nbsp;&nbsp;&nbsp;&nbsp;
     <a href=OrderServlet?action=order>已提交订单</a>
    </td>
  </tr>
</table>