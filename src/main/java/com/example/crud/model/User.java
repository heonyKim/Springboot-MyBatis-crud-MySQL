package com.example.crud.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {

	private int id;
	private String username;
	private String password;
	private String email;	
	private Timestamp createDate;
	private String userProfile;
	private String role;
}
