<script language="JavaScript">
  function checkInfo(){
     if(document.changeMyInfo.telNum.value==""){
       alert("�������ֻ��ţ�����");
       changeMyInfo.telNum.focus(); 
       return false;
     }
     if(document.changeMyInfo.email.value==""){
       alert("���������䣡����");
       changeMyInfo.email.focus(); 
       return false;
     }
     document.changeMyInfo.submit();
  }
 </script>
<%@ page contentType="text/html;charset=gbk"%>
<table align="center" border="0" width="80%">	
  <tr>
	 <td align="right" width="40%">�û���:</td>
	 <td><%= uname %></td>
  </tr>
 <form name="changeMyInfo" action="RegAndLoginServlet" method="post">
  <tr>
	<td align="right" width="40%">�绰����:</td>
	<td>
	 <input type="text" name="telNum" value=<%=telNum%>> 
	</td>
   </tr>
	
   <tr>	
	 <td align="right" width="40%">��ʵ����:</td>
	 <td>
	  <input type="text" name="realName" value=<%=realName%>>
	 </td>
   </tr>
	
   <tr>	
	 <td align="right" width="40%">�Ա�:</td>
	 <td>
	 <% 
	   if(gender.equals("��"));
	   {
	 %>
	     <input type="radio" name="gender" value="��" checked>��
	     <input type="radio" name="gender" value="Ů">Ů
	  <%
	   }
	   if(gender.equals("Ů"))
	    {
	    %>
	      <input type="radio" name="gender" value="��">��
	      <input type="radio" name="gender" value="Ů" checked>Ů
	   <%
	   }
	   %>
	 </td>
	</tr>
	
	<tr>	
	  <td align="right" width="40%">����:</td>
	  <td>
	   <input type="text" name="email" value=<%=email%>> 
	  </td>
	</tr>
	
	<tr>
	 <td align="center" colspan="2">
	  <input type="hidden" name="action" value="changeMyInfo">
	  <input type="button" value="�޸�" onclick="checkInfo()">
	 </td>
	</tr>	
   </form>
 </table>