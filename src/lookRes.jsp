<%@ page contentType="text/html;charset=gbk"
    import="java.util.*"%>
<html>
 <head>
 <%Vector<String[]> v = (Vector<String[]>)request.getAttribute("v");
     String title = "编号"+(String)request.getAttribute("rgid");
     String isOrdered = (String)request.getAttribute("isOrdered");%>
   <title>预订<%= title %>列表</title>
   <link href="css/generalstyle.css" type="text/css" rel="stylesheet">
 </head>
 <body>
   <%@ include file="title.jsp" %>
   <% if(isOrdered.trim().equals("YES")){
      out.println("<center>");
      out.println("<font color=red size=5>已经预订，您不可以预订。<br><br><br>");
      out.println("<a href=groupList.jsp>返回再看看？？？");
      out.println("</center>");
     }
     else{
     if(v.size()==0){
     		 out.println("<center>");
	       out.println("<font color=red size=5>未来七天内没有订单<br><br><br>");
	       out.println("<a href=groupList.jsp>返回");
	       out.println("</center>");
	     }
	     else{%>
     <table align="center" width="80%" border="1" bgcolor="green">
      <tr>
       <th>开始时间</th>  <th>结束时间</th> <th>状态</th>
      </tr>
     <%for(String s[]:v){%>
      <tr>
       <td align="center"><%= s[0] %></td> <td align="center"><%= s[1] %></td>
       <td align="center">被预订</td>
      </tr><%}%>
    </table><%}}%>
 </body>
</html>