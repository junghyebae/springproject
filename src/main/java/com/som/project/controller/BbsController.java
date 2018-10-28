package com.som.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.som.project.model.BbsDto;
import com.som.project.service.BbsService;


@Controller
public class BbsController {
	
	@Autowired
	private BbsService bbsService;
	
	@RequestMapping(value = "/bbs", method = RequestMethod.GET)
	public String bbs(Model model) {
		List<BbsDto> bbsList = bbsService.bbsList();
		model.addAttribute("bbsList", bbsList);
		return "bbs/bbs";
	}
	
	@RequestMapping(value = "/bbsWrite", method = RequestMethod.GET)
	public String bbswrite() {
		return "bbs/bbswrite";
	}

	@RequestMapping(value = "/bbsWriteAf", method = RequestMethod.POST)
	public String bbswriteAf(BbsDto bbsDto, MultipartFile fileload) {
		System.out.println("하이하이");
		System.out.println(fileload.getOriginalFilename());
		int res = bbsService.bbsWrite(bbsDto);
		if(res==1) {
			return "bbs/bbs";
		}
		//dto내용 다시 보내주기(내용삭제안되게)
		return "bbs/bbswrite";
	}
	
	@RequestMapping(value = "/bbsDetail", method = RequestMethod.GET)
	public String bbsDetail(Model model, int seq, HttpServletRequest req) {
		String loginId = req.getSession().getId();
		BbsDto bbsdto = bbsService.bbsDetail(seq, loginId);
		model.addAttribute("bbs", bbsdto);
		return "bbs/bbsDetail";
	}
	
	@RequestMapping(value="/bbsUpdate", method = RequestMethod.POST)
	public String bbsUpdate(BbsDto bbsDto) {
		bbsService.bbsUpdate(bbsDto);
		return "redirect:bbs";
	}
	
	@RequestMapping(value="/bbsDelete", method = RequestMethod.GET)
	public String bbsDelete(int seq) {
		bbsService.bbsDelete(seq);
		return "redirect:bbs";
	}
	
}

