<%@ page contentType="text/html;charset=gbk" 
    import="java.util.*"%>
<html>
 <head>
   <title>已提交订单</title>
    <link href="css/generalstyle.css" type="text/css" rel="stylesheet">
 </head>
 <body>
   <% String title = "已提交订单列表"; %>
   <%@ include file="title.jsp" %>
   <%Vector<String[]> list = (Vector<String[]>)request.getAttribute("list");//得到已提交订单列表
    if(list==null||list.size()==0){//订单列表为空
      out.println("<center>");
      out.println("<font color=red size=5>您还没有预订订单！！！</font>");
      out.println("<br><br><a href=main.jsp>返回");
    }else{%>
  <table align="center" cellspacing="1" bgcolor="black" width="70%">
	 <tr width="60%" height="30" bgcolor="white">
	   <th>编号</th>      <th>下订人</th>
	   <th>提交时间</th>  <th>状态</th>
	   <th>处理人</th>    <th>详情</th> <th>备注</th>   
	 </tr>
	   <%int color = 0;
	  	 for(int i=0;i<list.size();i++){//遍历订单列表进行显示
		   String[] s = list.get(i);%>
     <tr bgcolor=<%= color%2==0?"eeffee":"ffeeee" %> height="40">
	   <td align="center"><%= s[0] %></td> <td align="center"><%= s[1] %></td>
	   <td align="center"><%= s[2] %></td> <td align="center"><%= s[4] %></td>
	   <td align="center"><%= s[3] %></td>
	   <td align="center">
	    <a target="blank" href=OrderServlet?action=ListDetail&&oid=<%= s[0] %>>订单详情</a>
	   </td>
	   <td align="center"><%= s[5] %></td>	   
	</tr><%color++;}%>
   </table><%}%>
 </body>
</html>