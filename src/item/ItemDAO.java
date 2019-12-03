package item;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import item.Item;

public class ItemDAO {
	private Connection conn;
	private ResultSet rs;
	
	public ItemDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/NJSHOP?serverTimezone=UTC";
			String dbID="root";
			String dbPassword="root";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection(dbURL,dbID,dbPassword);
			
		} catch(Exception e) {
			e.printStackTrace();
			
		}
	}
	
	public int addItem(Item item) {
		String SQL = "INSERT INTO ITEM VALUES (?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, item.getItemname());
			pstmt.setString(2, item.getCategory());
			pstmt.setString(3, item.getImglink());
			pstmt.setInt(4, item.getPrice());
			pstmt.setString(5, item.getContent());
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<Item> getList(){
		String SQL = "SELECT * FROM ITEM";
		ArrayList<Item> list = new ArrayList<Item>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Item Item = new Item();
				Item.setItemname(rs.getString(1));
				Item.setCategory(rs.getString(2));
				Item.setImglink(rs.getString(3));
				Item.setPrice(rs.getInt(4));
				Item.setContent(rs.getString(5));
				list.add(Item);
			}
		}	catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
