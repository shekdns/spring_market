package com.market.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.market.domain.MemberVO;
import com.market.service.MailSendService;
import com.market.service.UserService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/front/*")
public class MemberController {
	
	
	@Autowired
	private UserService user_service;
	
	@Autowired
	private MailSendService mail_service;
	
	
	@GetMapping("/member_register")
	public void member_register() {
		
		
	}
	
	//회원가입 완료 페이지
	@GetMapping("/member_register_success")
	public void member_register_success() {
		
		
	}
	
	@PostMapping("/member_register")
	public String member_register(MemberVO member, HttpServletRequest request) {
		
		user_service.user_register(member);
		mail_service.mailSendWithRegister(member.getEmail(), member.getUserid(), request);
		
		return "redirect:/front/index";
		
	}
	
	
	//유효성 검사
	
	@RequestMapping(value = "member_register/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public String idCheck(@RequestParam("id") String id) {

		int count = user_service.userIdCheck(id);
		Gson gson = new Gson();

		return gson.toJson(count);

	}
	

	@RequestMapping(value = "member_register/nameCheck", method = RequestMethod.GET)
	@ResponseBody
	public String nameCheck(@RequestParam("name") String name) {

		int count = user_service.userNameCheck(name);
		Gson gson = new Gson();

		return gson.toJson(count);
			
	}
		
	@RequestMapping(value = "member_register/emailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String eamilCheck(@RequestParam("email") String email) {

		int count = user_service.userEmailCheck(email);
		Gson gson = new Gson();
																	
		return gson.toJson(count);
			
	}
	
	//아이디 비밀번호 찾기 페이지
	@GetMapping("/find_id_pw")
	public void find_id_pw() {
		
		
	}
	
	
	// 8. 비밀번호 찾기
		@RequestMapping(value = "find_id_pw/id_emailCheck", method = RequestMethod.GET)
		@ResponseBody
		public String id_emailCheck(@RequestParam("id") String id, @RequestParam("email") String email) {

			int count = user_service.find_checkPass(id, email);
			System.out.println(count);
			Gson gson = new Gson();
			
			log.info(count);
			return gson.toJson(count);
			
		}
		
		
		// 9. 임시비밀번호 메일 보내기 
		@RequestMapping(value = "find_id_pw/searchPassword", method = RequestMethod.GET)
		@ResponseBody
		public String searchPassword(@RequestParam("id") String id, @RequestParam("email") String email,
				HttpServletRequest request) {
			
			mail_service.mailSendWithPass(id, email, request);

			return "redirect:/front/index";

		}
		
		// 10. 아이디 찾기
		@RequestMapping(value = "find_id_pw/name_emailCheck", method = RequestMethod.GET)
		@ResponseBody
		public String name_emailCheck(@RequestParam("name") String name, @RequestParam("email") String email) {

			int count = user_service.find_checkId(name, email);
			System.out.println(count);
			Gson gson = new Gson();
			
			log.info(count);
			return gson.toJson(count);
			// return service.userIdCheck(id);
		}
		
		// 11. 아이디 메일 보내기
		@RequestMapping(value = "find_id_pw/searchId", method = RequestMethod.GET)
		@ResponseBody
		public String searchId(@RequestParam("name") String name, @RequestParam("email") String email,
				HttpServletRequest request) {
			
			mail_service.mailSendWithId(name, email, request);

			return "redirect:/front/index";

		}
	
}
