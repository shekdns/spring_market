//
//package com.market.controller;
//
//import java.io.IOException;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.social.google.connect.GoogleConnectionFactory;
//import org.springframework.social.oauth2.GrantType;
//import org.springframework.social.oauth2.OAuth2Operations;
//import org.springframework.social.oauth2.OAuth2Parameters;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import lombok.extern.log4j.Log4j;
//
//@Controller
//@Log4j
//public class TestController {
//
//	
//	  @Autowired
//	  private GoogleConnectionFactory googleConnectionFactory;
//
//	  @Autowired
//	  private OAuth2Parameters googleOAuth2Parameters;
//	  	
//	  	@GetMapping("googleSuccess")
//	  	public void googleSuccess() {
//	  		
//	  		
//	  	}
//	  
//	
//		// 로그인 첫 화면 요청 메소드
//		@RequestMapping(value = "/google_test", method = { RequestMethod.GET, RequestMethod.POST })
//		public String login(Model model, HttpSession session) {
//
//			/* 구글code 발행 */
//			OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
//			String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
//
//			System.out.println("구글:" + url);
//
//			model.addAttribute("google_url", url);
//
//			/* 생성한 인증 URL을 View로 전달 */
//			return "google_test";
//		}
//
//		// 구글 Callback호출 메소드
//		@RequestMapping(value = "/google_login", method = { RequestMethod.GET, RequestMethod.POST })
//		public String googleCallback(Model model, @RequestParam String code) throws IOException {
//			System.out.println("여기는 googleCallback");
//
//			//return "redirect:/googleSuccess";
//			return "redirect:/front/admin_coupon";
//		}
//
//
//
//
//}
