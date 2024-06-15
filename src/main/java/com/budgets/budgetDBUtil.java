package com.budgets;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.searchmember.staffmember;

public class budgetDBUtil {
	
	public static boolean insertBudget(String BudgetID, String deptID, String title, String description, String amount, String currencyType, Date date, String notes) {
		
		boolean isSuccess = false;
		
		//creating database connection
		//create database connection
		String url = "jdbc:mysql://localhost:3306/staff";
		String user = "root";
		String password = "@west2qm90";
		
		try {
			
            Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(url, user, password);
			Statement stmt = con.createStatement();
			
			String sql = "insert into budgets values ('"+BudgetID+"','"+deptID+"','"+title+"','"+description+"','"+amount+"','"+currencyType+"','"+date+"','"+notes+"')";
			int results = stmt.executeUpdate(sql);
			
			if(results>0) {
				isSuccess=true;
			}
			else {
				isSuccess=false;
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}		
				
		return isSuccess;
	}

	
	
	
	/*new*/
public static List<budget> getbudgetdetails(){
		
		ArrayList<budget> bd = new ArrayList<>();
		
		//create database connection
		String url = "jdbc:mysql://localhost:3306/staff";
		String user = "root";
		String password = "@west2qm90";
		
		try {
            Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(url, user, password);
			Statement stmt = con.createStatement();
			String sql = "select * from budgets";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				String budgetid = rs.getString(1);
				String dname = rs.getString(2);
				String title = rs.getString(3);
				String descrip = rs.getString(4);
				double amount = rs.getDouble(5);
				String currtype = rs.getString(6);
				Date date = rs.getDate(7);
				String notes = rs.getString(8);
				
				budget bud = new budget(budgetid,dname,title,descrip,amount,currtype,date,notes);
			    bd.add(bud);
			}
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return bd;
	}










    public static boolean deletebudget(String bid) {
    	
    	boolean issuccess = false;
    	
    	//create database connection
    		String url = "jdbc:mysql://localhost:3306/staff";
    		String user = "root";
    		String password = "@west2qm90";
    	
    	try {
    		 Class.forName("com.mysql.jdbc.Driver");
 			
 			Connection con = DriverManager.getConnection(url, user, password);
 			Statement stmt = con.createStatement();
 			String sql = "delete from budgets where budget_id='"+bid+"'";
 			int r = stmt.executeUpdate(sql);
 			
 			if(r>0) {
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




	


	
	
	
	
	
	
	
	
	
	
	
	

}
