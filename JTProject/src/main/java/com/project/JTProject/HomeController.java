package com.project.JTProject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.JTProject.model.FeedBack;
import com.project.JTProject.model.Locations;
import com.project.JTProject.model.Name;
import com.project.JTProject.service.CustomerService;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;
@Controller  
public class HomeController {

	
	
// --------------------------------------------------------------------------------------------------
// Initialization -> CE111
// --------------------------------------------------------------------------------------------------

	@Autowired
	CustomerService cs;
	
	static int count=0;
	
// --------------------------------------------------------------------------------------------------
// Home Page -> CE111
// --------------------------------------------------------------------------------------------------
	
	@RequestMapping("/")
	public String home()
	{
		return "Main";
	}
	
// --------------------------------------------------------------------------------------------------
// login and verification -> CE111
// --------------------------------------------------------------------------------------------------
	
	@PostMapping("/login-after")
	public ModelAndView login(HttpSession session,@RequestParam("username") String username,@RequestParam("uid") int uid, @RequestParam("password") String password)
	{
		ModelAndView mv =new ModelAndView();
		
		if(cs.verify(uid, password))
		{
			mv.setViewName("Home");
			mv.addObject("userid",uid);
		}
		else
		{
			mv.setViewName("Login");
			return mv;
		}
		
		session.setAttribute("userid", uid);
		return mv;
	}
	
	@GetMapping("/login")
	public String login()
	{
		
		return "Login";
	}

// --------------------------------------------------------------------------------------------------
// registration -> CE111
// --------------------------------------------------------------------------------------------------
	
	@PostMapping("/register-after")
	public String register(@RequestParam("fname")String FName , @RequestParam("mname") String MName, @RequestParam("lname") String LName , @RequestParam("email_id") String Email_id , @RequestParam("mobile_no")long Mobile_No , @RequestParam("password") String Password , @RequestParam("verify-password") String Vpassword, Model model)
	{
		if(!Password.equals(Vpassword))
		{
			model.addAttribute("msg", "Password not verified");
			return "redirect:/register";
		}
		
		count = (int) (Math.random() * 1000);

		Name name = new Name();
		name.setFName(FName);
		name.setMName(MName);
		name.setLName(LName);

		cs.register(count, Password, name, Email_id, Mobile_No);
		
		model.addAttribute("ID", count);
		return "Login";
	}
	
	@GetMapping("/register")
	public String register()
	{
		return "Register";
	}
	
	@RequestMapping("/deleteCustomer")
	public String deleteCustomer()
	{
		cs.deleteCustomer(count);
		return "redirect:/";
	}

// --------------------------------------------------------------------------------------------------
// locations -> CE111
// --------------------------------------------------------------------------------------------------
	
	@RequestMapping("/locations")
	public ModelAndView location(@RequestParam("amenity") String amenity){
		
		ModelAndView modelAndView = new ModelAndView("Locations");
		modelAndView.addObject("amenity", amenity);
		modelAndView.setViewName("Locations");
        
        return modelAndView;
	}
	
	@PostMapping(value = "/addLocation")
	public String addLocation(@RequestParam("amenity") String amenity,
            @RequestParam("name") String name,
            @RequestParam("longitude") double longitude,
            @RequestParam("latitude") double latitude)
	{
		ModelAndView modelandview = new ModelAndView();
		System.out.println("Ashish Prajapati");
		
		String msg = new String();
		
		if(cs.addLocation(count, amenity, name, longitude, latitude))
		{
			msg = "Your data is Successfully saved !";
			modelandview.addObject("msg", msg);
			System.out.print("Successful");
		}
		else
		{
			msg = "Your data is not saved. Please try again !!";
			modelandview.addObject("msg", msg);
			System.out.println("Failure");
		}
		List<Locations> locations = cs.fetchLocations(count);
		modelandview.addObject("locations", locations);
		modelandview.setViewName("BookMarks");
		
		
		return "redirect:/getLocations";
		
	}
	
	@PostMapping(value = "/addLocation_diff")
	@ResponseBody
	public String addLocation(@RequestBody Map<String, String> locationData) {
	    String amenity = locationData.get("amenity");
	    String name = locationData.get("name");
	    double latitude = Double.parseDouble(locationData.get("latitude"));
	    double longitude = Double.parseDouble(locationData.get("longitude"));

	    ModelAndView modelandview = new ModelAndView();
	    System.out.println("Ashish Prajapati");

	    String msg = new String();

	    if(cs.addLocation(count, amenity, name, longitude, latitude)) {
	        msg = "Your data is Successfully saved !";
	        modelandview.addObject("msg", msg);
	        System.out.print("Successful");
	    } else {
	        msg = "Your data is not saved. Please try again !!";
	        modelandview.addObject("msg", msg);
	        System.out.println("Failure");
	    }

	    List<Locations> locations = cs.fetchLocations(count);
	    modelandview.addObject("locations", locations);
	    modelandview.setViewName("BookMarks");

	    return "redirect:/getLocations";
	}
	
	@RequestMapping(value = "/deleteLocation")
	public String deleteLocation(int lid)
	{
		cs.deleteLocation(lid);
		return "redirect:/getLocations";
	}
	
	@RequestMapping("/getLocations")
	public ModelAndView getLocations()
	{
		ModelAndView modelandview = new ModelAndView();
		List<Locations> locations = cs.fetchLocations(count);
		
		if(locations.size()==0)
		{
			System.out.print("No data is added");
		}
		else
		{
			for(Locations i : locations)
			{
				System.out.println(i);
			}
		}
		modelandview.addObject("locations", locations);
		modelandview.setViewName("BookMarks");
		return modelandview;
	}
	
// --------------------------------------------------------------------------------------------------
// feedbacks -> CE111
// --------------------------------------------------------------------------------------------------
	
	@RequestMapping("/getFeedbacks")
	public ModelAndView getfeedbacks()
	{
		ModelAndView modelandview = new ModelAndView();
		List<FeedBack> feedbacks = cs.fetchFeedBack(count);
		modelandview.addObject("feedbacks", feedbacks);
		modelandview.setViewName("FeedBack");
		return modelandview;
	}
	
	@PostMapping("/addFeedback")
	public String addFeedback(@RequestParam("feedback") String text)
	{
		ModelAndView modelandview = new ModelAndView();
		cs.addFeedback(count, text);
		List<FeedBack> feedbacks = cs.fetchFeedBack(count);
		modelandview.addObject("feedbacks", feedbacks);
		modelandview.setViewName("FeedBack");
		return "redirect:/getFeedbacks";
	}
	
	@RequestMapping("/updateFeedback")
	public String updateFeedback(@RequestParam("feedback") String review,@RequestParam("fid") int fid)
	{
		ModelAndView modelandview = new ModelAndView();
		cs.updateFeedback(fid, review);
		
		List<FeedBack> feedbacks = cs.fetchFeedBack(count);
		modelandview.addObject("feedbacks", feedbacks);
		modelandview.setViewName("FeedBack");
		return "redirect:/getFeedbacks";
	}
	
	@RequestMapping("/deleteFeedback")
	public String DeleteFeedback(@RequestParam("fid") int fid)
	{
		ModelAndView modelandview = new ModelAndView();
		cs.deleteFeedback(fid);
		List<FeedBack> feedbacks = cs.fetchFeedBack(count);
		modelandview.addObject("feedbacks", feedbacks);
		modelandview.setViewName("FeedBack");
		return "redirect:/getFeedbacks";
	}

	
}
