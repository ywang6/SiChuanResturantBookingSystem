<%@ page contentType="text/html;charset=gbk"
    import="java.util.*"
%>
 <html>
  <head>
   <title>������ҳ</title>
   <link href="css/generalstyle.css" type="text/css" rel="stylesheet">
   <script language="JavaScript">
    function Check()
    {
       if(document.adlogin.adname.value=="")
       {
         alert("����д�û���������");
         adlogin.adname.focus();
         return false;
       }
       if(document.adlogin.pwd.value=="")
       {
         alert("����д���룡����");
         adlogin.pwd.focus();
         return false;
       }
       document.adlogin.submit();
    }
   </script>
  </head>
 <body>
   <%@ include file="admintop.jsp" %>
	<br><br><br>
	<table align="center" border="0" width="40%" bgcolor="aabbcc">
	 <form  name="adlogin" action="RegAndLoginServlet" method="post">
	     <tr height=20></tr>
		 <tr>
		  <td align="right" width="40%">�û���:</td>
		  <td colspan="2" width="60%">
		  	 <input type="text" name="adname" size="20">		    
		  </td>
		 </tr>
		  <tr>
		  <td align="right" width="40%">����:</td>
		  <td colspan="2" width="60%">
		  	 <input type="password" name="pwd" size="20">		     
		  </td>
		 </tr>
		 <tr>
		  <td align="right">
		   <input type="hidden" name="action" value="adlogin">	
		   <input type="button" value="��¼" onclick="Check()">
		  </td>		 
		  <td align="left">
		   &nbsp;&nbsp;&nbsp;&nbsp;
		   <input type="reset" value="����">		   
		  </td>
		 </tr>
	  </form>
	 </table>
 </body>
</html>