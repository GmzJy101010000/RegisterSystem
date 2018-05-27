package BaseDao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;

public class recordDao extends Basedao{

	public recordDao() {
		// TODO Auto-generated constructor stub
	}
	 static java.sql.Connection co=getconn();
	public static boolean addRecord(String type, String detail){
    	boolean a1=false;
    	int bb=findmaxRecprdId();
    	bb=bb+=1;
    	System.out.println(bb);
    	String sql="insert into search.record values ('"+bb+"','"+type+"','"+detail+"',"+"sysdate())";
    	java.sql.PreparedStatement ps;
		try {
			System.out.println(sql);
			ps = co.prepareStatement(sql);
			ps.executeUpdate(); 
			
		} catch (SQLException e) {
			System.out.println("ÃÌº” ß∞‹£°");
			e.printStackTrace();
		}
			
    	
    	return a1;
    } 
    
    public static int findmaxRecprdId(){
    	int a=0;
    	String sql="select max(r_id) from search.record";
    	java.sql.PreparedStatement ps;
		try {
			System.out.println(sql);
			ps = co.prepareStatement(sql);			 
			ResultSet rs=ps.executeQuery();
			while (rs.next()) {
			
				a=rs.getInt("max(r_id)");				
			}
		} catch (SQLException e) {
			System.out.println("≤È—Ø ß∞‹£°");
			e.printStackTrace();
		}
    	return a;
    }
    
    public static List<String> getSearchList(String keyword){
    	
    	List<String >  list=new ArrayList<String>();
    	String sql="select r_detail from search.record where r_code like '"+keyword+"%'";
    	java.sql.PreparedStatement ps;
    	try {
			System.out.println(sql);
			ps = co.prepareStatement(sql);			 
			ResultSet rs=ps.executeQuery();
			while (rs.next()) {
				list.add(rs.getString("r_detail"));			
			}
		} catch (SQLException e) {
			System.out.println("≤È—Ø ß∞‹£°");
			e.printStackTrace();
		}   	
    	return list;
    }
}
