<%@ page contentType="text/html;charset=gbk"
    import="java.util.*,wyf.wyy.*"
%>
<html>
  <head>
   <title>�������</title>
   <script language="JavaScript">
    function check()
    {
      if(document.addGroup.gName.value=="")
      {
         alert("����д������������");
         addGroup.gName.focus();
         return false;
      }
      if(document.addGroup.gImg.value=="")
      {
         alert("����дͼƬURL������");
         addGroup.gImg.focus();
         return false;
      }
      if(document.addGroup.gDetail.value=="")
      {
         alert("����д������Ϣ������");
         addGroup.gDetail.focus();
         return false;
      }
      if(document.addGroup.gOrderDet.value=="")
      {
         alert("����дԤ����һЩ���򣡣���");
         addGroup.gOrderDet.focus();
         return false;
      }
      document.addGroup.submit();
    }    
   </script>
  </head>
 <body>
   <%@ include file="admintop.jsp" %><br>   
    <%
      Vector<String> ginfo = 
      	 (Vector<String>)request.getAttribute("ginfo");
 	%>
   <center>
    <font color="red" size="5.5">��������ȷ��д������Ϣ
   </center>
   <table align="center" border="0" width="60%">
    <form name="addGroup" action="ListServlet" method="post">
     <tr bgcolor="ffeeee">
      <td align="right" width="20%">����:</td>
      <td><input type="text" name="gName"></td>
     </tr>
     
     <tr>
      <td align="right">ͼƬURL:</td>
      <td><input type="text" name="gImg"></td>
     </tr>
     
     <tr bgcolor="ffeeee">
      <td align="right">����:</td>
      <td>
        <textarea rows=6 cols=50 name="gDetail"></textarea>
      </td>
     </tr>
     <tr>
      <td align="right">����:</td>
      <td>
        <textarea rows=6 cols=50 name="gOrderDet"></textarea>
      </td>
     </tr>
     <tr bgcolor="ffeeee"><td></td>
      <td align="left">
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <input type="hidden" name="action" value="addGroup"> 
       <input type="button" value="���" onclick="check()">
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <input type="reset" value="����">
      </td>
     </tr>
    </form>
   </table><br>
 </body>
</html>