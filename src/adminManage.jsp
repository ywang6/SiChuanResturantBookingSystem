<%@ page contentType="text/html;charset=gbk"
    import="java.util.*,wyf.wyy.*"
%>
 <html>
  <head>
   <title>����Ա����</title>
   <link href="css/generalstyle.css" type="text/css" rel="stylesheet">
  </head>
 <body>
    <%@ include file="admintop.jsp" %>
    <hr width="100%"></hr><br>
    <table align="left" border="0" width="80%">
     <tr>
      <td align="center"><a href=addAdmin.jsp>��ӹ���Ա</a></td>
      <td><a href=adResetPwd.jsp>���ù���Ա����</a></td>
     </tr>
    </table><br><br>
    <%
       Vector<String []> vadmin = DB.getAdminInfo();
       int color=0;//�ı�ÿ����ɫ 
     %>
    <table align="center" width="90%" cellspacing="1" bgcolor="black">
     <tr bgcolor="white">
       <th>����ԱID</th> <th>����Ա����</th>
       <th>ɾ��</th>   
     </tr>
      <%
      for(String []s:vadmin)
      {
     %>
      <tr bgcolor=<%= color%2==0?"eeffee":"ffeeee" %>>
        <td align="center"><%= s[0] %></td>
        <% 
        if(s[1].equals("1"))
        {
        %>
        <td align="center">��������Ա</td>
        <%
        }
        else
        {
         %>
        <td align="center">��ͨ����Ա</td>
        <% } %>        
        <td align="center">
         <a href=ListServlet?action=deleteAdmin&&adname=<%= s[0] %>>ɾ��</a>
        </td>
       </tr>
     <%
         color++;
       }
      %>
    </table>
 </body>
</html>