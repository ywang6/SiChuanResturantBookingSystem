<%@ page contentType="text/html;charset=gbk"%>
<table align="center" cellspacing="1" bgcolor="black" width="80%">
  <tr width="60%" height="30" bgcolor="white">
	<th>���</th> 	<th>���</th> 	<th>�۸�?/ʱ��</th> 
	<th>����</th>	<th>״̬</th>
  </tr>
   <% Vector<String[]> v=DB.getPageContent(currPage,span,group);
      int totalPage=DB.getTotal(span,group);//�õ���ҳ��
 		  int color=0;//�ı�ÿ����ɫ
  	  for(String[] s:v){%>
  <tr bgcolor=<%= color%2==0?"eeffee":"ffeeee" %>>
	<td align="center"><%=s[0]%></td>
	<td align="center"><%=s[1]%></td>
	<td align="center"><font color="red" size="3"><%=s[2]%>��</font></td>
	<td align="center"><%=s[3]%></td>
	<td>
	  <a target="blank" href=ListServlet?action=status&&rgid=<%= s[0] %>>�鿴</a>
	</td>
  </tr>
	<%color++;}%>
</table>
<table width="80%" align="center" border="0">
  <tr>
  <td width="33%">
   <%if(currPage>1){//�����ǰҳ���ǵ�һҳ%>
   <a href=groupList.jsp?cp=<%= currPage-1 %>><<��һҳ</a>
   <%}%>&nbsp;
  </td>
  <form action=groupList.jsp method="post">
  <td align="center"><br>
   <select name="cp" onchange="this.form.submit();">
    <% for(int i=1;i<=totalPage;i++){
       String s="";
       if(i==currPage){s="selected";}//ʼ����ʾ���ǵ�ǰҳ%>
     <option value="<%= i %>" <%= s %>>��<%= i %>ҳ</option>
	 <%}%>
   </select>
  </td>
  </form>   
   <td align="right" width="33%">
    <%if(currPage<totalPage){//��ǰҳС����ҳ�� %>
    <a href=groupList.jsp?cp=<%= currPage+1 %>>��һҳ>></a>
     <%}%>
   </td>
  </tr>
</table>