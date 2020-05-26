package def;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class UserMain {

	public Connection getCon() throws Exception {

		String url = "jdbc:postgresql://localhost:5432/Library";
        String user = "andebner";
        String password = "apenproject";

        Connection con = DriverManager.getConnection(url, user, password);
       
        return con;
        
	}
	
	public ArrayList<User> getAllUsers() throws Exception{
		
		Statement st = getCon().createStatement();
		ResultSet rs = st.executeQuery("SELECT id, firstname, lastname, username, email, password FROM userlogin");
		
		ArrayList<User> all = new ArrayList<User>();
		
		
		 while (rs.next()) {
			 
			User u = new User();
			u.id = rs.getInt(1);
			u.firstname = rs.getString(2);
			u.lastname = rs.getString(3);
			u.username = rs.getString(4);
			u.email = rs.getString(5);
			u.password = rs.getString(6);
			
			all.add(u);
			
		 }
			
			
		return all;
		
	}
	
	public User getUser(int id) throws Exception {
		
		PreparedStatement st = getCon().prepareStatement("SELECT id, firstname, lastname, username, email, password FROM userlogin WHERE id = ?");
		st.setInt(1, id);
		ResultSet rs = st.executeQuery();
		
		User u = new User();
		
		if(rs.next()) {
			
			u.id = rs.getInt("id");
			u.firstname = rs.getString("firstname");
			u.lastname = rs.getString("lastname");
			u.username = rs.getString("username");
			u.email = rs.getString("email");
			u.password = rs.getString("password");
			
		}
		
		return u;
		
	}
	
	public void addUser(User u) throws Exception {
		
		PreparedStatement st = getCon().prepareStatement("INSERT INTO userlogin (\"firstname\", \"lastname\", \"username\", \"email\", \"password\") VALUES (?, ?, ?, ?, ?)");
		
		st.setString(1, u.firstname);
		st.setString(2, u.lastname);
		st.setString(3, u.username);
		st.setString(4, u.email);
		st.setString(5, u.password);
		st.execute();
		
	}
	
	public void updateUser(int id, User u) throws Exception {
		
		PreparedStatement st = getCon().prepareStatement("UPDATE userlogin SET firstname = ?, lastname = ?, username = ?, email = ?, password = ? WHERE id = ?;");
		
		st.setString(1, u.firstname);
		st.setString(2, u.lastname);
		st.setString(3, u.username);
		st.setString(4, u.email);
		st.setString(5, u.password);
		st.setInt(6, id);
		st.execute();
		
	}
	
	public void deleteUser(int id) throws Exception {
		
		PreparedStatement st = getCon().prepareStatement("DELETE FROM userlogin WHERE id = ?");
		
		st.setInt(1, id);
		st.execute();
		
	}
	
	public boolean validateLogin(String username, String password) throws Exception {
		
		int id = 0;
		
		PreparedStatement st = getCon().prepareStatement("SELECT * FROM userlogin WHERE username=? and password=?");
		st.setString(1, username);
		st.setString(2, password);
		ResultSet rs = st.executeQuery();
		
		boolean result;
		
		if(rs.next()) {
			
			id = rs.getInt("id");
		
			User u = new User();
		
			u = getUser(id);
			
			result = true;
			
		} else {
			
			result = false;
			
		}
		
		return result;
	}
	
	public User getByName(String username) throws Exception {
		
		PreparedStatement st = getCon().prepareStatement("SELECT id, firstname, lastname, username, email, password FROM userlogin WHERE username = ?");
		st.setString(1, username);
		ResultSet rs = st.executeQuery();
		
		User u = new User();
		
		if(rs.next()) {
			
			u.id = rs.getInt("id");
			u.firstname = rs.getString("firstname");
			u.lastname = rs.getString("lastname");
			u.username = rs.getString("username");
			u.email = rs.getString("email");
			u.password = rs.getString("password");
			
		}
		
		return u;
		
	}
	
}

