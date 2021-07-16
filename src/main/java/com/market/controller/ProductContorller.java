package com.market.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.market.domain.CategoryVO;
import com.market.domain.Criteria;
import com.market.service.CategoryService;
import com.market.service.ProductService;
import com.market.util.UploadUtils;
import com.market.domain.PageDTO;
import com.market.domain.ProductAttachVO;
import com.market.domain.ProductVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/product/*")
public class ProductContorller {
	
	@Autowired
	private CategoryService ca_service;
	
	@Autowired
	private ProductService pro_service;
	
	//D:\\spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\market\\resources\\upload
	@Value("${globalConfig.uploadPath}")
	private String uploadPath;
		
		
	@GetMapping("/admin_product")
	public void admin_product(Criteria cri, Model model, @RequestParam(value = "cacode" , required = false, defaultValue = "1") int cacode) {
		
		cri = new Criteria(cri.getPageNum(), cri.getAmount(), cacode);
		
		int total = pro_service.getTotal(cri);	
		model.addAttribute("ca_list", ca_service.getList());
		model.addAttribute("product", pro_service.getListWithPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
	}
	
		//파일 삭제
		private void deleteFiles(List<ProductAttachVO> attachList) {
			
			if(attachList == null || attachList.size() == 0) {
				return;
			}
			
			attachList.forEach(attach ->{
				try {
					Path file = Paths.get(uploadPath+"\\"+attach.getPd_uploadPath()+"\\"+attach.getPd_uuid()+"_"+attach.getPd_fileName());
					
					Files.deleteIfExists(file);
					
					if(Files.probeContentType(file).startsWith("image")) {
						
						Path thumbNail = Paths.get(uploadPath+"\\"+attach.getPd_uploadPath()+"\\"+attach.getPd_uuid()+"_"+attach.getPd_fileName());
						
						Files.delete(thumbNail);
					}
					
					
				}catch(Exception e) {
					log.error("delete file error" + e.getMessage());
					
				}
				
			});
			
		}
		
		//쿠폰 생성 GET
		@GetMapping("/admin_product_create")
		public void admin_product_create(Model model) {
				
			model.addAttribute("ca_list", ca_service.getList());

		}
		//쿠폰 생성 POST
		@PostMapping("/admin_product_create")
		public String admin_product_create(ProductVO pro, MultipartFile[] file) {
			
			int index = 0;
			for (MultipartFile multipartFile : file) {
				if(multipartFile.getSize() > 0) {
					pro.setMain_img(UploadUtils.uploadFormPost(multipartFile, uploadPath));
				}
				index++;
			}
			
			
			if(pro.getPd_attachList() != null) {
				pro.getPd_attachList().forEach(attach -> log.info(attach));
			}
			
			pro_service.create_product(pro);
				
			return "redirect:/admin/product/admin_product";
		
			
		}
		
		//쿠폰 읽기, 수정 페이지
		@GetMapping({ "/admin_product_get", "/admin_product_modify" })
		public void admin_product_get_modify(@RequestParam("pdid") int pdid, @ModelAttribute("cri") Criteria cri, Model model) {
			
			model.addAttribute("ca_list", ca_service.getList());
			model.addAttribute("product", pro_service.product_get(pdid));
		
		}
		
		@PostMapping("/admin_product_modify")
		public String admin_product_modify(ProductVO pro, @ModelAttribute("cri") Criteria cri, MultipartFile[] file) {

			int index = 0;
			for (MultipartFile multipartFile : file) {
				if(multipartFile.getSize() > 0) {
					pro.setMain_img(UploadUtils.uploadFormPost(multipartFile, uploadPath));
				}
				index++;
			}
			
			pro_service.product_modify(pro);
			return "redirect:/admin/product/admin_product" + cri.getListLink();
		}
		
		@PostMapping("/admin_product_delete")
		public String admin_product_delete(@RequestParam("pdid") int pdid, Criteria cri) {
			
			List<ProductAttachVO> attachList = pro_service.getAttachList(pdid);
			
			pro_service.product_remove(pdid);
			deleteFiles(attachList);
			
			return "redirect:/admin/product/admin_product" + cri.getListLink();
		}
		
		@GetMapping(value = "/getProductAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public ResponseEntity<List<ProductAttachVO>> getProductAttachList(int pdid){
			
			return new ResponseEntity<>(pro_service.getAttachList(pdid), HttpStatus.OK);
			
			
		}
	
		
		//카테고리 영역
		//생성
		@PostMapping("/category_create")
		public String category_create(CategoryVO ca) {
			
			ca_service.create_coupon(ca);
			
			return "redirect:/admin/product/admin_product"; 
			
		}
		
		@ResponseBody
		@PostMapping("/category_delete")
		public String category_delete(@RequestParam("cacode") int cacode) {
			
			ca_service.coupon_remove(cacode);
			
			return "redirect:/admin/product/admin_product";  

		}
		
		@ResponseBody
		@PostMapping("/category_update")
		public String category_update(CategoryVO ca) {
			
			ca_service.coupon_modify(ca);
			return "redirect:/admin/product/admin_product";  
		}
		
}
