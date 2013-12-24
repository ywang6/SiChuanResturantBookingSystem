package wyf.wyy;
import java.io.*; 
import java.util.*;
import javax.servlet.*; 
import javax.servlet.http.*;
public class OrderServlet extends HttpServlet{
	public void init(ServletConfig conf) throws ServletException 
	{ //Servlet��inti��ʼ������
		super.init(conf);
	}
	public void doGet(HttpServletRequest req,HttpServletResponse res)
	throws ServletException, IOException{//doGet����
		doPost(req,res);//����doPost����
	}
	public void doPost(HttpServletRequest req,HttpServletResponse res)
	throws ServletException, IOException{
		req.setCharacterEncoding("gbk");
		res.setCharacterEncoding("gbk");		
		String action = req.getParameter("action");//�õ��������Ӧaction		
		HttpSession session=req.getSession(true);//�õ�session����
		PrintWriter pw=res.getWriter();//�õ����������
		String msg="";//������ʾ��Ϣ		
		String uname = (String)session.getAttribute("uname");//�õ���½�û���
		//��Դ�ļ���״̬
		String ostatus1 = "Ԥ����";
		String ostatus2 = "Ԥ���ɹ�";
		String ostatus3 = "Ԥ��ʧ��";
		Vector<String[]> OrderList = //�õ������б�
					(Vector<String[]>)session.getAttribute("OrderList");
		if(OrderList==null)//���Ϊ���򴴽�һ�������б����
		{OrderList = new Vector<String[]>();}		
		if(action.equals("ADD")){	
			String orderNum = (String)req.getParameter("orderNum");//�õ���Դ��		
			if(orderNum!=null){//�õ�Ԥ����ʼʱ��
				String fyear = (String)req.getParameter("fyear");
				String fmonth = (String)req.getParameter("fmonth");
				String fday = (String)req.getParameter("fday");
				String fhour = (String)req.getParameter("fhour");
				//�õ�Ԥ������ʱ��
				String eyear = (String)req.getParameter("eyear");
				String emonth = (String)req.getParameter("emonth");
				String eday = (String)req.getParameter("eday");
				String ehour = (String)req.getParameter("ehour");
				//�õ���Ԥ������Դ����
				String group = (String)req.getParameter("group");
				String ftime = fyear+"-"+fmonth+"-"+fday+"-"+fhour+":"+"00";
				String etime = eyear+"-"+emonth+"-"+eday+"-"+ehour+":"+"00";				
				String[] s = new String[4];
				s[0] = orderNum; s[1] = group;
				s[2] = ftime;    s[3] = etime;				
				OrderList.add(s);//���������뵽�����б���				
				session.setAttribute("OrderList",OrderList);//�������б�ŵ�session								
			}
			res.sendRedirect("groupList.jsp");//���ص�groupListҳ��
		}
		else if(action.equals("DELETE")){			
			String id = req.getParameter("index");//�õ�Ҫɾ���������±�			
			int index = Integer.parseInt(id);//ת��Ϊintֵ			
			OrderList.remove(index);//ɾ����ѡ�еĶ���
			res.sendRedirect("myOrder.jsp");//���ض���ҳ��
		}
		else if(action.equals("REMOVE")){		
			OrderList.removeAllElements();//�Ƴ����ж���			
			session.setAttribute("OrderList",OrderList);//�������б�Ž�session			
			res.sendRedirect("myOrder.jsp");//���ض���ҳ��			
		}
		else if(action.equals("SUBMIT")){			
			if(uname!=null){//�ж��û��Ƿ��½
				if(Order_DB.addOrder(uname,OrderList)!=-1){					
					OrderList.removeAllElements();//�ύ��ɣ���ն����б�
					msg = "�����ύ�ɹ������Ƶ껶ӭ���Ĺ���<br><br>"+
					       "<a href=main.jsp>������ҳ";//�����ɹ���Ϣ
				}
				else{
					msg = "�Բ���ϵͳ�����ύʧ�ܣ�<br><br>"+
					       "<a href=main.jsp>������ҳ";//����ʧ����Ϣ
				}			
			}
			else{//�û�û�е�½�����
				msg = "����û�е�½�����ȵ�½��<br><br>"+
				     "<a href=login.jsp>���ڵ�½>>";		
			}
			req.setAttribute("msg",msg);//����Ϣ���͵���Ϣ��ʾҳ��
			req.getRequestDispatcher("info.jsp").forward(req,res);	
		}
		else if(action.equals("order")){
			if(uname==null){//�û�û�е�½
				msg = "����û�е�½�����ȵ�½��<br><br>"+
				     "<a href=login.jsp>���ڵ�½>>";
				req.setAttribute("msg",msg);
				req.getRequestDispatcher("info.jsp").forward(req,res);
			}
			else{//��ѯ���û������ж�����Ϣ
				String sql = "select * from olist where oname='"+uname+"'";
				Vector<String []> list = Order_DB.getOrderList(sql);//ִ�в�ѯ				
				req.setAttribute("list",list);
				req.getRequestDispatcher("list.jsp").forward(req,res);
			}
		}
		else if(action.equals("ListDetail")){
			String oid = req.getParameter("oid");//�õ��������
			Vector<String []> ListDetail = Order_DB.getOrderDetail(oid);//ִ�в�ѯ				
			req.setAttribute("ListDetail",ListDetail);
			req.setAttribute("oid",oid);
			req.getRequestDispatcher("detail.jsp").forward(req,res);
		}
		
		else if(action.equals("allOrders")){//��������ѯ����
			if(session.getAttribute("adname")!=null){//����Ա�Ƿ��½
				String sql = "";//����SQL����
				int conditon = Integer.parseInt(req.getParameter("condition"));
				switch(conditon){
					case 1://1��ʾ���ж���
					sql = "select * from olist";
					break;
					case 2://2��ʾ�Ѿ�����Ķ���
					sql = "select * from olist where ostatus='"+ostatus2+"' or ostatus='"+ostatus3+"'";
					break;
					case 3://3��ʾδ����Ķ���
					sql = "select * from olist where ostatus='"+ostatus1+"'";
					break;
				}
				Vector<String []> list = Order_DB.getOrderList(sql);				
				req.setAttribute("list",list);//�������б���				
				req.getRequestDispatcher("adminOrders.jsp").forward(req,res);
			}
			else{
				msg = "���ȵ�½";//û�е�½����ʾ��Ϣ
				req.setAttribute("msg",msg);
				req.getRequestDispatcher("adinfo.jsp").forward(req,res);
			}
		}
		else if(action.equals("query")){//����Ų�ѯ����
		    Vector<String []> list = null;
		    try{
		    	int oid = Integer.parseInt(req.getParameter("oid"));
				String sql = "select * from olist where oid="+oid;
				list = Order_DB.getOrderList(sql);
		    }
		    catch(NumberFormatException nfe)//���붩���Ÿ�ʽ����ȷ
		    {list = new Vector<String []>();}//����һ���յ�����							
			req.setAttribute("list",list);
			req.getRequestDispatcher("adminOrders.jsp").forward(req,res);
		}
		else if(action.equals("dealOrder")){//������
			String adname = (String)session.getAttribute("adname");
			String reason = req.getParameter("reason");
			String ostatus = req.getParameter("ostatus");
			int oid = Integer.parseInt(req.getParameter("oid"));
			//ƴװSQL
			String sqla = "update olist set ostatus='"+ostatus+"',oreason='"+
							reason+"',odeal='"+adname+"'where oid="+oid;
			String sqlb = "update oinfo set ostatus='"+ostatus+"' where oid="+oid;			
			boolean b = DB.update(sqla,sqlb);//ִ�и���		
			if(b==true){
				msg = "��������ɹ�<br><br>"
					+"<a href=OrderServlet?action=allOrders&&condition=1>����";
			}
			else{msg = "�������������󣬴���ʧ��";}
			req.setAttribute("msg",msg);//���ش�����Ϣ
			req.getRequestDispatcher("adinfo.jsp").forward(req,res);
		}
	}
}