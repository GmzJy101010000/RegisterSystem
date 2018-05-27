package BaseDao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.omg.CORBA.PUBLIC_MEMBER;

import com.ht.servlet.AccountBean;
import com.mysql.jdbc.*;


public class accountDao extends Basedao {
     public accountDao (){
    	 super();
     }
     static AccountBean account=null;
     static java.sql.Connection co=getconn();
     public static boolean  findAccountBean(String name, String passwrod){
    	 String sql ="select user_ps from search.web_user where user_name= '"+name+"'";
    	 System.out.println(sql);
    	 try {
			java.sql.PreparedStatement ps=co.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while (rs.next()) {
				String pwd=rs.getString("user_ps");
				if(pwd !=null){
					if(passwrod.equals(pwd)){
						return true;
					}
				}
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
    	return false; 
     }
     
    public static boolean newuser(String name, String pwd){
    	boolean a1=false;
    	int bb=findmaxUserid();
    	bb=bb+=1;
    	System.out.println(bb);
    	String sql="insert into search.web_user values ('"+bb+"','"+name+"','"+pwd+"',"+"sysdate())";
    	java.sql.PreparedStatement ps;
		try {
			System.out.println(sql);
			ps = co.prepareStatement(sql);
			ps.executeUpdate(); 
			
		} catch (SQLException e) {
			System.out.println("×¢²áÊ§°Ü£¡");
			e.printStackTrace();
		}
			
    	
    	return a1;
    } 
    
    public static int findmaxUserid(){
    	int a=0;
    	String sql="select max(user_id) from search.web_user";
    	java.sql.PreparedStatement ps;
		try {
			System.out.println(sql);
			ps = co.prepareStatement(sql);			 
			ResultSet rs=ps.executeQuery();
			while (rs.next()) {
			
				a=rs.getInt("max(user_id)");				
			}
		} catch (SQLException e) {
			System.out.println("²éÑ¯Ê§°Ü£¡");
			e.printStackTrace();
		}
    	return a;
    }
 }
