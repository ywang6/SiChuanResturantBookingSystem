<%@ page contentType="text/html;charset=gbk"
    import="java.util.*,wyf.wyy.*"
%>
 <html>
  <head>
   <title>����Ա�޸�����</title>
   <link href="css/generalstyle.css" type="text/css" rel="stylesheet">
   <script language="javascript">
    function check()
    { 
      if(document.changePwd.adname.value=="")
      {
         alert("����д��¼��������");
         changePwd.adname.focus();
         return false;
      }
      if(document.changePwd.adpwd.value=="")
      {
         alert("����д��½���룡����");
         changePwd.adpwd.focus();
         return false;
      }
      if(document.changePwd.newPwd.value=="")
      {
         alert("����д�����룡����");
         changePwd.newPwd.focus();
         return false;         
      }
      if(document.changePwd.newPwd.value!=document.changePwd.reNewPwd.value)
       {
         alert("�����������벻һ�����������룡����");
         changePwd.newPwd.value="";
         changePwd.reNewPwd.value="";
         changePwd.newPwd.focus();
         return false;
       }
       document.changePwd.submit();
    }
   </script>
  </head>
 <body>
    <%@ include file="admintop.jsp" %>
    <hr width="100%"></hr><br>
    <table align="center" border="0" width="40%">
     <form name="changePwd" action="ListServlet" method="post">
      <tr bgcolor="eeffee">
       <td align="right">��¼��</td>
       <td><input type="text" name="adname" size="20"></td>
      </tr>
      <tr bgcolor="ffeeff">
       <td align="right">��½����</td>
       <td><input type="password" name="adpwd" size="20"></td>
      </tr>
      <tr bgcolor="eeffee">
       <td align="right">������</td>
       <td><input type="password" name="newPwd" size="20"></td>
      </tr>
      <tr bgcolor="ffeeff">
       <td align="right">�ٴ�����������</td>
       <td><input type="password" name="reNewPwd" size="20"></td>
      </tr>
      <tr bgcolor="eeffee">
       <td></td>
       <td>
        <input type="hidden" name="action" value="changePwd">
        <input type="button" value="�޸�" onclick="check()">
       </td>
      </tr>
     </form>
    </table>    
 </body>
</html>