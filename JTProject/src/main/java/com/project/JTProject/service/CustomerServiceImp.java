package com.project.JTProject.service;

import java.time.LocalDate;
import java.util.*;
import java.util.Date;
import java.util.List;

import org.apache.catalina.filters.CsrfPreventionFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.project.JTProject.model.Customer;
import com.project.JTProject.model.FeedBack;
import com.project.JTProject.model.Locations;
import com.project.JTProject.model.Login_Info;
import com.project.JTProject.model.Name;
import com.project.JTProject.repo.CustomerRepo;
import com.project.JTProject.repo.FeedBackRepo;
import com.project.JTProject.repo.LocationsRepo;
import com.project.JTProject.repo.LoginRepo;



@Service
@Component 
public class CustomerServiceImp implements CustomerService {

	
	// ---------------------- Initialization ---------------------------
	
	@Autowired
	LoginRepo lr;
	
	@Autowired 
	CustomerRepo cr;
	
	@Autowired
	LocationsRepo lcsr;
	
	@Autowired
	FeedBackRepo fr;
	
	
	// ------------------------- Customer ---------------------------------
	@Override
	public boolean verify(int uid,String password) {
		
		Customer customer = cr.findById(uid).orElse(null);
		
		Login_Info user = new Login_Info();
		if(customer!=null)
		{
			user = customer.getLi();
		}
		
		
		if(user.getPassword().equals(password))
		{
			return true;
		}
		return false;
	}

	@Override
	public boolean register(int count, String password , Name name, String email_id , long mobile_no) {
		
		boolean flag = true;

		// ---- Login_Info ----
		
		Login_Info login_info = new Login_Info();
		
		login_info.setId(count);
		login_info.setPassword(password);
		
		// ---- Customer ----
		
		Customer cs = new Customer();
		
		cs.setId(count);
		cs.setMobile_no(mobile_no);
		cs.setName(name);
		cs.setLi(login_info);
        
		LocalDate localDate = LocalDate.now();
        Date date = java.sql.Date.valueOf(localDate);
		cs.setJoining_date(date);
		
		try 
		{
			cr.save(cs);
		}
		catch(Exception e)
		{
			flag=false;
		}
		
		
		return flag;
	}
	
	@Override
	public boolean deleteCustomer(int id) {
		
		boolean flag = false;
		try {
			flag = true;
			cr.deleteById(id);
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		return flag;
	}
	
	// ------------------------- FeedBack ---------------------------------

	@Override
	public boolean addFeedback(int cid,String msg) {
		
		FeedBack feedback = new FeedBack();
		Customer customer = cr.findById(cid).orElse(null);
		LocalDate localDate = LocalDate.now();
		Date date = java.sql.Date.valueOf(localDate);
		
		boolean flag = false;
		try {
			feedback.setCustomer(customer);
			feedback.setDate(date);
			feedback.setFeedback(msg);
			fr.save(feedback);
		}
		catch(Exception e)
		{
			System.out.print(e.getMessage());
		}
			
		return flag;
	}
	
	@Override
	public boolean deleteFeedback(int fid) {
		
		boolean flag = false;
		try {
			flag=true;
			fr.deleteById(fid);
		}
		catch(Exception e)
		{
			System.out.print(e.getMessage());
		}
		return flag;
	}

	@Override
	public boolean updateFeedback(int fid, String feedback) {
		
		boolean flag = false;
		try {
			flag=true;
			FeedBack fb = fr.findById(fid).orElse(null);
			fb.setFeedback(feedback);
			fr.save(fb);
		}
		catch(Exception e)
		{
			System.out.print(e.getMessage());
		}
		return flag;
	}

	@Override
	public List<FeedBack> fetchFeedBack(int id) {
		
		Customer customer = cr.findById(id).orElse(null);
		List<FeedBack> feedbacks = customer.getFeedback();
		return feedbacks;
	}
	
	
	// ------------------------- Locations ---------------------------------

	


	@Override
	public boolean addLocation(int id,String amenity,String name,double longitude,double latitude) {
		
		Locations l = new Locations();
		l.setAmenity(amenity);
		l.setLatitude(latitude);
		l.setLogitude(longitude);
		l.setName(name);
		
		Customer cs = cr.findById(id).orElse(null);
		l.setCustomer(cs);
		
		try 
		{
			lcsr.save(l);
		}
		catch(Exception e)
		{
			return false;
		}
		
		return true;
	}
	
	@Override
	public List<Locations> fetchLocations(int id){
		
		Customer customer = cr.findById(id).orElse(null);
		
		List<Locations> locations = customer.getLocations();
		
		return locations;
	}

	@Override
	public boolean deleteLocation(int id) {
		
		boolean flag = false;
		try {
			flag=true;
			lcsr.deleteById(id);
		}
		catch(Exception e)
		{
			System.out.print(e.getMessage());
		}
		return flag;
	}

	

	


}
