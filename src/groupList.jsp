<%@ page contentType="text/html;charset=gbk"
    import="java.util.*,wyf.wyy.*"%>
<% Vector<String> list = (Vector<String>)session.getAttribute("list");
   int group = Integer.parseInt(list.get(0));//得到分组的ID
   String gName = list.get(1);//得到分组的名字
   String gOrderDet = list.get(2);//得到分组的预订规则
   String cpStr=request.getParameter("cp");//得到当前页的页码
   String title = gName+"列表";//拼装横幅显示字符串
   //如果得到当前页码的字符串为null，则设置页码为第一页
   int currPage=1;
   if(cpStr!=null){currPage=Integer.parseInt(cpStr.trim());}
   int span=5;//设置每页显示记录数为5条
%>
<html>
 <head>
   <title>预订<%= gName %>列表</title>
   <link href="css/generalstyle.css" type="text/css" rel="stylesheet">
 </head>
 <body>
	<%@ include file="title.jsp" %>
	<%@ include file="fenye.jsp" %>	
	<table align="center" border="0" width="80%">
     <tr>
      <td colspan="4" align="letf">
        <font color="red" size="4">
			预订<%= gName %>注意事项：<br>
			1.确保您注册时填写的电话和邮箱的正确性和可用性，我们会在您发出订单后
			  以这样的方式与您联系，处理订单相关事宜，对您成功预订有关键作用。<br>
			2.只有注册登录的用户才能预订。<br>
			3.<%= gOrderDet %>
		 </font>
	  </td>
	 </tr>
   </table>
   <%@ include file="order.jsp" %>	
 </body>
</html>