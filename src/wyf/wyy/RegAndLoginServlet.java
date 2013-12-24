package wyf.wyy;
import java.io.*; 
import javax.servlet.*; 
import javax.servlet.http.*;
public class RegAndLoginServlet extends HttpServlet
{
	public void init(ServletConfig conf) throws ServletException 
	{ 
		super.init(conf);
	}
	public void doGet(HttpServletRequest req,HttpServletResponse res)
	throws ServletException, IOException 
	{
		doPost(req,res);
	}
	public void doPost(HttpServletRequest req,HttpServletResponse res)
	throws ServletException, IOException
	{
		req.setCharacterEncoding("gbk");
		res.setCharacterEncoding("gbk");
		//�õ��������Ӧaction		
		String action = req.getParameter("action");
		//�õ�session����
		HttpSession session=req.getSession(true);
		PrintWriter pw=res.getWriter();
		String msg="";
	if(action.equals("reg")){			
		//�õ�ע���û���д������
		String uname = req.getParameter("uname").trim();			
		String pwd = req.getParameter("pwd").trim();
		String telNum = req.getParameter("telNum").trim();
		String realName = req.getParameter("realName").trim();
		String gender = req.getParameter("gender");
		String email = req.getParameter("email").trim();
		//ƴװ�鿴�û��Ƿ���ڵ�SQL
		String sqla = "select * from user where uname='"+uname+"'";
		if(DB.isExist(sqla)){
			msg=uname+":�û����Ѵ��ڣ���������һ��������<br/><a href=reg.jsp>����ע��</a>";
		}
		else{//�������û���SQL				
			String sql = "insert into user values ('"+uname+"','"+pwd+"'"+
					",'"+telNum+"','"+realName+"','"+gender+"','"+email+"')";							
			DB.update(sql);//ִ�в��붯��
			msg=uname+":ע��ɹ�������<br/><a href=login.jsp>���ڵ�½������</a>";
		}
		req.setAttribute("msg",msg);//ת����Ϣ
		req.getRequestDispatcher("info.jsp").forward(req,res);
	}

		else if(action.equals("login")){			
			session.removeAttribute("uname");//��session���Ƴ���ǰ��½�û�
			String uname = req.getParameter("uname").trim();//�õ���½�û���
			String pwd =  req.getParameter("pwd").trim();//�õ���½����
			//ƴװ�鿴�û��Ƿ���ڵ�SQL
			String sqla = "select * from user where uname='"+uname+"'";
			if(DB.isExist(sqla)){
				String sql = "select pwd from user where uname='"+uname+"'";
				String password=DB.getInfo(sql).trim();//�����ݿ�õ�����
				if(pwd.equals(password)){				
					session.setAttribute("uname",uname);//��½�ɹ�
					res.sendRedirect("main.jsp");//��ת����ҳ	
				}
				else{
					msg=uname+"���벻��ȷ������<br><br>"+
					       "<a href=login.jsp>���µ�½</a>";					
					req.setAttribute("msg",msg);//����Ϣ���͵���Ϣ��ʾҳ��
					req.getRequestDispatcher("info.jsp").forward(req,res);				
				}
			}
			else{
				msg=uname+"���û��������ڣ�����<br><br>"+
				     "<a href=login.jsp>���µ�½</a>";				
				req.setAttribute("msg",msg);//����Ϣ���͵���Ϣ��ʾҳ��
				req.getRequestDispatcher("info.jsp").forward(req,res);
			}		
		}						
		else if(action.equals("logout")){
			session.removeAttribute("uname");//��session���Ƴ���½�û�
			msg = "��ӭ�ٴι��٣�����";//��ʾ��Ϣ
			req.setAttribute("msg",msg);//���ò�ת����ʾ��Ϣ
			req.getRequestDispatcher("info.jsp").forward(req,res);
		}		
		else if(action.equals("changeMyInfo")){
			String uname=(String)session.getAttribute("uname");
			//�õ��޸ĺ����Ϣ
			String telNum = req.getParameter("telNum").trim();
			String realName = req.getParameter("realName").trim();
			String gender = req.getParameter("gender");
			String email = req.getParameter("email").trim();
			//���ɸ���SQL
			String sql="update user set telNum='"+telNum+"',realName='"+realName+
			   "',gender='"+gender+"',email='"+email+"'where uname='"+uname+"'";
			if(DB.update(sql)==1){
				msg = "�޸����ϳɹ�������<br>";				
				req.setAttribute("msg",msg);//����Ϣ���͵���Ϣ��ʾҳ��
				req.getRequestDispatcher("info.jsp").forward(req,res);
			}
		}
		else if(action.equals("changePwd")){
			//�õ��ύ����Ϣ
			String uname=(String)session.getAttribute("uname");
			String currentPwd = req.getParameter("currentPwd").trim();
			String newPwd = req.getParameter("newPwd").trim();
			//�����ݿ��õ���ǰ�û�������
			String sqla = "select pwd from user where uname='"+uname+"'";
			String pwdFromDB =  DB.getInfo(sqla);			
			if(currentPwd.equals(pwdFromDB)){//�Ƚ�����
				String sqlb = "update user set pwd='"+newPwd+"'where uname='"+
								uname+"'";//���´��û�������
				DB.update(sqlb);//ִ�и���
				msg = "�����޸ĳɹ���������һ�������������½��<br>";
			}
			else{
				msg = "����������벻��ȷ���޸�ʧ�ܣ�����<br>"+
				       "<a href=changeMyInfo.jsp>���ؼ����޸ģ�����";
			}			
			req.setAttribute("msg",msg);//����Ϣ���͵���Ϣ��ʾҳ��
			req.getRequestDispatcher("info.jsp").forward(req,res);
		}

		else if(action.equals("adlogin")){
			session.removeAttribute("adname");
			String adname = req.getParameter("adname").trim();//�õ���½��
			String pwd =  req.getParameter("pwd").trim();//�õ���½����
			//ƴװ�����ݿ�õ���½����Ա�����SQL���
			String sqla = "select adpwd from adinfo where adname='"+adname+"'";
			String pwdFromDB = DB.getInfo(sqla);//ִ�в�ѯ�õ���ȷ����
			if(pwdFromDB!=null&&pwd.equals(pwdFromDB)){//��½�ɹ�			
				session.setAttribute("adname",adname);//����½����Ա�����session
				msg = "��½�ɹ���";//��ʾ��½�ɹ�
			}
			else{//��½ʧ�ܵ���ʾ
				msg = "������û��������룬�����µ�½<br><br>"+
				 		"<a href=adindex.jsp>���µ�½";				
			}
			//����Ϣ���͵���Ϣ��ʾҳ��
			req.setAttribute("msg",msg);
			req.getRequestDispatcher("adinfo.jsp").forward(req,res);
		}
		else if(action.equals("adlogout")){//ע��
			session.removeAttribute("adname");
			msg = "�˳��ɹ���";//��ʾע���ɹ�
			req.setAttribute("msg",msg);
			req.getRequestDispatcher("adinfo.jsp").forward(req,res);
		}
	}
}