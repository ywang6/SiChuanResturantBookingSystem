<%@ page contentType="text/html;charset=gbk"%>
<table align="center" cellspacing="1" bgcolor="black" width="80%">
  <tr width="60%" height="30" bgcolor="white">
	<th>编号</th> 	<th>规格</th> 	<th>价格?/时段</th> 
	<th>描述</th>	<th>状态</th>
  </tr>
   <% Vector<String[]> v=DB.getPageContent(currPage,span,group);
      int totalPage=DB.getTotal(span,group);//得到总页数
 		  int color=0;//改变每行颜色
  	  for(String[] s:v){%>
  <tr bgcolor=<%= color%2==0?"eeffee":"ffeeee" %>>
	<td align="center"><%=s[0]%></td>
	<td align="center"><%=s[1]%></td>
	<td align="center"><font color="red" size="3"><%=s[2]%>￥</font></td>
	<td align="center"><%=s[3]%></td>
	<td>
	  <a target="blank" href=ListServlet?action=status&&rgid=<%= s[0] %>>查看</a>
	</td>
  </tr>
	<%color++;}%>
</table>
<table width="80%" align="center" border="0">
  <tr>
  <td width="33%">
   <%if(currPage>1){//如果当前页不是第一页%>
   <a href=groupList.jsp?cp=<%= currPage-1 %>><<上一页</a>
   <%}%>&nbsp;
  </td>
  <form action=groupList.jsp method="post">
  <td align="center"><br>
   <select name="cp" onchange="this.form.submit();">
    <% for(int i=1;i<=totalPage;i++){
       String s="";
       if(i==currPage){s="selected";}//始终显示的是当前页%>
     <option value="<%= i %>" <%= s %>>第<%= i %>页</option>
	 <%}%>
   </select>
  </td>
  </form>   
   <td align="right" width="33%">
    <%if(currPage<totalPage){//当前页小于总页数 %>
    <a href=groupList.jsp?cp=<%= currPage+1 %>>下一页>></a>
     <%}%>
   </td>
  </tr>
</table>