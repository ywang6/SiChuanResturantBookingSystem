<%@ page contentType="text/html;charset=gbk"%>
<link href="css/generalstyle.css" type="text/css" rel="stylesheet"><br>
<table align=center border="0" width="100%" height=20 >
  <tr align="center">
    <td height=15 bgcolor="#3388ee" colspan="5">
	  <font color="#f7f7f7" size="5">�Ƶ�Ԥ������</font>
	</td>
  </tr>
  <tr>
   <td align="center" colspan="5">
  	<%String adname = (String)session.getAttribute("adname");
  	  if(adname!=null){
  	   out.println("<marquee>����Ա"+adname+"����</marquee>");
  	   }%>
    </td>
   </tr>
</table>
<table align="center" border="0" width="80%">
  <tr>
   <td><a href="adindex.jsp">��¼</a></td>
   <td><a href=RegAndLoginServlet?action=adlogout>ע��</a></td>
   <td><a href=adminChangePwd.jsp>�޸�����</a></td>
   <td><a href=ListServlet?action=admanage>����Ա����</a></td>
   <td><a href=ListServlet?action=adminGroup>�������</a></td>
   <td><a href=ListServlet?action=adminList&&gId=0>��Դ����</a></td>
   <td><a href=OrderServlet?action=allOrders&&condition=1>��������</a></td>
  </tr>
</table>