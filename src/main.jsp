<%@ page contentType="text/html;charset=gbk"
    import="java.util.*,wyf.wyy.*"%>
 <html>
  <head>
   <title>��ҳ</title>
   <link href="css/generalstyle.css" type="text/css" rel="stylesheet">
  </head>
 <body>
   <%String title = "��ӭ���������Ƶ�Ԥ������";%>
   <%@ include file="title.jsp" %>
   <table align="left" border="0" width="9%">
	 <%if(session.getAttribute("uname")!=null){%>
	 <tr><td align="left"><a href=RegAndLoginServlet?action=logout>ע��</a></td></tr>
	 <tr><td align="left"><a href="changeMyInfo.jsp">�޸�����</a></td></tr>
	  <%}else{%>
	  <tr><td><a href="login.jsp">��¼</a></td></tr> 
	  <tr><td><a target="blank" href="reg.jsp">ע��</a></td></tr>
	  <%}%>
  </table>
	<table border="0" width="80%">
	 <%Vector<String[]> v = DB.getGroup();//�����ݿ�õ�������Ϣ
	   for(String []s:v){%>
	 <tr><td colspan="2" align="center"><font color="black" size="5"><%=s[0]%></td></tr>
	 <tr>
	   <td>
	     <a href=ListServlet?action=list&&gId=<%=s[3]%>>
	      <img src=<%=s[1]%> width="250" height="100" border="0"/></a>
	   </td>
	   <td align="left">
	      <font color="GREEN" size="4"><%=s[2]%></font><br/>	     
	       <a href=ListServlet?action=list&&gId=<%=s[3]%>><%="Ԥ��"+s[0]%>>></a>
	   </td>
	  </tr>
	  <%}%>
	</table>
  </body>
</html>