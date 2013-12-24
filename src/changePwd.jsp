<script language="JavaScript">
    function checkPwd()
    {
       if(document.changePwd.currentPwd.value=="")
       {
         alert("请填写密码！！！");
         changePwd.currentPwd.focus();
         return false;
       }
       if(document.changePwd.currentPwd.value.length<6)
       {
         alert("当前密码不小于6位！！！");
         changePwd.currentPwd.focus();
         return false;
       }
       if(document.changePwd.newPwd.value=="")
       {
         alert("请输入新密码！！！");
         changePwd.newPwd.focus();
         return false;
       }
       if(document.changePwd.newPwd.value!=document.changePwd.rnewPwd.value)
       {
         alert("两次密码输入不一样，请检查输入！！！");
         changePwd.newPwd.value="";
         changePwd.rnewPwd.value="";
         changePwd.newPwd.focus();
         return false;
       }
       if(document.changePwd.newPwd.value.length<6)
       {
         alert("新密码长度不得小于6位！！！");
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
	     <font color="#f7f7f7" size="4">修改密码</font>
	  </td></tr>
  <form name="changePwd" action="RegAndLoginServlet" method="post">
	<tr>
	  <td align="right" width="40%">请输入当前密码:</td>
	  <td>
	   <input type="password" name="currentPwd"> 
	  </td>
	</tr>	
	
	<tr>
	  <td align="right" width="40%">请输入新密码:</td>
	  <td>
	   <input type="password" name="newPwd"> 
	  </td>
	</tr>
	
	<tr>
	  <td align="right" width="40%">重复新密码:</td>
	  <td>
	   <input type="password" name="rnewPwd"> 
	  </td>
	</tr>
	
	<tr>
	  <td align="center" colspan="2">
	   <input type="hidden" name="action" value="changePwd">
	   <input type="button" value="修改密码" onclick="checkPwd()"> 
	  </td>
	</tr>
  </form>
</table>