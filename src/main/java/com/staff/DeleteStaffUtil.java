package com.staff;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DeleteStaffUtil {
	
	public static boolean DeleteStaff(String id)
	{
		boolean isSuccesfull = false;
		
		
		String url = "jdbc:mysql://localhost:3306/staff";
		String uname = "root";
		String pwd = "@west2qm90";
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, uname, pwd);
			Statement stmt = con.createStatement();
			String sql = "delete from staffdetails where staffID = '"+id+"'";
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
