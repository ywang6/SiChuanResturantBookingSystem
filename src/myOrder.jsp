<%@ page contentType="text/html;charset=gbk" 
    import="java.util.*"%>
<html>
 <head><title>�ҵĶ���</title></head>
 <body>
   <% String title = "������ϸ";%>
   <%@ include file="title.jsp"%>
   <%Vector<String[]> OrderList=(Vector<String[]>)session.getAttribute("OrderList");
     if(OrderList==null||OrderList.size()==0){//����Ϊ��
      out.println("<center>");
      out.println("<font color=red size=5>��ǰ��û��Ԥ������������</font>");
      out.println("<br><br><a href=main.jsp>����");
     }else{%>
   <table align="center" cellspacing="1" bgcolor="black" width="80%">
	 <tr width="60%" height="30" bgcolor="white">
	   <th>���</th>      <th>���</th>      <th>��ʼʱ��</th>  
	   <th>����ʱ��</th>  <th>ɾ������</th>
	 </tr>
	   <%int color = 0;
	  	 for(int i=0;i<OrderList.size();i++){
		     String[] s = OrderList.get(i);%>
     <tr bgcolor=<%= color%2==0?"eeffee":"ffeeee" %> height="40">
	   <td align="center"><%=s[0]%></td> <td align="center"><%=s[1]%></td>
	   <td align="center"><%=s[2]%></td> <td align="center"><%=s[3]%></td>
	   <td align="center" bgcolor="white"><br>
	     <form action="OrderServlet" name="deleteOrder" method="post">
	      <input type="hidden" name="index" value=<%= i %>>
	      <input type="hidden" name="action" value="DELETE">
	      <input type="submit" value="ɾ��">
	     </form>
	    </td>
	  </tr>
		 <%color++;}%>
	  <tr bgcolor="white">
	    <td align="center" colspan="2"><br>
	     <form action="OrderServlet" name="removeAll" method="post">
	      <input type="hidden" name="action" value="REMOVE">
	      <input type="submit" value="��ն���">
	     </form>
	    </td>
	    <td align="center" colspan="2"><br>
	      <form action="OrderServlet" name="submitOrder" method="post">
	       <input type="hidden" name="action" value="SUBMIT">
	       <input type="submit" value="�ύ����">
	      </form>
	    </td>
	    <td align="center"><a href="main.jsp">����Ԥ��>></a></td>
      </tr>
 </table><%}%>
 </body>
</html>