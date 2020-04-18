package com.jobs.run.rating;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jobs.run.member.svc.MemberSVC;
import com.jobs.run.member.vo.MemberVO;

@Controller
@RequestMapping("/ratings")
public class RatingController {

	private static final Logger lg = LoggerFactory.getLogger(RatingController.class);
	
	@Autowired
	RatingSVC RSVC;
	
	@Autowired
	MemberSVC MSVC;
	
	@GetMapping("/rateList/{ratee:.+}")
	public String rateList(
			@PathVariable String ratee, Model model
			) {
		MemberVO memberVO = new MemberVO();
		memberVO = MSVC.selectMember(ratee);
		model.addAttribute("member", memberVO);
		List<RatingVO> rateLists = RSVC.rateList(ratee);
		lg.info(rateLists.toString());
		
		model.addAttribute("rateLists", rateLists);
		return "myPage/Ratings";
	}
// 끝 평가 목록**************************************************************************************************************
	
// 평점주기 작성 양식***********************************************************************************	
	@GetMapping("/ratingForm/{ratee:.+}")
	public String ratingForm(
			@PathVariable String ratee,
			Model model
			) { 
		MemberVO rateeVO = MSVC.selectMember(ratee);
		
		model.addAttribute("ratingVO", new RatingVO());
		model.addAttribute("rateeVO", rateeVO);
		lg.info(rateeVO.toString());
		return "myPage/RatingForm";
	}
	
	@PostMapping("/rating.do")
	public String rating(
			@Valid @ModelAttribute("rating") RatingVO ratingVO,
			BindingResult result,
			HttpServletRequest request
	) {
		RSVC.rating(ratingVO);
		
		return "redirect:/ratings/rateList/" + ratingVO.getRatee();
	}
// 끝 평가하기 *********************************************************************************
	
}
