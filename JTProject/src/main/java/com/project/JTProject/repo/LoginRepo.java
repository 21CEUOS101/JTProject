package com.project.JTProject.repo;

import org.springframework.data.repository.CrudRepository;

import com.project.JTProject.model.Login_Info;

public interface LoginRepo extends CrudRepository<Login_Info,Integer>  {

}
