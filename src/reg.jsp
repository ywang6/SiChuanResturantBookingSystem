<%@ page contentType="text/html;charset=gbk"
    import="java.util.*"%>
 <html>
  <head>
   <title>���û�ע��</title>
   <link href="css/generalstyle.css" type="text/css" rel="stylesheet">
 <script language="JavaScript">
  function Check(){
     if(document.reg.uname.value==""){
       alert("����д�û���������");
       reg.uname.focus(); return false;
     }
     if(document.reg.pwd.value==""){
       alert("����д���룡����");
       reg.pwd.focus(); return false;
     }
     if(document.reg.rpwd.value==""){
       alert("��ȷ�����룡����");
       reg.rpwd.focus();return false;
     }
     if(document.reg.pwd.value.length<6){
       alert("���볤�Ȳ���С��6λ������");
       reg.pwd.value=""; reg.rpwd.value="";
       reg.pwd.focus();  return false;
     }
     if(document.reg.pwd.value!=document.reg.rpwd.value){
       alert("�����������벻һ�����������룡����");
       reg.pwd.value="";  reg.rpwd.value="";
       reg.pwd.focus();   return false;
     }
     if(document.reg.telNum.value==""){
       alert("�������ֻ��ţ�����");
       reg.telNum.focus(); return false;
     }
     if(document.reg.email.value==""){
       alert("���������䣡����");
       reg.email.focus(); return false;
     }document.reg.submit();
  }
 </script>
  </head>
  <body>
  <% String title = "���û�ע��"; %>
	<%@ include file="title.jsp" %>
	<table align="center" border="0" width="80%">
	 <form  name="reg" action="RegAndLoginServlet" method="post">
	  <tr>
		<td align="right" width="40%">�û���:</td>
		<td colspan="2" width="60%">
		  <input type="text" name="uname" size="20">
		  <font color="red" size="2">*</font>
		</td> 
	  </tr>
	  <tr>
	    <td align="right" width="40%">����:</td>
		<td colspan="2" width="60%">
		  <input type="password" name="pwd" size="20">
		  <font color="red" size="2">*</font>
		 </td>
	  </tr>
	  <tr>
	     <td align="right" width="40%">ȷ������:</td>
		 <td colspan="2" width="60%">
		   <input type="password" name="rpwd" size="20">
		   <font color="red" size="2">*</font>
		 </td>
	   </tr>
	   <tr>
	     <td align="right" width="40%">�ֻ�����:</td>
		 <td>
		   <input type="text" name="telNum" size="20">
	       <font color="red" size="2">*</font>
		  </td>
	    </tr>
		<tr>
		  <td align="right" width="40%">��ʵ����:</td>
		  <td><input type="text" name="realName" size="20">
		 </td>
		</tr>
		<tr>
		  <td align="right" width="40%">�Ա�:</td>
		  <td>
		   <input type="radio" name="gender" value="��" checked>��
	       <input type="radio" name="gender" value="Ů">Ů
		  </td>
		 <tr>
		  <td align="right" width="40%">����:</td>
		  <td><input type="text" name="email">
	       <font color="red" size="2">*</font>
		  </td>
		 </tr>
		 <tr>
		   <td align="center" colspan="2">
		    <font color="red" size="3">ע��:*����ʾ����Ϊ�������</font>
		   </td>
		 </tr>
		 <tr>
		   <td align="center" colspan="2">
		    <input type="hidden" name="action" value="reg"> 	
		    <input type="button" value="�ύ" onclick="Check()">
		      &nbsp;&nbsp;&nbsp;&nbsp;
		    <input type="reset" value="����">
		   </td>
		  </tr>
		 </form>
	</table>	
 </body>
</html>