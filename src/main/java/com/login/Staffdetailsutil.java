package com.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.login.StaffDetails;
import com.main.common;

public class Staffdetailsutil implements common{
	
	
	public static boolean validate(String username,String password) {
		
		boolean check=false;
		
		String url = "jdbc:mysql://localhost:3306/staff";
		String uname = "root";
		String pwd = "@west2qm90";
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, uname, pwd);
			Statement stmt = con.createStatement();
			String sql = "select * from staffdetails where username = '"+username+"' and password = '"+password+"';";
			ResultSet rs = stmt.executeQuery(sql);
			
			
			if(rs.next()){
				check=true;
			}else {
				check=false;
			}
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return check;
		
		
	}


	public List<StaffDetails> getDetails(String username)
	{
		ArrayList <StaffDetails> staff = new ArrayList <>();

		String url = "jdbc:mysql://localhost:3306/staff";
		String uname = "root";
		String pwd = "@west2qm90";

		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, uname, pwd);
			Statement stmt = con.createStatement();
			String sql = "select * from staffdetails where username = '"+username+"';";
			ResultSet rs = stmt.executeQuery(sql);

			while(rs.next())
			{
				String StaffID = rs.getString(1);
				String fname = rs.getString(2);
				String lname = rs.getString(3);
				String NIC = rs.getString(4);
				String dob = rs.getString(5);
				String email = rs.getString(6);
				String mobile = rs.getString(7);
				String address = rs.getString(8);
				String position = rs.getString(9);
				String department = rs.getString(10);
				String uname1 = rs.getString(11);
				String password = rs.getString(12);

				StaffDetails sd = new StaffDetails(StaffID,fname,lname,NIC,dob,email,mobile,address,position,department,uname1,password);

				staff.add(sd);

			}

		}catch(Exception e)
		{
			e.printStackTrace();
		}	

		return staff;
	}

}
