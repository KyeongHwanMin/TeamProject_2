package jejuguseok_map;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jejuguseok_map.ConnectionDAO;
import jejuguseok_map.ItemDTO;

public class ItemDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	FileInputStream fs=null;
	FileOutputStream fos=null;
	
	public void insertItem(ItemDTO Item) throws Exception {
		try {
		conn = ConnectionDAO.getConnection(); 
		String sql = "insert into placeUpload values(?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, Item.getPlace_name());
		pstmt.setString(2, Item.getAddress());
		pstmt.setString(3, Item.getCategory());
		pstmt.setString(4, Item.getImg());
		pstmt.setString(5, Item.getContent());
	
		pstmt.executeUpdate();	
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
	}
	
	
}
