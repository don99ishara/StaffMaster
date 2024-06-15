package com.budgets;

import java.util.Date;

public class budget {
	
	private String budgetID;
	private String deptID;
	private String title;
	private String description;
	private Double amount;
	private String currencyType;
	private Date date;
	private String Notes;
	
	public budget(String budgetID, String deptID, String title, String description, Double amount, String currencyType,
			Date date, String notes) {
		super();
		this.budgetID = budgetID;
		this.deptID = deptID;
		this.title = title;
		this.description = description;
		this.amount = amount;
		this.currencyType = currencyType;
		this.date = date;
		Notes = notes;
	}

	public String getBudgetID() {
		return budgetID;
	}

	public String getDeptID() {
		return deptID;
	}

	public String getTitle() {
		return title;
	}

	public String getDescription() {
		return description;
	}

	public Double getAmount() {
		return amount;
	}

	public String getCurrencyType() {
		return currencyType;
	}

	public Date getDate() {
		return date;
	}

	public String getNotes() {
		return Notes;
	}



}
