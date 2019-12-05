package com.example.crud.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.crud.model.User;
import com.example.crud.repository.UserRepository;
import com.example.crud.utils.Script;

@Controller
public class UserController {
	
	@Autowired
	private UserRepository mRepo;
	
	@GetMapping("/user/joinForm")
	public String userJoinForm() {
		return "/user/joinForm";
	}

	@PostMapping("/user/join")
	public String userJoin(User user) {
		
		String rawPassword = user.getPassword();
		String password = BCrypt.hashpw(rawPassword, BCrypt.gensalt());
		user.setPassword(password);
		System.out.println("password : " + password);
		mRepo.save(user);
		return "redirect:/";
	}

	@RequestMapping("/user/join/IdCheck")
	@ResponseBody
	public Integer userJoinIdCheck(@RequestBody String username) {

		Integer count = mRepo.findByUsernameCheck(username);

		return count;

	}

	@GetMapping("/user/loginForm")
	public String userLoginForm() {
		return "/user/loginForm";
	}

	@PostMapping("/user/login")
	public @ResponseBody String userLogin(User user, HttpSession session) {
		
		
		String username = user.getUsername();
		String rawPassword = user.getPassword();
		System.out.println(username+" "+rawPassword);
		
		
		User u = mRepo.findByUsername(username);
		String PasswordHashded = u.getPassword();

		
		if(BCrypt.checkpw(rawPassword, PasswordHashded)) {
			session.setAttribute("user", u);
			System.out.println(session.getAttribute("user"));
			return Script.backHref("로그인 성공", "/");
		}else {
			return Script.back("로그인 실패");
		}
		
		
		
	}

	@GetMapping("/user/logout")
	public @ResponseBody String UserLogout(HttpSession session) {
		session.invalidate();
		return Script.backHref("로그아웃 되었습니다.", "/");
	}

	@GetMapping("/user/updateForm")
	public String userProfile(HttpSession session) {
		return "/user/updateForm";
	}

	@PostMapping("/user/update")
	public String userUpdate(User user,HttpSession session) {
		
		String rawPassword = user.getPassword();
		String password = BCrypt.hashpw(rawPassword, BCrypt.gensalt());
		user.setPassword(password);

		mRepo.update(user);
		session.invalidate();
		
		return "redirect:/";
	}
	
//	@PostMapping("/user/update/profileImg")
//	public @ResponseBody String profileImg(@RequestParam("profileImg") MultipartFile file, HttpServletRequest request) {
//		
//		String PATH = "/upload";
//		ServletContext context = request.getSession().getServletContext();
//		String contextPath = context.getContextPath();
////		String filePath = contextPath + "/media/" + fileName;
//		
//		String resourcePath = contextPath+"/media/";
//		
//		System.out.println("=====진입=====");
//		UUID uuid = UUID.randomUUID();
//		
//		String uuidFileName = uuid + "_"+file.getOriginalFilename();
//		Path filePath = Paths.get(resourcePath+uuidFileName);
//		System.out.println(filePath);
//		try {
//			Files.write(filePath, file.getBytes());
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//		
//		return filePath.toString();
//	}
	
	
}
