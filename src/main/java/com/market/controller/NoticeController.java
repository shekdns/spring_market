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
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.market.domain.Criteria;
import com.market.domain.NoticeAttachVO;
import com.market.domain.NoticeVO;
import com.market.domain.PageDTO;
import com.market.service.NoticeService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/notice/*")
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	//D:\\spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\market\\resources\\upload
	@Value("${globalConfig.uploadPath}")
	private String uploadPath;
	
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/admin_notice")
	public void admin_notice(Criteria cri, Model model) {
		
		int total = service.getTotal(cri);
		
		model.addAttribute("list", service.getListWithPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}
	
	//파일 삭제
	private void deleteFiles(List<NoticeAttachVO> attachList) {
		
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		
		attachList.forEach(attach ->{
			try {
				Path file = Paths.get(uploadPath+"\\"+attach.getNo_uploadPath()+"\\"+attach.getNo_uuid()+"_"+attach.getNo_fileName());
				
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					
					Path thumbNail = Paths.get(uploadPath+"\\"+attach.getNo_uploadPath()+"\\"+attach.getNo_uuid()+"_"+attach.getNo_fileName());
					
					Files.delete(thumbNail);
				}
				
				
			}catch(Exception e) {
				log.error("delete file error" + e.getMessage());
				
			}
			
		});
		
	}
	
	//쿠폰 생성 GET
	@GetMapping("/admin_notice_create")
	public void admin_notice_create() {
			

	}
	//쿠폰 생성 POST
	@PostMapping("/admin_notice_create")
	public String admin_notice_create(NoticeVO notice) {
		
		if(notice.getNo_attachList() != null) {
			notice.getNo_attachList().forEach(attach -> log.info(attach));
		}
		
		service.create_notice(notice);
			
		return "redirect:/admin/notice/admin_notice";
	
		
	}
	
	//쿠폰 읽기, 수정 페이지
	@GetMapping({ "/admin_notice_get", "/admin_notice_modify" })
	public void admin_notice_get_modify(@RequestParam("no_idx") int no_idx, @ModelAttribute("cri") Criteria cri, Model model) {

		model.addAttribute("notice", service.notice_get(no_idx));
	
	}
	
	@PostMapping("/admin_notice_modify")
	public String admin_notice_modify(NoticeVO notice, @ModelAttribute("cri") Criteria cri) {
		
		service.notice_modify(notice);
		return "redirect:/admin/notice/admin_notice" + cri.getListLink();
	}
	
	@PostMapping("/admin_notice_delete")
	public String admin_notice_delete(@RequestParam("no_idx") int no_idx, Criteria cri) {
		
		List<NoticeAttachVO> attachList = service.getAttachList(no_idx);
		
		service.notice_remove(no_idx);
		deleteFiles(attachList);
		
		return "redirect:/admin/notice/admin_notice" + cri.getListLink();
	}
	
	@GetMapping(value = "/getNoticeAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<NoticeAttachVO>> getCouponAttachList(int no_idx){
		
		return new ResponseEntity<>(service.getAttachList(no_idx), HttpStatus.OK);
		
		
	}
}
