package com.example.crud.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Board {

	private int id;
	private String title;
	private String content;
	private Timestamp createDate;
	private int userId;	//FK
}
