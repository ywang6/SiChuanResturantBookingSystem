<%@ page contentType="text/html;charset=gbk" 
    import="java.util.*"%>
<html>
 <head>
   <title>�����Ƶ껶ӭ��</title>
   <link href="css/generalstyle.css" type="text/css" rel="stylesheet">
 </head>
 <body>
   <% String title = "�����Ƶ껶ӭ��";%>
   <%@ include file="title.jsp" %>
	<center>
	 <font color="red" size="4.5">
     <%String message=(String)request.getAttribute("msg");
     	if(message!=null) {out.println(message);}//�����Ϣ%>
	</center>
 </body>
</html>