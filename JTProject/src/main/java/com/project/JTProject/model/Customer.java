package com.project.JTProject.model;

import java.util.Date;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Embedded;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
@Entity 
public class Customer {
	
	@Id 
	int id;
	
	@Embedded 
	Name name;
	
	Date joining_date;
	
	long mobile_no;
	
	@OneToOne(cascade=CascadeType.ALL)
	Login_Info li;
	
	@OneToMany(mappedBy="customer",cascade=CascadeType.ALL) 
	List<Locations> locations;
	
	@OneToMany(mappedBy="customer",cascade=CascadeType.ALL)
	List<FeedBack> feedback;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Name getName() {
		return name;
	}
	public void setName(Name name) {
		this.name = name;
	}
	public Date getJoining_date() {
		return joining_date;
	}
	public void setJoining_date(Date date) {
		this.joining_date = date;
	}
	public long getMobile_no() {
		return mobile_no;
	}
	public void setMobile_no(long mobile_no) {
		this.mobile_no = mobile_no;
	}
	
	public Login_Info getLi() {
		return li;
	}
	public void setLi(Login_Info li) {
		this.li = li;
	}	
	
	public List<Locations> getLocations() {
		return locations;
	}
	public void setLocations(List<Locations> locations) {
		this.locations = locations;
	}
	public List<FeedBack> getFeedback() {
		return feedback;
	}
	public void setFeedback(List<FeedBack> feedback) {
		this.feedback = feedback;
	}
	
	

}
