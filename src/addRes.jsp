<%@ page contentType="text/html;charset=gbk"
    import="java.util.*,wyf.wyy.*"
%>
 <html>
  <head>
   <title>�����Դ</title>
   <link href="css/generalstyle.css" type="text/css" rel="stylesheet">
   <script language="JavaScript">
    function check3()
    {
       if(document.addRes.rgid.value=="")
       {
         alert("���Ϊ�գ�����");
         addRes.rgid.focus();
         return false;
       }
       if(document.addRes.rlevel.value=="")
       {
         alert("���Ϊ��");
         addRes.rlevel.focus();
         return false;
       }
       if(document.addRes.rmoney.value=="")
       {
         alert("�۸�Ϊ�գ�����");
         addRes.rmoney.focus();
         return false;
       }
       if(document.addRes.rdetail.value=="")
       {
         alert("����Ϊ�գ�����");
         addRes.rdetail.focus();
         return false;
       }
       document.addRes.submit();
    }
   </script>
  </head>
 <body>
   <%@ include file="adminRestop.jsp" %>
   <center>
    <font color="red" size="4">����ȷ��д��Դ����Ϣ</font>
   </center><br>
   <table align="center" border="0" width="60%">
    <form name="addRes" action="ListServlet" method="post">
     <tr bgcolor="ffeeee">
      <td align="right" width="20%">���:</td>
      <td><input type="text" name="rgid"></td>
     </tr>
     <tr>
      <td align="right">����:</td>
      <td>
       <select name="rgroup">
		<% 
		   for(String s[]:vgroup)
		   {
		 %>        
             <option value=<%= s[3] %>><%= s[0] %></option>
   		<%
   		   }
   		 %>
       </select>          
      </td>
     </tr>
     <tr bgcolor="ffeeee">
      <td align="right">���:</td>
      <td><input type="text" name="rlevel"></td>
     </tr>
     <tr>
      <td align="right">�۸�/ʱ��:</td>
      <td><input type="text" name="rmoney"></td>
     </tr>
     <tr bgcolor="ffeeee">
       <td align="right">����:</td>
       <td>
         <textarea rows=4 cols=40 name="rdetail"></textarea>
       </td>
     </tr>
     <tr>
      <td align="right">״̬:</td>
      <td>
       <select name="rstatus">
        <option>����</option>
        <option>ռ��</option>               
       </select>
      </td>
     </tr>
     <tr bgcolor="ffeeee"><td></td>
      <td align="left">
        <input type="hidden" name="action" value="addRes">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" value="����" onclick="check3()">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="reset" value="����">
       </td>
     </tr>
    </form>
   </table>
 </body>
</html>