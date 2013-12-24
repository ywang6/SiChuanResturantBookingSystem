<%@ page contentType="text/html;charset=gbk" 
    import="java.util.*"%>
<html>
 <head><title>我的订单</title></head>
 <body>
   <% String title = "订单明细";%>
   <%@ include file="title.jsp"%>
   <%Vector<String[]> OrderList=(Vector<String[]>)session.getAttribute("OrderList");
     if(OrderList==null||OrderList.size()==0){//订单为空
      out.println("<center>");
      out.println("<font color=red size=5>当前还没有预订订单！！！</font>");
      out.println("<br><br><a href=main.jsp>返回");
     }else{%>
   <table align="center" cellspacing="1" bgcolor="black" width="80%">
	 <tr width="60%" height="30" bgcolor="white">
	   <th>编号</th>      <th>类别</th>      <th>开始时间</th>  
	   <th>结束时间</th>  <th>删除订单</th>
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
	      <input type="submit" value="删除">
	     </form>
	    </td>
	  </tr>
		 <%color++;}%>
	  <tr bgcolor="white">
	    <td align="center" colspan="2"><br>
	     <form action="OrderServlet" name="removeAll" method="post">
	      <input type="hidden" name="action" value="REMOVE">
	      <input type="submit" value="清空订单">
	     </form>
	    </td>
	    <td align="center" colspan="2"><br>
	      <form action="OrderServlet" name="submitOrder" method="post">
	       <input type="hidden" name="action" value="SUBMIT">
	       <input type="submit" value="提交订单">
	      </form>
	    </td>
	    <td align="center"><a href="main.jsp">继续预订>></a></td>
      </tr>
 </table><%}%>
 </body>
</html>