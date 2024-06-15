package com.request;

import java.sql.ResultSet;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.request.request;
import com.main.common;
import com.request.DBConnect;

import java.sql.Connection;
import java.sql.Date;

public class requestUtil implements common{
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	
	//create a new leave request
	public static boolean createLeaveRequest(String employeeName,String employeeId,String leaveType,Date startDate,Date endDate,String reason) {
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "insert into request values (0,'"+employeeName+"','"+employeeId+"','"+leaveType+"','"+startDate+"','"+endDate+"','"+reason+"');";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true ;
			}
			else {
				isSuccess = false ;
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
		
		
	}
	
	
	//read function
	public List<request> getDetails(String mid){
		
		ArrayList<request> req = new ArrayList<>();
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from request where smid='"+mid+"' ;";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String smid = rs.getString(3);
				String leaveType = rs.getString(4);
				Date startDate = rs.getDate(5);
				Date endDate = rs.getDate(6);
				String reason = rs.getString(7);
				
				request r = new request(id,name,smid,leaveType,startDate,endDate,reason);
				req.add(r);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return req;
		
	}
	
	
	//update request
	public static boolean UpdateRequest(String id,String name,String smid,String leavetype,Date startdate,Date enddate,String reason) {
		
		int convertedId = Integer.parseInt(id);
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "update request set type='"+leavetype+"',startdate='"+startdate+"',enddate='"+enddate+"',reason='"+reason+"' where id='"+convertedId+"'";
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
				isSuccess=true;
			}else {
				isSuccess=false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return isSuccess;
	}
	
	//delete request
	public static boolean DeleteRequest(String id) {
		
		int convertedId = Integer.parseInt(id);
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "delete from request where id ='"+convertedId+"' ;" ;
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
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

}
