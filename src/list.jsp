<%@ page contentType="text/html;charset=gbk" 
    import="java.util.*"%>
<html>
 <head>
   <title>���ύ����</title>
    <link href="css/generalstyle.css" type="text/css" rel="stylesheet">
 </head>
 <body>
   <% String title = "���ύ�����б�"; %>
   <%@ include file="title.jsp" %>
   <%Vector<String[]> list = (Vector<String[]>)request.getAttribute("list");//�õ����ύ�����б�
    if(list==null||list.size()==0){//�����б�Ϊ��
      out.println("<center>");
      out.println("<font color=red size=5>����û��Ԥ������������</font>");
      out.println("<br><br><a href=main.jsp>����");
    }else{%>
  <table align="center" cellspacing="1" bgcolor="black" width="70%">
	 <tr width="60%" height="30" bgcolor="white">
	   <th>���</th>      <th>�¶���</th>
	   <th>�ύʱ��</th>  <th>״̬</th>
	   <th>������</th>    <th>����</th> <th>��ע</th>   
	 </tr>
	   <%int color = 0;
	  	 for(int i=0;i<list.size();i++){//���������б������ʾ
		   String[] s = list.get(i);%>
     <tr bgcolor=<%= color%2==0?"eeffee":"ffeeee" %> height="40">
	   <td align="center"><%= s[0] %></td> <td align="center"><%= s[1] %></td>
	   <td align="center"><%= s[2] %></td> <td align="center"><%= s[4] %></td>
	   <td align="center"><%= s[3] %></td>
	   <td align="center">
	    <a target="blank" href=OrderServlet?action=ListDetail&&oid=<%= s[0] %>>��������</a>
	   </td>
	   <td align="center"><%= s[5] %></td>	   
	</tr><%color++;}%>
   </table><%}%>
 </body>
</html>