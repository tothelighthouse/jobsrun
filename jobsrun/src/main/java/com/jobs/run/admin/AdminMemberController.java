package com.jobs.run.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jobs.run.board.svc.BoardSVC;
import com.jobs.run.board.vo.BoardVO;
import com.jobs.run.member.svc.MemberSVC;
import com.jobs.run.member.vo.MemberVO;
import com.jobs.run.rating.RatingSVC;

@Controller
@RequestMapping("/admin")
public class AdminMemberController {
	private static final Logger logger = LoggerFactory.getLogger(AdminMemberController.class);

	@Inject
	RatingSVC ratingSVC;
	
	@Inject
	MemberSVC memberSVC;
	
	@Inject
	BoardSVC boardSVC;
	
	//회원관리
	@GetMapping("/adminmember")
	public String admin(Model model) {
		MemberVO memberVO = new MemberVO();
		logger.info("admin()");
		List<MemberVO> list = memberSVC.selectAllMember();
		model.addAttribute("memberList", list);
		model.addAttribute("memberVO", memberVO);
		return "admin/adminMember";
	}
	
	  //회원정보삭제처리
	  @GetMapping("/delete/{id:.+}/{rates}") 
	  public String rdeleteMember(
	  Model model,
	  @PathVariable String rates,
	  @PathVariable String id, 
	  HttpServletResponse response) 
			  throws IOException {
	
	  int ratesInt = (int)Math.round(Double.parseDouble(rates));
	  logger.info("rates:"+ratesInt); 
	  if(ratesInt <= 4) { 
		  logger.info("rdeleteMember()"); 
		  int rdelete = memberSVC.rdeleteMember(id);
		  
		  return "redirect:/admin/adminmember";
	  }
	  return "redirect:/admin/adminmember";
	 
	}
	
	  //의뢰자전체리스트
	  @GetMapping("/adminpost/{category}") 
	  public String adminPost(
			  Model model,
			  @PathVariable String category
			  ) { 
		  BoardVO boardVO = new BoardVO(); 
		  List<BoardVO> list = boardSVC.adminlist(category);
	      model.addAttribute("list", list); model.addAttribute("boardVO", boardVO);
	      return "admin/adminPost"; 
	 }
	 
	 
	  //해결사게시물
	 @GetMapping("/adminpost2/{category}") 
	 public String adminPost2(
			 Model model,
			 @PathVariable String category) { 
		 BoardVO boardVO = new BoardVO(); 
		 List<BoardVO> list = boardSVC.adminlist(category);
	  model.addAttribute("list", list); 
	  model.addAttribute("boardVO", boardVO);
	 return "admin/adminPost2"; 
	 }
}
