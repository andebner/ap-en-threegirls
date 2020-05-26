package def;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class AdminMain {

	public Connection getCon() throws Exception {

		String url = "jdbc:postgresql://localhost:5432/Library";
        String user = "andebner";
        String password = "apenproject";

        Connection con = DriverManager.getConnection(url, user, password);
       
        return con;
        
	}
	
	public ArrayList<Admin> getAllAdmin() throws Exception{
		
		Statement st = getCon().createStatement();
		ResultSet rs = st.executeQuery("SELECT id, firstname, lastname, username, password FROM adminLogin");
		
		ArrayList<Admin> all = new ArrayList<Admin>();
		
		
		 while (rs.next()) {
			 
			Admin a = new Admin();
			a.id = rs.getInt(1);
			a.firstname = rs.getString(2);
			a.lastname = rs.getString(3);
			a.username = rs.getString(4);
			a.password = rs.getString(5);
			
			all.add(a);
			
		 }
			
			
		return all;
		
	}
	
	public Admin getAdmin(int id) throws Exception {
		
		PreparedStatement st = getCon().prepareStatement("SELECT id, firstname, lastname, username, password FROM adminlogin WHERE id = ?");
		st.setInt(1, id);
		ResultSet rs = st.executeQuery();
		
		Admin a = new Admin();
		
		if(rs.next()) {
			
			a.id = rs.getInt("id");
			a.firstname = rs.getString("firstname");
			a.lastname = rs.getString("lastname");
			a.username = rs.getString("username");
			a.password = rs.getString("password");
			
		}
		
		return a;
		
	}
	
	public void addAdmin(Admin a) throws Exception {
		
		PreparedStatement st = getCon().prepareStatement("INSERT INTO adminlogin (\"firstname\", \"lastname\", \"username\", \"password\") VALUES (?, ?, ?, ?)");
		
		st.setString(1, a.firstname);
		st.setString(2, a.lastname);
		st.setString(3, a.username);
		st.setString(4, a.password);
		st.execute();
		
	}
	
	public void updateAdmin(int id, Admin a) throws Exception {
		
		PreparedStatement st = getCon().prepareStatement("UPDATE adminlogin SET firstname = ?, lastname = ?, username = ?, password = ? WHERE id = ?;");
		
		st.setString(1, a.firstname);
		st.setString(2, a.lastname);
		st.setString(3, a.username);
		st.setString(4, a.password);
		st.setInt(5, id);
		st.execute();
		
	}
	
	public void deleteAdmin(int id) throws Exception {
		
		PreparedStatement st = getCon().prepareStatement("DELETE FROM adminlogin WHERE id = ?");
		
		st.setInt(1, id);
		
		st.execute();
		
	}
	
	public boolean validateALogin(String username, String password) throws Exception {
		
		int id = 0;
		
		PreparedStatement st = getCon().prepareStatement("SELECT * FROM adminlogin WHERE username=? and password=?");
		st.setString(1, username);
		st.setString(2, password);
		ResultSet rs = st.executeQuery();
		
		boolean result;
		
		if(rs.next()) {
			
			id = rs.getInt("id");
		
			Admin a = new Admin();
		
			a = getAdmin(id);
			
			result = true;
			
		} else {
			
			result = false;
			
		}
		
		return result;
	}
	
	public Admin getAByName(String username) throws Exception {
		
		PreparedStatement st = getCon().prepareStatement("SELECT id, firstname, lastname, username, password FROM adminlogin WHERE username = ?");
		st.setString(1, username);
		ResultSet rs = st.executeQuery();
		
		Admin a = new Admin();
		
		if(rs.next()) {
			
			a.id = rs.getInt("id");
			a.firstname = rs.getString("firstname");
			a.lastname = rs.getString("lastname");
			a.username = rs.getString("username");
			a.password = rs.getString("password");
			
		}
		
		return a;
		
	}
	
}
