<%@ page contentType="text/html;charset=gbk"
    import="java.util.*"%>
 <html>
  <head>
   <title>新用户注册</title>
   <link href="css/generalstyle.css" type="text/css" rel="stylesheet">
 <script language="JavaScript">
  function Check(){
     if(document.reg.uname.value==""){
       alert("请填写用户名！！！");
       reg.uname.focus(); return false;
     }
     if(document.reg.pwd.value==""){
       alert("请填写密码！！！");
       reg.pwd.focus(); return false;
     }
     if(document.reg.rpwd.value==""){
       alert("请确认密码！！！");
       reg.rpwd.focus();return false;
     }
     if(document.reg.pwd.value.length<6){
       alert("密码长度不得小于6位！！！");
       reg.pwd.value=""; reg.rpwd.value="";
       reg.pwd.focus();  return false;
     }
     if(document.reg.pwd.value!=document.reg.rpwd.value){
       alert("两次密码输入不一样，请检查输入！！！");
       reg.pwd.value="";  reg.rpwd.value="";
       reg.pwd.focus();   return false;
     }
     if(document.reg.telNum.value==""){
       alert("请输入手机号！！！");
       reg.telNum.focus(); return false;
     }
     if(document.reg.email.value==""){
       alert("请输入邮箱！！！");
       reg.email.focus(); return false;
     }document.reg.submit();
  }
 </script>
  </head>
  <body>
  <% String title = "新用户注册"; %>
	<%@ include file="title.jsp" %>
	<table align="center" border="0" width="80%">
	 <form  name="reg" action="RegAndLoginServlet" method="post">
	  <tr>
		<td align="right" width="40%">用户名:</td>
		<td colspan="2" width="60%">
		  <input type="text" name="uname" size="20">
		  <font color="red" size="2">*</font>
		</td> 
	  </tr>
	  <tr>
	    <td align="right" width="40%">密码:</td>
		<td colspan="2" width="60%">
		  <input type="password" name="pwd" size="20">
		  <font color="red" size="2">*</font>
		 </td>
	  </tr>
	  <tr>
	     <td align="right" width="40%">确认密码:</td>
		 <td colspan="2" width="60%">
		   <input type="password" name="rpwd" size="20">
		   <font color="red" size="2">*</font>
		 </td>
	   </tr>
	   <tr>
	     <td align="right" width="40%">手机号码:</td>
		 <td>
		   <input type="text" name="telNum" size="20">
	       <font color="red" size="2">*</font>
		  </td>
	    </tr>
		<tr>
		  <td align="right" width="40%">真实姓名:</td>
		  <td><input type="text" name="realName" size="20">
		 </td>
		</tr>
		<tr>
		  <td align="right" width="40%">性别:</td>
		  <td>
		   <input type="radio" name="gender" value="男" checked>男
	       <input type="radio" name="gender" value="女">女
		  </td>
		 <tr>
		  <td align="right" width="40%">邮箱:</td>
		  <td><input type="text" name="email">
	       <font color="red" size="2">*</font>
		  </td>
		 </tr>
		 <tr>
		   <td align="center" colspan="2">
		    <font color="red" size="3">注意:*所标示内容为必填！！！</font>
		   </td>
		 </tr>
		 <tr>
		   <td align="center" colspan="2">
		    <input type="hidden" name="action" value="reg"> 	
		    <input type="button" value="提交" onclick="Check()">
		      &nbsp;&nbsp;&nbsp;&nbsp;
		    <input type="reset" value="重置">
		   </td>
		  </tr>
		 </form>
	</table>	
 </body>
</html>