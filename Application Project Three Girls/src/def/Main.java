package def;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


public class Main {

	public Connection getCon() throws Exception {

		String url = "jdbc:postgresql://localhost:5432/Library";
        String user = "andebner";
        String password = "apenproject";

        Connection con = DriverManager.getConnection(url, user, password);
       
        return con;
        
	}

	public ArrayList<Book> getBooks() throws Exception {

		Statement st = getCon().createStatement();
		ResultSet rs = st.executeQuery("SELECT id, title, author, year, pages FROM books"); {
		
		ArrayList<Book> result = new ArrayList<Book>();
		
            while (rs.next()) {
            	
            	Book b = new Book();
            	b.id = rs.getInt(1);
            	b.title = rs.getString(2);
            	b.author = rs.getString(3);
            	b.year = rs.getInt(4);
            	b.pages = rs.getInt(5);
            	result.add(b);
            }
        
        return result;
            
        } 
		
	}
	
	public Book getBook(int id) throws Exception {
		
		PreparedStatement st = getCon().prepareStatement("SELECT id, title, author, year, pages FROM books WHERE id = ?");
		
		st.setInt(1, id);
		ResultSet rs = st.executeQuery();
		
		Book b = new Book();
		
		if(rs.next()) {
			
			b.id = rs.getInt("id");
			b.title = rs.getString("title");
			b.author = rs.getString("author");
			b.year = rs.getInt("year");
			b.pages = rs.getInt("pages");
			
		}
		
		return b;
		
	}
	
	public void addBook(Book b) throws Exception {
		
		PreparedStatement st = getCon().prepareStatement("INSERT INTO books (\"title\", \"author\", \"year\", \"pages\") VALUES (?, ?, ?, ?)");
		
		st.setString(1, b.title);
		st.setString(2, b.author);
		st.setInt(3, b.year);
		st.setInt(4, b.pages);
		st.execute();
		
	}
	
	public void updateBook(int id, Book b) throws Exception {
		
		PreparedStatement st = getCon().prepareStatement("UPDATE books SET title = ?, author = ?, year = ?, pages = ? WHERE id = ?;");
		
		st.setString(1, b.title);
		st.setString(2, b.author);
		st.setInt(3, b.year);
		st.setInt(4, b.pages);
		st.setInt(5, id);
		st.execute();
		
	}
	
	public void deleteBook(int id) throws Exception {
		
		PreparedStatement st = getCon().prepareStatement("DELETE FROM books WHERE id = ?");
		
		st.setInt(1, id);
		st.execute();
		
	}
	
}
