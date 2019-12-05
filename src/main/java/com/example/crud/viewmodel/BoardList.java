package com.example.crud.viewmodel;

import java.sql.Timestamp;

import com.example.crud.model.User;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardList {
	
	private int id;
	private String title;
	private String content;
	private Timestamp createDate;

	
	private User user;//껍데기
	private String username;
	private String email;
	private String userProfile;
}
