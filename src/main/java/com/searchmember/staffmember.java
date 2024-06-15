package com.searchmember;

public class staffmember {
	
	private String id;
	private String name;
	private double basicsalary;
	private String phone;
	private String address;
	
	public staffmember(String id, String name, double basicsalary, String phone, String address) {
		this.id = id;
		this.name = name;
		this.basicsalary = basicsalary;
		this.phone = phone;
		this.address = address;
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public double getBasicsalary() {
		return basicsalary;
	}

	public String getPhone() {
		return phone;
	}

	public String getAddress() {
		return address;
	}

	
		

}
