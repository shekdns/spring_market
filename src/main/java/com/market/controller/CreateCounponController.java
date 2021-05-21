package com.market.controller;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.nio.file.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.market.domain.CouponAttachVO;
import com.market.domain.CreateCouponVO;
import com.market.domain.Criteria;
import com.market.domain.PageDTO;
import com.market.service.CreateCouponService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
public class CreateCounponController {
	
	@Autowired
	private CreateCouponService service;
	
	//D:\\spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\market\\resources\\upload
	@Value("${globalConfig.uploadPath}")
	private String uploadPath;
	
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/admin_coupon")
	public void admin_coupon(Criteria cri, Model model) {
		
		int total = service.getTotal(cri);
		
		model.addAttribute("list", service.getListWithPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}
	
	//파일 삭제
	private void deleteFiles(List<CouponAttachVO> attachList) {
		
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		
		attachList.forEach(attach ->{
			try {
				Path file = Paths.get(uploadPath+"\\"+attach.getC_uploadPath()+"\\"+attach.getC_uuid()+"_"+attach.getC_fileName());
				
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					
					Path thumbNail = Paths.get(uploadPath+"\\"+attach.getC_uploadPath()+"\\"+attach.getC_uuid()+"_"+attach.getC_fileName());
					
					Files.delete(thumbNail);
				}
				
				
			}catch(Exception e) {
				log.error("delete file error" + e.getMessage());
				
			}
			
		});
		
	}
	
	//쿠폰 생성 GET
	@GetMapping("/admin_coupon_create")
	public void admin_coupon_create() {
			

	}
	//쿠폰 생성 POST
	@PostMapping("/admin_coupon_create")
	public String admin_coupon_create(CreateCouponVO coupon) {
		
		if(coupon.getC_attachList() != null) {
			coupon.getC_attachList().forEach(attach -> log.info(attach));
		}
		
		service.create_coupon(coupon);
			
		return "redirect:/admin/admin_coupon";
	
		
	}
	
	//쿠폰 읽기, 수정 페이지
	@GetMapping({ "/admin_coupon_get", "/admin_coupon_modify" })
	public void admin_coupon_get_modify(@RequestParam("c_cp_idx") int c_cp_idx, @ModelAttribute("cri") Criteria cri, Model model) {

		model.addAttribute("coupon", service.coupon_get(c_cp_idx));
	
	}
	
	@PostMapping("/admin_coupon_modify")
	public String admin_coupon_modify(CreateCouponVO coupon, @ModelAttribute("cri") Criteria cri) {
		
		service.coupon_modify(coupon);
		return "redirect:/admin/admin_coupon" + cri.getListLink();
	}
	
	@PostMapping("/admin_coupon_delete")
	public String admin_coupon_delete(@RequestParam("c_cp_idx") int c_cp_idx, Criteria cri) {
		
		List<CouponAttachVO> attachList = service.getAttachList(c_cp_idx);
		
		service.coupon_remove(c_cp_idx);
		deleteFiles(attachList);
		
		return "redirect:/admin/admin_coupon" + cri.getListLink();
	}
	
	@GetMapping(value = "/getCouponAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<CouponAttachVO>> getCouponAttachList(int c_cp_idx){
		
		return new ResponseEntity<>(service.getAttachList(c_cp_idx), HttpStatus.OK);
		
		
	}
	
	

	
	
	
}
