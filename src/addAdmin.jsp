<%@ page contentType="text/html;charset=gbk"
    import="java.util.*,wyf.wyy.*"
%>
 <html>
  <head>
   <title>��ӹ���Ա</title>
   <link href="css/generalstyle.css" type="text/css" rel="stylesheet">
   <script language="javascript">
    function check()
    { 
      if(document.addAdmin.adname.value=="")
      {
         alert("����д��¼��������");
         addAdmin.adname.focus();
         return false;
      }
      if(document.addAdmin.adpwd.value=="")
      {
         alert("����д��½���룡����");
         addAdmin.adpwd.focus();
         return false;
      }
      if(document.addAdmin.repwd.value=="")
      {
         alert("���ظ����룡����");
         addAdmin.repwd.focus();
         return false;
      }
      if(document.addAdmin.adpwd.value!=document.addAdmin.repwd.value)
       {
         alert("�����������벻һ�����������룡����");
         addAdmin.adpwd.value="";
         addAdmin.repwd.value="";
         addAdmin.adpwd.focus();
         return false;
       }
       document.addAdmin.submit();
    }
   </script>
  </head>
 <body>
    <%@ include file="admintop.jsp" %>
    <hr width="100%"></hr><br>
    <table align="center" border="0" width="40%">
     <form name="addAdmin" action="ListServlet" method="post">
      <tr bgcolor="eeffee">
       <td align="right">��¼��</td>
       <td><input type="text" name="adname" size="20"></td>
      </tr>
      <tr bgcolor="ffeeff">
       <td align="right">��½����</td>
       <td><input type="password" name="adpwd" size="20"></td>
      </tr>
      <tr bgcolor="eeffee">
       <td align="right">�ظ�����</td>
       <td><input type="password" name="repwd" size="20"></td>
      </tr>
      <tr bgcolor="ffeeff">
       <td></td>
       <td>
        <input type="hidden" name="action" value="addAdmin">
        <input type="button" value="���" onclick="check()">
       </td>
      </tr>
     </form>
    </table>    
 </body>
</html>