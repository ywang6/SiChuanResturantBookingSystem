<%@ page contentType="text/html;charset=gbk"
    import="java.util.*,wyf.wyy.*"%>
<html>
 <head><title>�޸�����</title></head>
 <body>
   <table align=center border="0" width="80%" height=20 cellpadding="2">
	 <tr align="center"> <td width=100% height=15 bgcolor="#3388ee">
	     <font color="#f7f7f7" size="4">�޸�����</font>
	  </td></tr>
	</table>
	<%String uname=(String)session.getAttribute("uname");
	  if(uname!=null){
		Vector<String> v = DB.getUserInfo(uname);//�õ���½�û���ϸ��Ϣ
		String telNum=v.get(0);//�õ��û��绰����
		String realName=v.get(1);//�õ��û���ʵ����
		String gender=v.get(2);//�õ��û��Ա�
		String email=v.get(3);%>
  <%@ include file="changeInfo.jsp" %>
	<%@ include file="changePwd.jsp" %>	
	<%}else{%>
	  <center>
	   <font color="rdn" size="5"><br>�Բ�����������ʱ�������µ�½��
	  </center>
	<%}%>
 </body>
</html>