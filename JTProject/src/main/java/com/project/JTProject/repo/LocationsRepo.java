package com.project.JTProject.repo;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.project.JTProject.model.Customer;
import com.project.JTProject.model.Locations;


public interface LocationsRepo  extends CrudRepository<Locations ,Integer> {
	
	public List<Locations> findByCustomer(Customer cs);

}
