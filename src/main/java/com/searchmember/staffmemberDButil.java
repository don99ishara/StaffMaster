package com.searchmember;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.main.common;


public class staffmemberDButil implements common {

	public static List<staffmember> validate(String memberID){

		ArrayList<staffmember> sm = new ArrayList<>();

		//create database connection
		String url = "jdbc:mysql://localhost:3306/staff";
		String user = "root";
		String password = "@west2qm90";

		//validate
		try {
			Class.forName("com.mysql.jdbc.Driver");

			Connection con = DriverManager.getConnection(url, user, password);
			Statement stmt = con.createStatement();
			String sql = "select * from staffmember where id = '"+memberID+"'";
			ResultSet rs = stmt.executeQuery(sql);

			if(rs.next()) {
				String id = rs.getString(1);
				String name = rs.getString(2);
				double basicsalary = rs.getDouble(3);
				String phone = rs.getString(4);
				String address = rs.getString(5);

				staffmember sm1 = new staffmember(id, name, basicsalary,phone,address);
				sm.add(sm1);
			}

		}
		catch(Exception e) {
			e.printStackTrace();
		}



		return sm;

	}



	public static boolean updatesalary(String smid, String salary) {

		double sal = Double.parseDouble(salary);

		boolean issuccess = false;

		//create database connection
		String url = "jdbc:mysql://localhost:3306/staff";
		String user = "root";
		String password = "@west2qm90";

		try {
			Class.forName("com.mysql.jdbc.Driver");

			Connection con = DriverManager.getConnection(url, user, password);
			Statement stmt = con.createStatement();
			String sql = "update staffmember set basicsalary ='"+sal+"' where id = '"+smid+"'";
			int rs = stmt.executeUpdate(sql);

			if(rs>0) {
				issuccess=true;
			}
			else {
				issuccess=false;
			}

		}
		catch(Exception e) {
			e.printStackTrace();
		}

		return issuccess;

	}




	public List<staffmember> getDetails(String smID){

		ArrayList<staffmember> sm = new ArrayList<>();

		//create database connection
		String url = "jdbc:mysql://localhost:3306/staff";
		String user = "root";
		String password = "@west2qm90";

		try {
			Class.forName("com.mysql.jdbc.Driver");

			Connection con = DriverManager.getConnection(url, user, password);
			Statement stmt = con.createStatement();
			String sql = "select * from staffmember where id = '"+smID+"'";
			ResultSet rs = stmt.executeQuery(sql);

			while(rs.next()) {
				String id = rs.getString(1);
				String name = rs.getString(2);
				double basicsalary = rs.getDouble(3);
				String phone = rs.getString(4);
				String address = rs.getString(5);

				staffmember stfmem = new staffmember(id,name,basicsalary,phone,address);
				sm.add(stfmem); 
			}


		}
		catch(Exception e) {
			e.printStackTrace();
		}


		return sm;
	}
	
	
	
	public static List<staffmember> getstaffmemberdetails(){

		ArrayList<staffmember> sm = new ArrayList<>();

		//create database connection
		String url = "jdbc:mysql://localhost:3306/staff";
		String user = "root";
		String password = "@west2qm90";

		try {
			Class.forName("com.mysql.jdbc.Driver");

			Connection con = DriverManager.getConnection(url, user, password);
			Statement stmt = con.createStatement();
			String sql = "select * from staffmember ";
			ResultSet rs = stmt.executeQuery(sql);

			while(rs.next()) {
				String id = rs.getString(1);
				String name = rs.getString(2);
				double basicsalary = rs.getDouble(3);
				String phone = rs.getString(4);
				String address = rs.getString(5);

				staffmember stfmem = new staffmember(id,name,basicsalary,phone,address);
				sm.add(stfmem); 
			}


		}
		catch(Exception e) {
			e.printStackTrace();
		}


		return sm;
	}
	
	
	
	
	



















}
