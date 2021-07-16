package com.market.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.market.domain.Criteria;
import com.market.domain.PageDTO;
import com.market.domain.QA_BoardVO;
import com.market.service.QA_BoardService;
import com.market.util.UploadUtils;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/front/qa_board/*")
public class QA_BoardContorller {
	
	@Autowired
	private QA_BoardService qa_service;
	
	@Value("${globalConfig.uploadPath}")
	private String uploadPath;
	
	
	@GetMapping("/qa_board_list")
	public void qa_board_list(Criteria cri, Model model) {
		
		int total = qa_service.getTotal(cri);	
		model.addAttribute("list", qa_service.getListWithPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
	}
	
	@GetMapping("/qa_board_register")
	public void qa_board_register() {
		
		
	}
	
	@PostMapping("/qa_board_register")
	public String qa_board_register(QA_BoardVO qa_board, MultipartFile[] file) {
		
		int index = 0;
		for (MultipartFile multipartFile : file) {
			if(multipartFile.getSize() > 0) {
				qa_board.setQa_file(UploadUtils.uploadFormPost(multipartFile, uploadPath));
			}
			index++;
		}
		
		
		qa_service.register(qa_board);
			
		return "redirect:/front/qa_board/qa_board_list";
	
		
	}
	
	
	//쿠폰 읽기, 수정 페이지
	@GetMapping({ "/qa_board_get", "/qa_board_modify" })
	public void qa_board_get_modify(@RequestParam("qa_idx") int qa_idx, @ModelAttribute("cri") Criteria cri, Model model) {
		
		model.addAttribute("qa_board", qa_service.get(qa_idx));
	
	}
	
	@PostMapping("/qa_board_modify")
	public String qa_board_modify(@ModelAttribute QA_BoardVO qa_board, @ModelAttribute("cri") Criteria cri, MultipartFile[] file) {

		int index = 0;
		for (MultipartFile multipartFile : file) {
			if(multipartFile.getSize() > 0) {
				qa_board.setQa_file(UploadUtils.uploadFormPost(multipartFile, uploadPath));
			}
			index++;
		}
		
		qa_service.modify(qa_board);
		return "redirect:/front/qa_board/qa_board_list" + cri.getListLink();
	}
	
	@PostMapping("/qa_board_delete")
	public String qa_board_delete(@RequestParam("qa_idx") int qa_idx, Criteria cri) {
		
		
		qa_service.remove(qa_idx);
			
		return "redirect:/front/qa_board/qa_board_list" + cri.getListLink();
	}
	
}
