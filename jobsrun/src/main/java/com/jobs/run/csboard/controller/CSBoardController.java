package com.jobs.run.csboard.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jobs.run.board.vo.BoardCategoryVO;
import com.jobs.run.csboard.svc.CSBoardSVC;
import com.jobs.run.csboard.vo.CSBoardVO;
import com.jobs.run.member.vo.MemberVO;

@Controller 
@RequestMapping("/csboard")
public class CSBoardController {
	private static final Logger logger = LoggerFactory.getLogger(CSBoardController.class);
	
	@Inject
	CSBoardSVC csboardSVC;
	
	//게시글 작성 양식
	@GetMapping("/writeForm/{returnPage}")
	public String writeForm(
			@ModelAttribute @PathVariable String returnPage,
			Model model, HttpServletRequest request) {

		  model.addAttribute("csboardVO", new CSBoardVO());
		return "/csboard/cswriteForm";
	}
	
	//게시글 작성
	@PostMapping("/write/{returnPage}")
	public String write(
			@PathVariable String returnPage,
			@Valid @ModelAttribute("csboardVO") CSBoardVO csboardVO,
			BindingResult result,
			HttpServletRequest request) {
		
		logger.info("게시글작성: " + csboardVO.toString());
		
		if(result.hasErrors()) {
			return "/csboard/cswriteForm";
		}
		
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		csboardVO.setCsbid(memberVO.getId());
		csboardSVC.write(csboardVO);
		
		return "redirect:/csboard/view/" + returnPage+"/"+csboardVO.getCsbnum();
	
	}
	
	//게시글 보기
	@GetMapping({"/view/{returnPage}/{csbnum}", "/view/{csbnum}"})
	public String view(
			@ModelAttribute @PathVariable (required=false) String returnPage,
			@PathVariable String csbnum,
			Model model) {
		
		Map<String,Object> map = csboardSVC.view(csbnum);
		CSBoardVO csboardVO = (CSBoardVO)map.get("csboard");
		logger.info(csboardVO.toString());
		
		model.addAttribute("csboardVO", csboardVO);
		
		return "/csboard/csreadForm";
	}
	
	//고객센터 질문리스트 목록
	@GetMapping({"/cslist",
				 "/cslist/{reqPage}",
				 "/cslist/{reqPage}/{searchType}/{keyword}"})
	public String listAll(
			 @PathVariable(required=false) String reqPage,
			 @PathVariable(required=false) String searchType,
			 @PathVariable(required=false) String keyword,
		    @Valid @ModelAttribute("csboardVO") CSBoardVO CSboardVO,
			BindingResult result,
			HttpServletRequest request,
			Model model) {

		//게시글 목록
		model.addAttribute("cslist", csboardSVC.list(reqPage,searchType,keyword));
		//페이지 제어
		model.addAttribute("pc", csboardSVC.getPageCriteria(reqPage, searchType, keyword));
		return "csboard/cslist";		
	}
	
	//게시글 삭제
	@GetMapping("/delete/{returnPage}/{csbnum}")
	public String delete(
			@PathVariable String returnPage,
			@PathVariable String csbnum, 
			Model model) {
		
		//1)게시글 및 첨부파일 삭제
		csboardSVC.delete(csbnum);

		model.addAttribute("cslist", csboardSVC.list());
		return "redirect:/csboard/cslist/"+ returnPage;
	}
	
	//게시글 수정
	@PostMapping("/modify/{returnPage}")
	public String modify(
			@PathVariable String returnPage,
			@Valid @ModelAttribute("csboardVO") CSBoardVO csboardVO,
			BindingResult result	
			) {
		if(result.hasErrors()) {
			return "/csboard/csreadForm";
		}
		
		logger.info("게시글 수정 내용:" + csboardVO.toString());
		csboardSVC.modify(csboardVO);
		return "redirect:/csboard/view/"+ returnPage + "/" + csboardVO.getCsbnum();
	}
	
	//답글 양식
	@GetMapping("/csreplyForm/{returnPage}/{csbnum}")
	public String csreplyForm(

		@ModelAttribute @PathVariable String returnPage,
		@PathVariable String csbnum,
		Model model) {
		
		Map<String,Object> map = csboardSVC.view(csbnum);
		CSBoardVO csboardVO = (CSBoardVO)map.get("csboard");
		
				csboardVO.setCsbtitle(csboardVO.getCsbtitle());
				csboardVO.setCsbcontent(csboardVO.getCsbcontent());

				model.addAttribute("csboardVO", csboardVO);
				
		return "/csboard/csreplyForm";
		
	}
	
	//답글 처리
	@PostMapping("/csreply/{returnPage}")
		public String reply(	
				@PathVariable String returnPage,
				@Valid @ModelAttribute("csboardVO") CSBoardVO csboardVO,
				BindingResult result,
				HttpServletRequest request) {	
			logger.info("답글처리 : " + csboardVO.toString());
			if(result.hasErrors()) {
				return "/csboard/csreplyForm";
			}
			
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		csboardVO.setCsbid(memberVO.getId());
		csboardSVC.reply(csboardVO);
		
		return "redirect:/csboard/cslist/" + returnPage;
		
		}
	}	

