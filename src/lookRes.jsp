<%@ page contentType="text/html;charset=gbk"
    import="java.util.*"%>
<html>
 <head>
 <%Vector<String[]> v = (Vector<String[]>)request.getAttribute("v");
     String title = "���"+(String)request.getAttribute("rgid");
     String isOrdered = (String)request.getAttribute("isOrdered");%>
   <title>Ԥ��<%= title %>�б�</title>
   <link href="css/generalstyle.css" type="text/css" rel="stylesheet">
 </head>
 <body>
   <%@ include file="title.jsp" %>
   <% if(isOrdered.trim().equals("YES")){
      out.println("<center>");
      out.println("<font color=red size=5>�Ѿ�Ԥ������������Ԥ����<br><br><br>");
      out.println("<a href=groupList.jsp>�����ٿ���������");
      out.println("</center>");
     }
     else{
     if(v.size()==0){
     		 out.println("<center>");
	       out.println("<font color=red size=5>δ��������û�ж���<br><br><br>");
	       out.println("<a href=groupList.jsp>����");
	       out.println("</center>");
	     }
	     else{%>
     <table align="center" width="80%" border="1" bgcolor="green">
      <tr>
       <th>��ʼʱ��</th>  <th>����ʱ��</th> <th>״̬</th>
      </tr>
     <%for(String s[]:v){%>
      <tr>
       <td align="center"><%= s[0] %></td> <td align="center"><%= s[1] %></td>
       <td align="center">��Ԥ��</td>
      </tr><%}%>
    </table><%}}%>
 </body>
</html>