package com.example.crud.repository;

import java.util.List;

import com.example.crud.model.Board;
import com.example.crud.viewmodel.BoardList;

public interface BoardRepository {
	void save(Board board);
	List<BoardList> findAll();
	BoardList findById(int id);
	Board findByIdUpdateForm(Board board);
	void update(Board board);
	int delete(Board board);
}
