package com.example.crud.repository;

import com.example.crud.model.User;

public interface UserRepository {
	
	void save(User user);
	User findByUsernameAndPassword(User user);
	Integer findByUsernameCheck(String username);
	void update(User user);
	User findByUsername(String username);
}
