<%@ page contentType="text/html;charset=gbk"
    import="java.util.*" %>
 <html>
  <head>
   <title>用户登录</title>
   <link href="css/generalstyle.css" type="text/css" rel="stylesheet">
   <script language="JavaScript">
    function Check()
    {
       if(document.login.uname.value=="")
       {
         alert("请填写用户名！！！");
         login.uname.focus();
         return false;
       }
       if(document.login.pwd.value=="")
       {
         alert("请填写密码！！！");
         login.pwd.focus();
         return false;
       }
       document.login.submit();
    }
   </script>
  </head>
  <body>
	<% String title = "用户登录"; %>
	<%@ include file="title.jsp" %>	
	<table align="center" border="0" width="60%" bgcolor="aabbcc">
	 <form  name="login" action="RegAndLoginServlet" method="post">
	   <tr height=20></tr>
	   <tr>
	     <td align="right" width="40%">用户名:</td>
		 <td colspan="2" width="60%">
		   <input type="text" name="uname" size="20">		    
		 </td>
	   </tr>
	   <tr>
	     <td align="right" width="40%">密码:</td>
		 <td colspan="2" width="60%">
		   <input type="password" name="pwd" size="20">		     
		 </td>
	   </tr>
	   <tr>
	     <td align="right">
		   <input type="hidden" name="action" value="login">	
		   <input type="button" value="登录" onclick="Check()">
		  </td>
		  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  	<input type="reset" value="重置">
		  </td>
		</tr>
	  </form>
	 </table>
  </body>
</html>