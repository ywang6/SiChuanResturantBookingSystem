<%@ page contentType="text/html;charset=gbk"
    import="java.util.*,wyf.wyy.*"%>
 <html>
  <head>
   <title>�������</title>
   <link href="css/generalstyle.css" type="text/css" rel="stylesheet">
  </head>
 <body>
    <%@ include file="admintop.jsp" %>
    <hr width="100%"></hr><br>
    <% Vector<String []> vgroup = DB.getGroup();
       int color=0;//�ı�ÿ����ɫ 
     %>
    <table align="center" width="90%" cellspacing="1" bgcolor="black">
     <tr bgcolor="white">
       <th>����</th>  <th>ͼƬURL</th>  <th>����</th>
       <th>����</th>  <th>�޸�/ɾ��</th>    
     </tr>     
      <%for(String []s:vgroup){%>
      <tr bgcolor=<%= color%2==0?"eeffee":"ffeeee" %>>
        <td align="center"><%= s[0] %></td>
        <td align="center"><%= s[1] %></td>
        <td align="center"><%= s[2] %></td>
        <td align="center"><%= s[4] %></td> 
        <td align="center">
         <a href=ListServlet?action=editGroup&&gId=<%= s[3] %>>�޸�/ɾ��</a>
        </td>
       </tr>
     <%color++;}
      %>
    </table><br>
    <center><a href=addGroup.jsp>��ӷ���</a></center>
 </body>
</html>