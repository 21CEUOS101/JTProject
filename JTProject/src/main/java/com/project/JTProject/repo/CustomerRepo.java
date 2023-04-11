package com.project.JTProject.repo;

import org.springframework.data.repository.CrudRepository;

import com.project.JTProject.model.Customer;

public interface CustomerRepo extends CrudRepository<Customer,Integer> {

}
