package com.example.crud.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.crud.model.Board;
import com.example.crud.model.User;
import com.example.crud.repository.BoardRepository;
import com.example.crud.viewmodel.BoardList;

@Controller
public class BoardController {

	@Autowired
	private BoardRepository mRepo;

	@GetMapping("")
	public String home(Model model) {
		System.out.println("index");
		List<BoardList> boards = mRepo.findAll();
		System.out.println(boards);
		model.addAttribute("boards", boards);

		return "/index";
	}

	@GetMapping("/board/{id}")
	public String BoardDetail(@PathVariable int id, Model model) {
		BoardList board = mRepo.findById(id);
		model.addAttribute("board", board);
		return "/board/detail";
	}

	@GetMapping("/board/writeForm")
	public String BoardwriteForm() {
		return "/board/writeForm";
	}

	@PostMapping("/board/write")
	public String Boardwrite(Board board, HttpSession session) {
		User user = (User) session.getAttribute("user");
		board.setUserId(user.getId());
		;
		
		System.out.println(board);
		mRepo.save(board);
		System.out.println("posting!");
		return "redirect:/";
	}

	@GetMapping("/board/updateForm/{id}")
	public String BoardUpdateForm(@PathVariable int id, Model model, HttpSession session) throws IOException {

		User user = (User) session.getAttribute("user");
		Board b = new Board();
		b.setUserId(user.getId());
		b.setId(id);

		Board board = mRepo.findByIdUpdateForm(b);

		if (board != null) {
			model.addAttribute(board);
			return "/board/updateForm";
		} else {
//			Script.msg(response, "본인이 아닙니다.!");
			return "redirect:/";
		}

	}

	@PostMapping("/board/update")
	public String BoardUpdate(Board board) {
		mRepo.update(board);
		return "redirect:/";
	}

	@GetMapping("/board/delete/{id}")
	public String BoardDelete(@PathVariable int id, HttpSession session) {
		User user = (User) session.getAttribute("user");
		Board b = new Board();
		b.setUserId(user.getId());
		b.setId(id);
		int result = mRepo.delete(b);
		if (result == 1) {
			return "redirect:/";
		} else {
			return "redirect:/";
		}

	}

}
