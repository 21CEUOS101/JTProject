package com.project.JTProject.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

@Entity 
public class Locations {
	
	@Id 
	@GeneratedValue(strategy = GenerationType.AUTO)
	int id;
	
	@ManyToOne
	Customer customer;
	
	String amenity;
	
	String name;
	
	double logitude;
	
	double latitude;

	
	@Override
	public String toString() {
		return "Locations [id=" + id + ", amenity=" + amenity + ", name=" + name
				+ ", logitude=" + logitude + ", latitude=" + latitude + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public String getAmenity() {
		return amenity;
	}
	public void setAmenity(String amenity) {
		this.amenity = amenity;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getLogitude() {
		return logitude;
	}
	public void setLogitude(double logitude) {
		this.logitude = logitude;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

}
