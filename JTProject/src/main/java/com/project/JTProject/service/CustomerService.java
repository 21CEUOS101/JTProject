package com.project.JTProject.service;

import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.project.JTProject.model.FeedBack;
import com.project.JTProject.model.Locations;
import com.project.JTProject.model.Name;

@Service
@Component 
public interface CustomerService {
	
	// ------------------------- Customer ---------------------------------
	
	boolean verify(int uid,String password);
	
	boolean register(int count, String password , Name name, String email_id , long mobile_no);
	
	boolean deleteCustomer(int id);
	
	// ------------------------- Locations ---------------------------------
	
	boolean addLocation(int id,String amenity,String name,double logitude,double latitude);
	
	boolean deleteLocation(int id);
	
	List<Locations> fetchLocations(int id);

	// ------------------------- FeedBack ---------------------------------
	
	boolean addFeedback(int cid,String msg);
	
	boolean deleteFeedback(int fid);
	
	boolean updateFeedback(int fid, String feedback);
	
	
	List<FeedBack> fetchFeedBack(int id);
	
	

}
