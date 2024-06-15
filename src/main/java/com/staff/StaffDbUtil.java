package com.staff;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;


public class StaffDbUtil {
	
	public static boolean insertStaff(String id,String fname, String lname, String nic, String dob, String email, String phone, String  address, String position, String dept, String username, String password)
	{
		boolean isSuccesfull = false;
		
		String url = "jdbc:mysql://localhost:3306/staff";
		String uname = "root";
		String pwd = "Jaya@123";
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, uname, pwd);
			Statement stmt = con.createStatement();
			String sql = "insert into staffdetails values ('"+id+"', '"+fname+"','"+lname+"','"+nic+"','"+dob+"','"+email+"','"+phone+"','"+address+"','"+position+"','"+dept+"','"+username+"','"+password+"')";
			int rs = stmt.executeUpdate(sql);		
			
			if(rs > 0)
			{
				isSuccesfull = true;
			}else
			{
				isSuccesfull = false;
			}		
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}	
		return isSuccesfull;
	}
}
	

