<%@ page contentType="text/html;charset=gbk"
    import="java.util.*,wyf.wyy.*"%>
<% Vector<String> list = (Vector<String>)session.getAttribute("list");
   int group = Integer.parseInt(list.get(0));//�õ������ID
   String gName = list.get(1);//�õ����������
   String gOrderDet = list.get(2);//�õ������Ԥ������
   String cpStr=request.getParameter("cp");//�õ���ǰҳ��ҳ��
   String title = gName+"�б�";//ƴװ�����ʾ�ַ���
   //����õ���ǰҳ����ַ���Ϊnull��������ҳ��Ϊ��һҳ
   int currPage=1;
   if(cpStr!=null){currPage=Integer.parseInt(cpStr.trim());}
   int span=5;//����ÿҳ��ʾ��¼��Ϊ5��
%>
<html>
 <head>
   <title>Ԥ��<%= gName %>�б�</title>
   <link href="css/generalstyle.css" type="text/css" rel="stylesheet">
 </head>
 <body>
	<%@ include file="title.jsp" %>
	<%@ include file="fenye.jsp" %>	
	<table align="center" border="0" width="80%">
     <tr>
      <td colspan="4" align="letf">
        <font color="red" size="4">
			Ԥ��<%= gName %>ע�����<br>
			1.ȷ����ע��ʱ��д�ĵ绰���������ȷ�ԺͿ����ԣ����ǻ���������������
			  �������ķ�ʽ������ϵ��������������ˣ������ɹ�Ԥ���йؼ����á�<br>
			2.ֻ��ע���¼���û�����Ԥ����<br>
			3.<%= gOrderDet %>
		 </font>
	  </td>
	 </tr>
   </table>
   <%@ include file="order.jsp" %>	
 </body>
</html>