<%@ page contentType="text/html;charset=gbk"
    import="java.util.*,wyf.wyy.*"
%>
 <html>
  <head>
   <title>��Դ����</title>
   <link href="css/generalstyle.css" type="text/css" rel="stylesheet">
  </head>
 <body>
   <%@ include file="adminRestop.jsp" %>
    <%
      Vector<String[]> res = 
      	 (Vector<String[]>)request.getAttribute("list");
     if(res==null||res.size()==0)
     {
       out.println("<center>");
	   out.println("<font color=red size=5>û�д���Դ</font>");
	   out.println("<br><br><a href="
	     +"ListServlet?action=adminList&&gId=room>����</a></center>");
     }
     else
     {
    %>
    <table align="center" width="80%" cellspacing="1" bgcolor="black">
     <tr width="60%" height="30" bgcolor="white">
		<th>���</th>
		<th>���</th>
		<th>���</th>
		<th>�۸�?/ʱ��</th>
		<th>����</th>
		<th>״̬</th>
		<th>�޸�/ɾ��</th>
	 </tr>
	 <% 
	    int color=0;//�ı�ÿ����ɫ
	 	for(String []s:res)
	    {
	  %>
	  <tr bgcolor=<%= color%2==0?"eeffee":"ffeeee" %>>
	   <td align="center"><%= s[0] %></td>
	   <td align="center"><%= s[7] %></td>
	   <td align="center"><%= s[1] %></td>
	   <td align="center"><%= s[2] %>��</td>
	   <td align="center"><%= s[3] %></td>
	   <td align="center"><%= s[4] %></td>
	   <td><a href=ListServlet?action=edit&&rid=<%= s[6] %>>�޸�/ɾ��</a></td>
	  </tr>
	  <%
	       color++;
	     }
	  }
	   %>
 </body>
</html>