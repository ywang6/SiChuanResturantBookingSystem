<%@ page contentType="text/html;charset=gbk"
    import="java.util.*"%>
<script language="JavaScript">
    function check()
    {
       if(document.searchRes.rgid.value=="")
       {
         alert("�������Ų�ѯ������");
         searchRes.rgid.focus();
         return false;
       }
       document.searchRes.submit();
    }
</script>
<%@ include file="admintop.jsp" %>
  <hr width="100%"></hr><br>
   <table align="left" border="0" width="98.5%">
   <tr>    
      <td align="center">
        <a target="balnk" href="addRes.jsp">�����Դ</a>
      </td>
      <form name="searchRes" action="ListServlet" method="post">     
      <td align="right">���:	   
	    <input type="text" name="rgid">
	    <input type="button" value="��ѯ" onclick="check()">
	    <input type="hidden" name="action" value="queryRes">
	  </td>
    </form>
    </tr>
   </table><br><br><br>
   <table align="left" bgcolor="C4DCDF" width="17%" height="40%">
    <th>����</th>
    <tr>
     <td align="center">
      <a href=ListServlet?action=adminList&&gId=0>���з���</a>
     </td>
    </tr>
    <%
      Vector<String[]> vgroup = DB.getGroup();//�õ�������Ϣ
      for(String[] s:vgroup){%>
    <tr><td align="center">
      <a href=ListServlet?action=adminList&&gId=<%=s[3]%>><%= s[0] %></a> 
    </td></tr>
     <%}%>
</table>