package wyf.wyy;
import java.io.*; 
import java.util.*;
import javax.servlet.*; 
import javax.servlet.http.*;
public class ListServlet extends HttpServlet
{
	public void init(ServletConfig conf) throws ServletException
	{//Servlet��inti��ʼ������
		super.init(conf);
	}
	public void doGet(HttpServletRequest req,HttpServletResponse res)
	throws ServletException, IOException{//doGet����
		doPost(req,res);//����doPost����
	}
	public void doPost(HttpServletRequest req,HttpServletResponse res)
	throws ServletException,IOException{
		req.setCharacterEncoding("gbk");//����req����Ϊgbk
		res.setCharacterEncoding("gbk");//����res����Ϊgbk		
		String action = req.getParameter("action");//�õ��������Ӧaction		
		HttpSession session=req.getSession(true);//�õ�session����
		//�õ���½�Ĺ���ԱID		
		String adnameSes = (String)session.getAttribute("adname");
		String msg = "";//������Ϣ�ַ���
		if(action.equals("list")){//�õ������Ԥ������			
			int gId = Integer.parseInt(req.getParameter("gId"));
			Vector<String> list = DB.getGroupInfo(gId);
			session.setAttribute("list",list);
			res.sendRedirect("groupList.jsp");
		}
		else if(action.equals("status")){
			Vector<String []> v = null;//���͵���ʾ��Դ״̬ҳ�����Ϣ
			String isOrdered = "NO";//�Ƿ�Ԥ������ʼΪ"NO"����û�б�Ԥ��
			String rgid = req.getParameter("rgid");//�õ�Ҫ�鿴״̬����Դ���
			//��Դ���ڱ�Ԥ���У�δ����֮ǰ���ٽ��ܶ���
			if(Order_DB.isOrdered(rgid)) {isOrdered = "YES";}
			//����Ԥ��ʱ�������ݿ�õ��Ѿ���Ԥ���б�
			else {v = Order_DB.getOrderedDay(rgid);}
			//������Դ״̬��һЩ��Ϣ��ת������ʾҳ��
			req.setAttribute("v",v);
			req.setAttribute("rgid",rgid);
			req.setAttribute("isOrdered",isOrdered);	
			req.getRequestDispatcher("lookRes.jsp").forward(req,res);			
		}
//************************************��Դ***********************************************
		else if(action.equals("adminList")){
			Vector<String> list = new Vector<String>();
			if(session.getAttribute("adname")!=null){//�жϹ���Ա�Ƿ��½
			    int gId = Integer.parseInt(req.getParameter("gId"));
			    if(gId==0){//0�������з���
			    	list.add("0");
			    	list.add("���з���");
			    }
			    else{//ĳһ�ض�����
			    	list = DB.getGroupInfo(gId);
			    }								
				session.setAttribute("list",list);
				res.sendRedirect("adminResource.jsp");
			}
			else{//����Աû�е�½
				msg = "���ȵ�½";
				this.forward(req,res,msg,"adinfo.jsp");		 
			}
		}
		else if(action.equals("queryRes")){//��ѯ
			String rgid = req.getParameter("rgid");//�õ���ԴID
			String sql = "select rgid,rlevel,rmoney,rdetail,rstatus,rgroup,rid "+
										"from resource where rgid='"+rgid+"'";			
			Vector<String[]> v = DB.getResInfo(sql);//ִ�в�ѯ
			req.setAttribute("list",v);
			req.getRequestDispatcher("ResQuery.jsp").forward(req,res);	
		}
		
		else if(action.equals("editRes")){//�༭��Դ
			int rid = Integer.parseInt(req.getParameter("rid"));
			String sql = "select rgid,rlevel,rmoney,rdetail,rstatus,rgroup,rid from resource where rid='"+rid+"'";
			Vector<String []> rinfo = DB.getResInfo(sql);
			req.setAttribute("rinfo",rinfo);
			req.getRequestDispatcher("ResInfo.jsp").forward(req,res);
		}
		else if(action.equals("changeRes")){			
			String rgidBefor = req.getParameter("rgidBefor");//�༭ǰ�ı��
			String rgidAfter = req.getParameter("rgidAfter");//�༭��ı��			
			int rid = Integer.parseInt(req.getParameter("rid"));//�õ���ԴID����
			//�õ��޸ĺ����Ϣ
			String rgroup = req.getParameter("rgroup");
			String rlevel = req.getParameter("rlevel").trim();
			double rmoney = Double.parseDouble(req.getParameter("rmoney").trim());
			String rdetail = req.getParameter("rdetail").trim();
			String rstatus = req.getParameter("rstatus");			
			String sql = "update resource set rgid='"+rgidAfter+"',rgroup='"+rgroup+"',rlevel='"+rlevel+
			             "',rmoney="+rmoney+",rdetail='"+rdetail+"',rstatus='"+rstatus+"' where rid="+rid;			
			if(rgidBefor.equals(rgidAfter)){//���ڱ��û�ı�
				if(DB.update(sql)>0){
					msg = "�޸ı���ɹ�<br><br><a href=ListServlet?action=adminList&&gId=0>����";
				}
			}
			else{//���ڱ�Ÿı���
			    String sqla = "select * from resource where rgid='"+rgidAfter+"'";
				if(DB.isExist(sqla)){
					msg = "�Ѿ��д˱�ŵ���Դ����˶����롣<br><br>"+
				      	  "<a href=ListServlet?action=editRes&&rid="+rid+">���ؼ����޸�";
				}
			 	else{
			 		if(DB.update(sql)>0){
			 			msg = "�޸ı���ɹ�<br><br><a href=ListServlet?action=adminList&&gId=0>����";
			 		}
			 	}
			}
			this.forward(req,res,msg,"adinfo.jsp");		 	
		}
		else if(action.equals("deleteRes")){
			String rid = req.getParameter("rid");//�õ�Ҫɾ����ID��
			String sql = "delete from resource where rid='"+rid+"'";
			if(DB.update(sql)>0){
				msg = "ɾ���ɹ�<br><br><a href=ListServlet?action=adminList&&gId=0>����";						 
			}
			else{
				msg = "δ֪����ɾ��ʧ��";
			}
			this.forward(req,res,msg,"adinfo.jsp");
		}
		else if(action.equals("addRes")){
			//�õ�Ҫ�����Դ����ϸ��Ϣ
			String rgid = req.getParameter("rgid").trim();
			String rgroup = req.getParameter("rgroup");
			String rlevel = req.getParameter("rlevel").trim();
			Double rmoney = Double.parseDouble(req.getParameter("rmoney").trim());
			String rdetail = req.getParameter("rdetail").trim();
			String rstatus = req.getParameter("rstatus");			
			String sql = "select * from resource where rgid='"+rgid+"'";
			if(DB.isExist(sql))	{
				msg="�˱�Ŷ�Ӧ����Դ�Ѿ����ڣ���˶Ա�����롣<br><a href=addRes.jsp>����";
			}
			else{
				int rid = DB.getId("resource","rid");//�õ���Դ�����������ֵ��1
				sql = "insert into resource(rid,rgroup,rgid,rlevel,rmoney,rdetail,rstatus)"+
				      "values("+rid+",'"+rgroup+"','"+rgid+"','"+rlevel+"',"+rmoney+",'"+
				       rdetail+"','"+rstatus+"')";
				if(DB.update(sql)>0){
					msg = "������Դ�ɹ�������<br><a href=addRes.jsp>����";
				}
			}
			this.forward(req,res,msg,"adinfo.jsp");		 
		}
//***************************����*******************************************
		else if(action.equals("adminGroup")){
			if(session.getAttribute("adname")!=null){//�жϹ���Ա�Ƿ��½			   
				res.sendRedirect("adminGroup.jsp");
			}
			else{//û�е�½
				msg = "���ȵ�½";
				this.forward(req,res,msg,"adinfo.jsp");//ת������Ϣ ҳ��	 
			}
		}
		else if(action.equals("editGroup")){//�༭����
			int gId = Integer.parseInt(req.getParameter("gId"));
			Vector<String> ginfo = DB.getGroupInfo(gId);
			req.setAttribute("ginfo",ginfo);
			req.getRequestDispatcher("GroupInfo.jsp").forward(req,res);
		}
		else if(action.equals("changeGroup")){//�޸ķ�����Ϣ���ύ		    
		    int gId = Integer.parseInt(req.getParameter("gId"));//�õ�����ID
		    String gNameBefor = req.getParameter("gNameBefor");//�õ��޸�ǰ������
		    //�õ��޸ĺ����Ϣ
		    String gNameAfter = req.getParameter("gNameAfter");
		    String gImg = req.getParameter("gImg");
		    String gDetail = req.getParameter("gDetail");
		    String gOrderDet = req.getParameter("gOrderDet");		    
		    String sql = "update rgroup set gName='"+gNameAfter+"',gImg='"+gImg+"',gDetail='"+gDetail+
		    			"',gOrderDet='"+gOrderDet+"' where gId="+gId;//ƴװSQL		    
		    if(gNameAfter.equals(gNameBefor)){//�жϷ��������Ƿ�ı�
		    	if(DB.update(sql)>0){
					msg = "�޸ı���ɹ�<br><br><a href=ListServlet?action=adminGroup>����";
				}
		    }
		    else{//�������ָı�
		    	String sqla = "select * from rgroup where gName='"+gNameAfter+"'";
				if(DB.isExist(sqla)){//�����Ѿ�����
					msg = "�Ѿ��д����ֵķ��飬��˶����롣<br>"+
							"<a href=ListServlet?action=editGroup&&gId="+gId+">����";
				}
			 	else{//������������
			 		if(DB.update(sql)>0){
			 			msg = "�޸ı���ɹ�<br><br><a href=ListServlet?action=adminGroup>����";
			 		}
			 	}
		    }
		   this.forward(req,res,msg,"adinfo.jsp");		 			
		}
		else if(action.equals("deleteGroup")){
			int gId = Integer.parseInt(req.getParameter("gId"));//�õ�Ҫɾ����ID
			String sqla = "delete from resource where rgroup="+gId;//ɾ�������¼��SQL
			String sqlb = "delete from rgroup where gId="+gId;//ɾ����������Դ��SQL
			if(DB.update(sqla,sqlb)==true){
				msg = "ɾ������ɹ�<br><br><a href=ListServlet?action=adminGroup>����";
			}
			else{
				msg = "δ֪����ɾ��ʧ��";
			}
			this.forward(req,res,msg,"adinfo.jsp");		 
		}
		else if(action.equals("addGroup")){
			int gId = DB.getId("rgroup","gId");//�õ���ӷ����ID
			//�õ���д����Ϣ
			String gName = req.getParameter("gName");
			String gImg = req.getParameter("gImg");
		    String gDetail = req.getParameter("gDetail");
		    String gOrderDet = req.getParameter("gOrderDet"); 
		    String sql = "insert into rgroup(gId,gName,gImg,gDetail,gOrderDet)values('"+gId+"','"+
		    				gName+"','"+gImg+"','"+gDetail+"','"+gOrderDet+"')";//ƴװSQL   
		    if(DB.update(sql)>0){//ִ�и���
		    	msg = "��ӷ���ɹ�<br><br><a href=ListServlet?action=adminGroup>����";
		    }
		    else{
		    	msg = "δ֪�������ʧ��";
		    }
		    this.forward(req,res,msg,"adinfo.jsp");	
		}
//********************************����Ա*****************************************
		else if(action.equals("admanage")){			
			if(adnameSes==null){//�жϹ���Ա�Ƿ��½
			    msg = "���ȵ�½";
			    this.forward(req,res,msg,"adinfo.jsp");		 				
			}
			else{
				String sql = "select adlevel from adinfo where adname='"+adnameSes+"'";				
				int adlevel = Integer.parseInt(DB.getInfo(sql));//�õ�����Ա����
				if(adlevel!=1){
					msg = "�Բ���Ȩ�޲���";
					this.forward(req,res,msg,"adinfo.jsp");		 
				}
				else{
					res.sendRedirect("adminManage.jsp");
				}
			}
		}
		else if(action.equals("addAdmin")){//��ӹ���Ա
			String adnameAdd = req.getParameter("adname");
			String adpwd = req.getParameter("adpwd");
			String sql = "insert into adinfo(adname,adpwd,adlevel)values"+
			  			 "('"+adnameAdd+"','"+adpwd+"',"+0+")";
			String sqla = "select * from adinfo where adname='"+adnameAdd+"'";
			if(DB.isExist(sqla)){
				msg = "�˹���ԱID�Ѿ�������˶�����";
			}
			else{
				if(DB.update(sql)>0)
				msg = "��ӹ���Ա�ɹ�";
			}		
			this.forward(req,res,msg,"adinfo.jsp");		 
		}
		else if(action.equals("deleteAdmin")){
			//�õ�Ҫɾ���Ĺ���ԱID
			String adnameDel = req.getParameter("adname");
			if(adnameDel.equals(adnameSes)){
				msg = "����ɾ���Լ�";
			}
			else{
				String sql = "delete from adinfo where adname='"+adnameDel+"'";
				DB.update(sql);
				msg = "ɾ���ɹ�";
			}
			this.forward(req,res,msg,"adinfo.jsp");
		}
		else if(action.equals("resetPwd")){
			String adname = req.getParameter("adname").trim();
			String adpwd = req.getParameter("adpwd").trim();
			String sql = "update adinfo set adpwd='"+adpwd+"' where adname='"+adname+"'";
			if(DB.update(sql)>0){
				msg = "��������ɹ�";
			}
			else{
				msg = "����ʧ�ܣ������¼������";
			}
			this.forward(req,res,msg,"adinfo.jsp");
		}
		else if(action.equals("changePwd")){//����Ա�޸�����
			String adname = req.getParameter("adname");
			String adpwd = req.getParameter("adpwd");
			String newPwd = req.getParameter("newPwd");
			String sql = "select adpwd from adinfo where adname='"+adname+"'";
			String pwdFromDB = DB.getInfo(sql);
			if(pwdFromDB==null){
				msg = "�ù���Ա�û������ڣ������º˶�����";
			}
			else if(!pwdFromDB.equals(adpwd)){
				msg = "�������벻��ȷ������������";
			}
			else{
				sql = "update adinfo set adpwd='"+newPwd+"' where adname='"+adname+"'";				
				if(DB.update(sql)>0){
					msg = "�޸ĳɹ�";
				}
				else{
					msg = "δ֪�����޸�ʧ�ܣ�����";
				}				
			}
			this.forward(req,res,msg,"adinfo.jsp");			
		}			
}
	public void forward(HttpServletRequest req,HttpServletResponse res,
	String msg,String url)throws ServletException,IOException
	{
		req.setAttribute("msg",msg);//������Ϣ
		req.getRequestDispatcher("adinfo.jsp").forward(req,res);//ת������Ϣҳ��
	}
}