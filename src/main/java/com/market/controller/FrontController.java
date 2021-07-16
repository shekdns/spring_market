package com.market.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.market.domain.BasketVO;
import com.market.domain.Criteria;
import com.market.domain.MemberVO;
import com.market.domain.OrderDetailVO;
import com.market.domain.OrderInfoDTO;
import com.market.domain.OrderVO;
import com.market.domain.ProductAttachVO;
import com.market.domain.ProductVO;
import com.market.domain.WishListVO;
import com.market.service.BasketService;
import com.market.service.CategoryService;
import com.market.service.CouponService;
import com.market.service.OrderService;
import com.market.service.ProductService;
import com.market.service.UserService;
import com.market.service.WishListService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/front/*")
public class FrontController {
	
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;

	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;
	
	@Autowired
	private ProductService pro_service;
	
	@Autowired
	private CategoryService ca_service;
	
	@Autowired
	private BasketService basket_service;
	
	@Autowired
	private WishListService wish_service;
	
	@Autowired
	private OrderService order_service;
	
	@Autowired
	private UserService user_service;
	
	@Autowired
	private CouponService coupon_service;
	
	@GetMapping("/index")
	public void index() {
		

		
	}
	
//	@GetMapping("/index")
//	public void index(Model model, HttpSession session) {
//		
//		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
//		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
//
//		System.out.println("구글:" + url);
//
//		model.addAttribute("google_url", url);
//		
//	}
//	
//	// 구글 Callback호출 메소드
//	@RequestMapping(value = "/google_login", method = { RequestMethod.GET, RequestMethod.POST })
//	public String googleCallback(Model model, @RequestParam String code) throws IOException {
//		System.out.println("여기는 googleCallback");
//
//		//return "redirect:/googleSuccess";
//		return "redirect:/front/index";
//	}

	
	@GetMapping("/category")
	public void category(Model model, Criteria cri, @RequestParam(value = "cacode" , required = false, defaultValue = "1") int cacode) {
		
		cri = new Criteria(cacode);
		
		List<ProductVO> list = pro_service.ScrollPaingStart(cri); // mapper로 받는 결과값
		List<ProductVO> list2 = new ArrayList<ProductVO>(); // 중복 빼고 결과로 보여줄 리스트
		
		for(int i = 0; i < list.size(); i++) { // list 크기만큼 돌림 --> 이 경우 8개 한계받는거 빼야됨
			// 결과 개수 8개 되면 더 안돌림
			if(list2.size() == 8) {
				break;
			}
			// 처음꺼는 순순히 넣어준다
			if(i == 0) {
				list2.add(list.get(i));
			}else {
				// 이전 값이랑 같을경우 안돌림
				if(!(list.get(i).getPdid() == list.get(i-1).getPdid())) {
					list2.add(list.get(i)); //
				}
			}
		}
		
		model.addAttribute("list", list2); //
		
		
		model.addAttribute("ca_list" ,ca_service.getList8()); //
		//model.addAttribute("ca_list" ,ca_service.getList());
	}
	
	
	@RequestMapping(value = "/infiniteScrollDown", method = RequestMethod.POST)
	@ResponseBody
	public List<ProductVO> infiniteScrollDown(ProductVO pro){
			
		return pro_service.ScrollPagingDown(pro);
	}
	
	@RequestMapping(value = "/infiniteScrollUp", method = RequestMethod.POST)
	@ResponseBody
	public List<ProductVO> infiniteScrollUp(ProductVO pro){
		
		return pro_service.ScrollPagingUp(pro);
	}
	
	@GetMapping("/product_info")
	public void product_info(@RequestParam("pdid") int pdid, Model model) {
		
		model.addAttribute("pro", pro_service.product_get(pdid));
		model.addAttribute("pro_file", pro_service.getAttachList(pdid));
		model.addAttribute("list", wish_service.showList());
		
	}
	
	
	@GetMapping("/product_info2")
	public void product_info2(@RequestParam("pdid") int pdid, Model model) {
		
		model.addAttribute("pro", pro_service.product_get(pdid));
		model.addAttribute("pro_file", pro_service.getAttachList(pdid));
		model.addAttribute("list", wish_service.showList());
		
	}
	
	@GetMapping(value = "/getProductAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<ProductAttachVO>> getProductAttachList(int pdid){
		
		return new ResponseEntity<>(pro_service.getAttachList(pdid), HttpStatus.OK);
		
		
	}
	
	@PostMapping("/basket_input")
	@ResponseBody
	public String basket_input(@ModelAttribute BasketVO basket) {
		
		int b1 = basket.getPdid();
		String s1 = basket.getUserid();
		
		log.info(b1);
		log.info(s1);
		System.out.println(b1);
		System.out.println(s1);
		
		List<BasketVO> count = basket_service.basket_all_list();
		
		boolean flag = false;
		int result = 0;
		
			for(BasketVO vo : count) {
				if(basket.getPdid() == vo.getPdid() && basket.getUserid().equals(vo.getUserid())) {
					flag = true;
				}
				
			}
		
		if(flag) {
			result = 1;
		}else {
			
			basket_service.insert_basket(basket);
			result = 2;
		}
		
		Gson gson = new Gson();

		return new Gson().toJson(result);
		
	
	
	}
	
	
	// 2. 좋아요 유/무 판단 메소드  
		@RequestMapping(value = "/checkList", method = RequestMethod.POST)
		@ResponseBody
		public String checkList(@ModelAttribute WishListVO wish) {

			
			int b1 = wish.getPdid();
			String s1 = wish.getUserid();

			System.out.println(b1);
			System.out.println(s1);
			
			
			List<WishListVO> count = wish_service.checkList(wish);
			
			boolean flag = false;
			int result = 0;
			// List 내 song_idx랑 post로 받은 song_idx랑 비교
			for(WishListVO vo : count){
			   if(wish.getPdid() == vo.getPdid()){
			      flag = true;
			   }
			}
			// 있을 경우 삭제 없을경우 넣기
			if(flag){
				wish_service.delete_wishList(wish);
			   result = 1;
			}else{
				wish_service.insert_wishList(wish);
			   result = 2;
			}

			Gson gson = new Gson();

			return new Gson().toJson(result);
			
					
		}
		
		@GetMapping("/basket")
		public void basket(Model model, @RequestParam("userid") String userid) {
			
			model.addAttribute("count", basket_service.getTotalCountBasket(userid));
			//model.addAttribute("basket", basket_service.basketInfo(userid));
			
		}
		
		@RequestMapping(value = "/basket_ajax", method = RequestMethod.POST)
		@ResponseBody
		public List<BasketVO> basket_ajax(String userid){
			
			return basket_service.basketInfo(userid);
		}
		
		
		
		@RequestMapping(value = "/basket/basket_delete", method = RequestMethod.POST)
		@ResponseBody
		public int basket_delete(int bk_idx){
			
			return basket_service.basket_delete(bk_idx);
		}
		
		@RequestMapping(value = "/basket/basket_check_delete", method = RequestMethod.POST)
		@ResponseBody
		public void basket__checkdelete(@ModelAttribute BasketVO basket){
			
			//List<BasketVO> count = basket.getCheck_list();
			
			for(int i =0; i< basket.getCheck_list().size(); i++) {
				
				basket_service.basket_check_delete(basket.getCheck_list().get(i));
				System.out.println(basket.getCheck_list().get(i));
			}
			
			
		}
		
		@GetMapping("/wish_list")
		public void wish_list(Model model, @RequestParam("userid") String userid) {
			
			model.addAttribute("count", wish_service.getTotalCountWish(userid));
			model.addAttribute("wish", wish_service.wish_info(userid));
			model.addAttribute("list", wish_service.showList());
		
		}
		
		@RequestMapping(value = "/wish/wish_check_delete", method = RequestMethod.POST)
		@ResponseBody
		public void wish__checkdelete(@ModelAttribute WishListVO wish){
			
			for(int i =0; i< wish.getCheck_list().size(); i++) {
				
				wish_service.wish_check_delete(wish.getCheck_list().get(i));
				System.out.println(wish.getCheck_list().get(i));
			}
			
			
		}
		
		@RequestMapping(value = "/wish/wish_to_basket", method = RequestMethod.POST)
		@ResponseBody
		public String wish_to_basket(@ModelAttribute BasketVO basket){
			
			List<BasketVO> list = basket_service.basket_all_list();
			
			String result = "";
			
			String success = "성공";
			String half = "중복제외";
			String falut = "전체중복";
			
			System.out.println("list 값 : "+ list.size());
			System.out.println("basket ajax 값 : "+basket.getCheck_list().size());
			System.out.println(basket.getCheck_list().get(0));
			
			List<BasketVO> list2 = new ArrayList<BasketVO>();
				
				for(int i = 0; i < basket.getCheck_list().size(); i++) {
					
					for(int j =0; j< list.size(); j++) {
							
						   System.out.println(list.get(j).getPdid());
						   System.out.println(list.get(j).getUserid());
						   System.out.println(basket.getCheck_list().get(i).getUserid());
						   System.out.println(basket.getCheck_list().get(i).getPdid());
				   
						   
						   if((basket.getCheck_list().get(i).getPdid() != list.get(j).getPdid()) && 
								   (basket.getCheck_list().get(i).getUserid().equals(list.get(j).getUserid()))) {
							   
							   list2.add(basket.getCheck_list().get(i));
							   System.out.println("들어간 값 : " + basket.getCheck_list().get(i));
						   }
					
					}
					
					
				}
				
				List<BasketVO> list3 = new ArrayList<BasketVO>();
			    
				for(int i = 0; i < list2.size(); i++) { // list 크기만큼 돌림 --> 이 경우 8개 한계받는거 빼야됨
					// 결과 개수 8개 되면 더 안돌림
					// 처음꺼는 순순히 넣어준다
					if(i == 0) {
						list3.add(list2.get(i));
					}else {
						// 이전 값이랑 같을경우 안돌림
						if(!(list2.get(i).getPdid() == list2.get(i-1).getPdid())) {
							list3.add(list2.get(i)); //
						}
					}
				}
			
			
			    System.out.println("ajax 값 : "+basket.getCheck_list().size());
				System.out.println("list3값 : "+list3.size());
				
				if(list3.size() == basket.getCheck_list().size()) {
					for(int k = 0; k < list3.size(); k++) {
						basket_service.insert_basket(list3.get(k));
					}
					result = success;
				}else if((list3.size() < basket.getCheck_list().size()) && (list3.size() > 0)) {
					for(int k = 0; k < list3.size(); k++) {
						basket_service.insert_basket(list3.get(k));
					}
					result = half;
				}else if(list3.size() == 0) {
					result = falut;
				}
				
				Gson gson = new Gson();

				return new Gson().toJson(result);
				
			
		}
		
		
		
		@RequestMapping(value = "/order_info")
		public void order_info(@ModelAttribute OrderInfoDTO order, Model model, @RequestParam("userid") String userid){
			
			
			List<OrderInfoDTO> list = order.getCheck_list();
		
			model.addAttribute("user", user_service.user_read(userid));
			model.addAttribute("coupon_list", order_service.show_coupon_order(userid));
			model.addAttribute("list", list);
		}
		
		
//		@RequestMapping(value = "/send_use_update", method = RequestMethod.POST)
//		@ResponseBody
//		public void send_use_update(int s_cp_idx, String situ){
//			
//			coupon_service.update_send_coupon(situ, s_cp_idx);
//			
//			
//		}
		
		
//		@RequestMapping(value = "/order_insert")
//		public String order_insert(@ModelAttribute OrderVO order, @ModelAttribute OrderDetailVO order_detail) {
//			//@ModelAttribute OrderDetailVO order_detail, @ModelAttribute int s_cp_idx
//
//		
//			order_service.insert_order(order);
//			
//			
//			for(int i=0; i < order_detail.getCheck_list().size(); i++) {
//				
//				order_service.insert_order_detail(order_detail.getCheck_list().get(i), order.getOrder_idx());
//			}
//			
//			
//			return "redirect:/front/mypage?userid=" + order.getOrder_id();
//		}
		
		@RequestMapping(value = "/order_insert")
		public String order_insert(@ModelAttribute OrderVO order, @ModelAttribute OrderDetailVO order_detail, String s_cp_idx, 
				@ModelAttribute MemberVO user, String point) {
		
			order_service.insert_order(order);
			
			System.out.println(order.getOrder_id());
			System.out.println(order.getOrder_total());
			int int_total = order.getOrder_total();
			int discount = int_total / 10 / 2;
			
			user.setPoint(discount);
			user.setUserid(order.getOrder_id());
			user_service.update_point(user);
			
			int point_minus = Integer.parseInt(point);
			user.setPoint(point_minus);
			user_service.update_minus_point(user);
			
			for(int i=0; i < order_detail.getCheck_list().size(); i++) {
				
				order_service.insert_order_detail(order_detail.getCheck_list().get(i), order.getOrder_idx());
			}
			
			int send_idx = Integer.parseInt(s_cp_idx);
			
			if(send_idx != 0) {
				String situ = "사용";
				coupon_service.update_send_coupon(situ, send_idx);
			}

			
			
			return "redirect:/front/mypage?userid=" + order.getOrder_id();
		}
		
		
}
