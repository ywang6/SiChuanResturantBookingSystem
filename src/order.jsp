<%@ page contentType="text/html;charset=gbk"
    import="wyf.wyy.*"%>
<table align="center" width="80%" border="0" bgcolor="CAD9D9">
 <form action="OrderServlet" name="order" method="post">
  <tr>
    <td align="right">���:</td><td>
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
   <td align="right">���:</td>
   <td>
      <input type="text" name="group" value=<%= gName %> size="5">
   </td>
  </tr>
      <%Date now = new Date();//�õ���ǰʱ�����
  	    int year = now.getYear()+1900;//�õ���ǰ���
  	    int month = now.getMonth()+1;//�õ���ǰ�·�
  	    int day = now.getDate();//�õ���ǰ����
  	    int hour = now.getHours();//�õ���ǰСʱ
  	  %>
  <%@ include file="ftime.jsp" %>
  <%@ include file="etime.jsp" %>
  <tr>
   <td colspan="3" align="center">
      <input type="hidden" name="action" value="ADD">
      <input type="submit" name="add" value="��ӵ�����">
   </td>
  </tr>
  </form>
</table>