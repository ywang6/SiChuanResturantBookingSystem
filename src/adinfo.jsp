<%@ page contentType="text/html;charset=gbk"
    import="java.util.*"
%>
 <html>
  <head>
   <title>������Ϣ</title>
   <link href="css/generalstyle.css" type="text/css" rel="stylesheet">
  </head>
 <body>
   <%@ include file="admintop.jsp" %>
	<br><br><br>
	<center>
	 <font color="red" size="4.5">
     <% 
        request.setCharacterEncoding("gbk");
        String message=(String)request.getAttribute("msg");
     	if(message!=null)
     	{//�����Ϣ
     		out.println(message);
     	}
      %>
	</center>
 </body>
</html>