<%@ page contentType="text/html;charset=gbk"
    import="wyf.wyy.*"%>
<table align="center" width="80%" border="0" bgcolor="CAD9D9">
 <form action="OrderServlet" name="order" method="post">
  <tr>
    <td align="right">编号:</td><td>
      <select name="orderNum">
        <%for(String[]s:v){
           if(Order_DB.isOrdered(s[0]))
           continue;
        %>
        <option><%= s[0]%></option>
        <%}%>
      </select>
   </td>
  </tr>
  <tr>
   <td align="right">类别:</td>
   <td>
      <input type="text" name="group" value=<%= gName %> size="5">
   </td>
  </tr>
      <%Date now = new Date();//得到当前时间对象
  	    int year = now.getYear()+1900;//得到当前年份
  	    int month = now.getMonth()+1;//得到当前月份
  	    int day = now.getDate();//得到当前日期
  	    int hour = now.getHours();//得到当前小时
  	  %>
  <%@ include file="ftime.jsp" %>
  <%@ include file="etime.jsp" %>
  <tr>
   <td colspan="3" align="center">
      <input type="hidden" name="action" value="ADD">
      <input type="submit" name="add" value="添加到订单">
   </td>
  </tr>
  </form>
</table>