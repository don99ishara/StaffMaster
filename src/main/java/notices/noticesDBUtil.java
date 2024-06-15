package notices;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.main.common;

import notices.DBConnect;

public class noticesDBUtil implements common{

    private static boolean isSuccess;
    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;


    public static boolean createnotice(String title, String content, Date date, String author) {

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String formattedDate = dateFormat.format(date);

            String sql = "INSERT INTO notices (title, content, notice_date, author) VALUES (?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(sql);

            pstmt.setString(1, title);
            pstmt.setString(2, content);
            pstmt.setString(3, formattedDate);
            pstmt.setString(4, author);

            int rs = pstmt.executeUpdate();

            if (rs > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }

    // Retrieve all notices from the database
    public static List<notices> getAllNotices() {
        List<notices> noticesList = new ArrayList<>();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            String sql = "SELECT * FROM notices";
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                String content = rs.getString("content");
                Date notice_date = rs.getDate("notice_date");
                String author = rs.getString("author");

                notices notice = new notices(id, title, content, notice_date, author);
                noticesList.add(notice);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return noticesList;
    }

    // Update notices
    public static boolean updateNotice(String id, String title, String content, Date date, String author) {
        try {
            con = DBConnect.getConnection();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String formattedDate = dateFormat.format(date);

            String sql = "UPDATE notices SET title = ?, content = ?, notice_date = ?, author = ? WHERE id = ?";
            PreparedStatement pstmt = con.prepareStatement(sql);

            pstmt.setString(1, title);
            pstmt.setString(2, content);
            pstmt.setString(3, formattedDate);
            pstmt.setString(4, author);
            pstmt.setString(5, id);

            int rs = pstmt.executeUpdate();

            if (rs > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }

            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        return isSuccess;
    }

    
    public List<notices> getDetails(String Id) {
    	
    	int convertedID = Integer.parseInt(Id);
    	
        ArrayList<notices> not = new ArrayList<>();
try {
        
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            String sql = "SELECT * FROM notices WHERE id = '"+convertedID+"'";
           
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt(1);
                String title = rs.getString(2);
                String content = rs.getString(3);
                Date date = rs.getDate(4);
                String author = rs.getString(5);

                notices no = new notices(id, title, content, date, author);
                not.add(no);
            }
}
         catch (Exception e) {
            e.printStackTrace();
        } 

        return not;
    }
    

    //delete notices
    public static boolean deleteNotice(String id)
    {
    	int convId = Integer.parseInt(id);
    	
    try {
    		
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		
    		String sql = "delete from notices where id='"+convId+"'";
    		
    		
    		int r = stmt.executeUpdate(sql);
    		
    		if (r>0)
    		{
    			isSuccess = true;
    		}
    		else 
    		{
    			isSuccess = false;
    		}
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	
    	
    	
    	
    	
    	return isSuccess;
    }
    }







