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
	   if(uname!=null)//��½�����
	   {msg=uname+"���ã������ǣ�"+new Date().toLocaleString();}
	   else//û�е�½�����
	   {msg="�ο����ã������ǣ�"+new Date().toLocaleString();}%>
	<marquee width=800><%= msg %></marquee>
   </td>
  </tr>
  <tr>
    <td>
     <a href="main.jsp">��ҳ</a>&nbsp;&nbsp;&nbsp;&nbsp;
     <a href="myOrder.jsp">��ǰ����</a>&nbsp;&nbsp;&nbsp;&nbsp;
     <a href=OrderServlet?action=order>���ύ����</a>
    </td>
  </tr>
</table>