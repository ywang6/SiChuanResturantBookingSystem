<%@ page contentType="text/html;charset=gbk"
    import="java.util.*" %>
 <html>
  <head>
   <title>�û���¼</title>
   <link href="css/generalstyle.css" type="text/css" rel="stylesheet">
   <script language="JavaScript">
    function Check()
    {
       if(document.login.uname.value=="")
       {
         alert("����д�û���������");
         login.uname.focus();
         return false;
       }
       if(document.login.pwd.value=="")
       {
         alert("����д���룡����");
         login.pwd.focus();
         return false;
       }
       document.login.submit();
    }
   </script>
  </head>
  <body>
	<% String title = "�û���¼"; %>
	<%@ include file="title.jsp" %>	
	<table align="center" border="0" width="60%" bgcolor="aabbcc">
	 <form  name="login" action="RegAndLoginServlet" method="post">
	   <tr height=20></tr>
	   <tr>
	     <td align="right" width="40%">�û���:</td>
		 <td colspan="2" width="60%">
		   <input type="text" name="uname" size="20">		    
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
		   <input type="hidden" name="action" value="login">	
		   <input type="button" value="��¼" onclick="Check()">
		  </td>
		  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  	<input type="reset" value="����">
		  </td>
		</tr>
	  </form>
	 </table>
  </body>
</html>