package wyf.wyy;
import java.sql.*;
import javax.sql.*;
import java.util.*;
public class Order_DB{
	private static Connection con=null;//����Connection����
	private static Statement stat=null;//����Statement����
	private static ResultSet rs=null;//����ResultSet����
	public static boolean isOrdered(String rgid1){//�ж���Դ�Ƿ�Ԥ����
		boolean b = false;//��ʼΪfalse����û�б�Ԥ��
		try{
			String ostatus = new String("Ԥ����".getBytes(),"iso8859-1");
			String rstatus = new String("ռ��".getBytes(),"iso8859-1");
			String rgid = new String(rgid1.getBytes(),"iso8859-1");
			con = DB.getCon();
			stat = con.createStatement();
			//�鿴��ǰrgid��Ӧ����Դ��û������Ԥ����
			rs = stat.executeQuery("select rgid from oinfo where ostatus='"+
								ostatus+"' and rgid='"+rgid+"'");
			if(rs.next()) {b = true;}
			//�鿴��ǰ��Դ�Ƿ��ڿ���״̬
			rs = stat.executeQuery("select rgid from resource where rstatus='"+
								rstatus+"' and rgid='"+rgid+"'");
			if(rs.next()) {b = true;}
		}
		catch(Exception e){e.printStackTrace();}
		finally{DB.closeCon();}//�ر����ݿ�����
		return b;//���ؽ��
	}
	public static Vector<String []> getOrderedDay(String rgid1){
		Vector<String []> v = new Vector<String []>();
		try{
			String ostatus = new String("Ԥ���ɹ�".getBytes(),"iso8859-1");
			String rgid = new String(rgid1.getBytes(),"iso8859-1");
			con = DB.getCon();//�õ����ݿ�����
			stat = con.createStatement();//����������
			//�鿴��ǰrgid��Ӧ����Դ�Ѿ���Ԥ�����б�δ������֮�ڣ�
			rs = stat.executeQuery("select ftime,etime from oinfo where ostatus='"+
								ostatus+"' and rgid='"+rgid+"'");
			while(rs.next()){				
				String []s =new String[2];
				//�õ���ʼ�ͽ���ʱ��
				s[0] = new String(rs.getString(1).getBytes("iso8859-1"),"gbk");
				s[1] = new String(rs.getString(2).getBytes("iso8859-1"),"gbk");
				java.util.Date etime = Order_DB.chageStringToDate(s[1]);
				java.util.Date now = new java.util.Date();
				//�������ʱ���ڵ�ǰʱ��֮����δ������֮�����Ѿ�����������
				if(etime.after(now)) {v.add(s);}
			}
		}
		catch(Exception e)	{e.printStackTrace();}
		finally {DB.closeCon();}//�ر����ݿ�����
		return v;//���ؽ��
	}
	public static java.util.Date chageStringToDate(String s){
		java.util.Date da = null;//�������ڶ�������
		if(s!=null){
			String p = "-|:| "; //���ڲ�ֵ�����ʽ
			String[] d = s.split(p);//�õ���ֺ���ַ�������			
			int[] date = new int[d.length];//���ַ�������ת��Ϊint������
			for(int i=0;i<d.length;i++)
			{date[i]=Integer.parseInt(d[i]);}
			//����java.util.Date�Ĺ���������һ�����ڶ���
			da = new java.util.Date(date[0]-1900,date[1]-1,date[2],date[3],date[4]);
		}	
		return da;//�������ڶ���
	}
	public static int addOrder(String user,Vector<String[]> OrderList)
	{
		int i = 0;
		int orid = DB.getId("oinfo","orid");//�õ�������ϸ������ID+1ֵ
		int oid = DB.getId("olist","oid");//�õ������������ID+1ֵ
		try{			
			con = DB.getCon();
			stat = con.createStatement();
			//�õ������Ϣ��ɶ���			
			java.util.Date d = new java.util.Date();
			String otime = d.toLocaleString();
			con.setAutoCommit(false);//�����Զ��ύ����ʼһ������
			String sqla = "insert into olist(oid,oname,otime) values"+
					"("+oid+",'"+user+"','"+otime+"')";
			String sql = new String(sqla.getBytes(),"iso8859-1");			
			stat.executeUpdate(sql);
			//�õ�������ϸ��Ϣ
			Vector<String> sqlb = new Vector<String>();			
			for(String []s:OrderList){												
				String rgid = s[0];//�õ�������Դ��
				//�õ���ʼ�ͽ���ʱ��
				String ftime = s[2]; String etime = s[3];
				String sqlc = "insert into oinfo(orid,oid,rgid,ftime,etime) values"+
						"("+orid+","+oid+",'"+rgid+"','"+ftime+"','"+etime+"')";
				String sqld = new String(sqlc.getBytes(),"iso8859-1");
				stat.executeUpdate(sqld);//ִ�и���
				orid++;//�����Լӣ���Ϊ��һ����¼������
			}
			con.commit();//�������ύ
			con.setAutoCommit(true);//�ָ��Զ��ύģʽ
		}
		catch(Exception e){
			e.printStackTrace();
			i = -1;
			try{con.rollback();}//���ִ��󣬷���ع�����
			catch(Exception ea)	{e.printStackTrace();}
		}
		finally	{DB.closeCon();}
		return i;//����ִ�н��,-1����ʧ��
	}
	public static Vector<String []> getOrderList(String sqla){//�õ��û����ύ����
		Vector<String []> v = new Vector<String[]>();//������������
		try{
			con = DB.getCon();//�õ����ݿ�����
			stat = con.createStatement();//����������		
			String sql = new String(sqla.getBytes(),"iso8859-1");//ת��
			rs = stat.executeQuery(sql);//ִ�в�ѯ
			while(rs.next()){//���������
				String s[] = new String[6];
				for(int i=0;i<s.length;i++){//����Ϣ����ת
					s[i] = new String(rs.getString(i+1).getBytes("iso8859-1"),"gbk");
				}				
				v.add(s);//��������Ϣ��ӽ���������
			}
		}
		catch(Exception e) {e.printStackTrace();}
		finally	{DB.closeCon();}
		return v;
	}
	public static Vector<String []> getOrderDetail(String oid){//�õ�ĳһ��������
		Vector<String []> v = new Vector<String[]>();
		try{
			con = DB.getCon();//�õ����ݿ�����
			stat = con.createStatement();//����������
			rs = stat.executeQuery("select rgid,ftime,etime,ostatus from oinfo"+
						" where oid='"+oid+"'");//ִ�в�ѯ�õ������			
			while(rs.next()){//���������
				String s[] = new String[5];
				for(int i=0;i<s.length-1;i++){//ת��
					s[i] = new String(rs.getString(i+1).getBytes("iso8859-1"),"gbk");
				}										
				v.add(s);//����Ϣ��ӵ���������
			}
			for(String[] s:v){//�õ�������
				String rgid = new String(s[0].getBytes(),"iso8859-1");
				rs = stat.executeQuery("select gName from rgroup where gId=("+
							"select rgroup from resource where rgid='"+rgid+"')");
				rs.next();
				s[4] = new String(rs.getString(1).getBytes("iso8859-1"),"gbk");
			}
		}
		catch(Exception e) {e.printStackTrace();}
		finally	{DB.closeCon();}
		return v;
	}
}