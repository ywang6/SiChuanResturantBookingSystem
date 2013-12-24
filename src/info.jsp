<%@ page contentType="text/html;charset=gbk" 
    import="java.util.*"%>
<html>
 <head>
   <title>º£´¨¾Æµê»¶Ó­Äú</title>
   <link href="css/generalstyle.css" type="text/css" rel="stylesheet">
 </head>
 <body>
   <% String title = "º£´¨¾Æµê»¶Ó­Äú";%>
   <%@ include file="title.jsp" %>
	<center>
	 <font color="red" size="4.5">
     <%String message=(String)request.getAttribute("msg");
     	if(message!=null) {out.println(message);}//Êä³öÏûÏ¢%>
	</center>
 </body>
</html>