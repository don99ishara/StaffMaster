package com.staff;

public class StaffDetails {
	
	private String StaffID;
	private String fname;
	private String lname;
	private String NIC;
	private String dob;
	private String email;
	private String mobile;
	private String address;
	private String position;
	private String department;
	private String username;
	private String password;
	
	public StaffDetails(String staffID, String fname, String lname, String nIC, String dob, String email, String mobile,
			String address, String position, String department, String username, String password) {
		this.StaffID = staffID;
		this.fname = fname;
		this.lname = lname;
		this.NIC = nIC;
		this.dob = dob;
		this.email = email;
		this.mobile = mobile;
		this.address = address;
		this.position = position;
		this.department = department;
		this.username = username;
		this.password = password;
	}

	public String getStaffID() {
		return StaffID;
	}
	
	public String getFname() {
		return fname;
	}

	public String getLname() {
		return lname;
	}

	public String getNIC() {
		return NIC;
	}

	public String getDob() {
		return dob;
	}

	public String getEmail() {
		return email;
	}

	public String getMobile() {
		return mobile;
	}

	public String getAddress() {
		return address;
	}

	public String getPosition() {
		return position;
	}

	public String getDepartment() {
		return department;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}
}
