package com.staff;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class UpdateStaffUtil {
	
	public static boolean UpdateStaff(String id, String fname, String lname, String nic, String dob, String email, String phone, String  address, String position, String dept, String username, String password)
	{
		boolean isSuccesfull = false;
		
		String url = "jdbc:mysql://localhost:3306/staff";
		String uname = "root";
		String pwd = "@west2qm90";
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, uname, pwd);
			Statement stmt = con.createStatement();
			String sql = " update staffdetails set fname='"+fname+"',lname='"+lname+"', nic='"+nic+"',dob='"+dob+"',email='"+email+"',mobile='"+phone+"',address='"+address+"',position='"+position+"',department='"+dept+"',username='"+username+"',password='"+password+"'"+" where staffID='"+id+"'";
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
