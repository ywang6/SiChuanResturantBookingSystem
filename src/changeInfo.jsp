<script language="JavaScript">
  function checkInfo(){
     if(document.changeMyInfo.telNum.value==""){
       alert("请输入手机号！！！");
       changeMyInfo.telNum.focus(); 
       return false;
     }
     if(document.changeMyInfo.email.value==""){
       alert("请输入邮箱！！！");
       changeMyInfo.email.focus(); 
       return false;
     }
     document.changeMyInfo.submit();
  }
 </script>
<%@ page contentType="text/html;charset=gbk"%>
<table align="center" border="0" width="80%">	
  <tr>
	 <td align="right" width="40%">用户名:</td>
	 <td><%= uname %></td>
  </tr>
 <form name="changeMyInfo" action="RegAndLoginServlet" method="post">
  <tr>
	<td align="right" width="40%">电话号码:</td>
	<td>
	 <input type="text" name="telNum" value=<%=telNum%>> 
	</td>
   </tr>
	
   <tr>	
	 <td align="right" width="40%">真实姓名:</td>
	 <td>
	  <input type="text" name="realName" value=<%=realName%>>
	 </td>
   </tr>
	
   <tr>	
	 <td align="right" width="40%">性别:</td>
	 <td>
	 <% 
	   if(gender.equals("男"));
	   {
	 %>
	     <input type="radio" name="gender" value="男" checked>男
	     <input type="radio" name="gender" value="女">女
	  <%
	   }
	   if(gender.equals("女"))
	    {
	    %>
	      <input type="radio" name="gender" value="男">男
	      <input type="radio" name="gender" value="女" checked>女
	   <%
	   }
	   %>
	 </td>
	</tr>
	
	<tr>	
	  <td align="right" width="40%">邮箱:</td>
	  <td>
	   <input type="text" name="email" value=<%=email%>> 
	  </td>
	</tr>
	
	<tr>
	 <td align="center" colspan="2">
	  <input type="hidden" name="action" value="changeMyInfo">
	  <input type="button" value="修改" onclick="checkInfo()">
	 </td>
	</tr>	
   </form>
 </table>