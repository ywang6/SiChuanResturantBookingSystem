<%@ page contentType="text/html;charset=gbk"
    import="java.util.*,wyf.wyy.*"%>
 <html>
  <head>
   <title>��Դ����</title>
   <link href="css/generalstyle.css" type="text/css" rel="stylesheet">
  </head>
 <body>
    <%@ include file="adminRestop.jsp" %>
	<% Vector<String> list = (Vector<String>)session.getAttribute("list");
	   int group = Integer.parseInt(list.get(0));
	   String gName = list.get(1);//�õ�������
	   String cpStr=request.getParameter("cp");
	   int currPage=1;//����Ĭ�ϵ�ǰҳΪ��һҳ
	   if(cpStr!=null){
	 	currPage=Integer.parseInt(cpStr.trim());//�õ���ǰҳ
	    }
	   int span=5;//ÿҳ��ʾ��¼����Ϊ5��
	   int totalPage=DB.getTotal(span,group);//�õ���ҳ��
     %>
   <%@ include file="adminFenYe.jsp" %>
 </body>
</html>