<script language="JavaScript">
    function checkPwd()
    {
       if(document.changePwd.currentPwd.value=="")
       {
         alert("����д���룡����");
         changePwd.currentPwd.focus();
         return false;
       }
       if(document.changePwd.currentPwd.value.length<6)
       {
         alert("��ǰ���벻С��6λ������");
         changePwd.currentPwd.focus();
         return false;
       }
       if(document.changePwd.newPwd.value=="")
       {
         alert("�����������룡����");
         changePwd.newPwd.focus();
         return false;
       }
       if(document.changePwd.newPwd.value!=document.changePwd.rnewPwd.value)
       {
         alert("�����������벻һ�����������룡����");
         changePwd.newPwd.value="";
         changePwd.rnewPwd.value="";
         changePwd.newPwd.focus();
         return false;
       }
       if(document.changePwd.newPwd.value.length<6)
       {
         alert("�����볤�Ȳ���С��6λ������");
         changePwd.newPwd.value="";
         changePwd.rnewPwd.value="";
         changePwd.newPwd.focus();
         return false;
       }
       document.changePwd.submit();
    }    
   </script>
<%@ page contentType="text/html;charset=gbk"%>
<table align="center" border="0" width="80%">
	<tr align="center">
		<td width=100% height=15 bgcolor="#ee5200" colspan="3">
	     <font color="#f7f7f7" size="4">�޸�����</font>
	  </td></tr>
  <form name="changePwd" action="RegAndLoginServlet" method="post">
	<tr>
	  <td align="right" width="40%">�����뵱ǰ����:</td>
	  <td>
	   <input type="password" name="currentPwd"> 
	  </td>
	</tr>	
	
	<tr>
	  <td align="right" width="40%">������������:</td>
	  <td>
	   <input type="password" name="newPwd"> 
	  </td>
	</tr>
	
	<tr>
	  <td align="right" width="40%">�ظ�������:</td>
	  <td>
	   <input type="password" name="rnewPwd"> 
	  </td>
	</tr>
	
	<tr>
	  <td align="center" colspan="2">
	   <input type="hidden" name="action" value="changePwd">
	   <input type="button" value="�޸�����" onclick="checkPwd()"> 
	  </td>
	</tr>
  </form>
</table>