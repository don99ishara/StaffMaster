package com.request;

import java.sql.Date;

public class request {
	
	private int id;
	private String staffName;
	private String staffId;
	private String leaveType;
	private Date startDate;
	private Date endDate;
	private String reason;
	
	public request (int id,String staffName,String staffId,String leaveType,Date startDate,Date endDate,String reason) {
		
		this.id=id;
		this.staffName= staffName;
		this.staffId = staffId;
		this.leaveType = leaveType;
		this.startDate = startDate;
		this.endDate = endDate;
		this.reason = reason;
		
	}
	
	public int getid() {
		return id;
	}
	public String getstaffName() {
		return staffName;
	}
	
	public String getstaffId() {
		return staffId;
	}
	
	public String getLeaveType() {
		return leaveType;
	}
	
	public Date getStartDate() {
		return startDate;
	}
	
	public Date getEndDate() {
		return endDate;
	}
	
	public String getReason() {
		return reason;
	}
}
