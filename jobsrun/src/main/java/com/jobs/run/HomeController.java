package com.jobs.run;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.jobs.run.board.svc.BoardSVC;
import com.jobs.run.board.vo.BoardVO;
import com.jobs.run.csboard.svc.CSBoardSVC;
import com.jobs.run.csboard.vo.CSBoardVO;
import com.jobs.run.member.vo.MemberVO;

@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	CSBoardSVC csboardSVC;
	
	@Inject
	BoardSVC boardSVC;
	
	@GetMapping({"/", 
		         "/cslist",
		         "/cslist/{reqPage}",
		         "/cslist/{reqPage}/{searchType}/{keyword}",})
	public String home(@PathVariable(required=false) String reqPage,
			@PathVariable(required=false) String searchType,
		    @PathVariable(required=false) String keyword,
		    @PathVariable(required=false) String category,
		    @Valid @ModelAttribute("csboardVO") CSBoardVO CSboardVO,
			BindingResult result,
			HttpServletRequest request, 
			HttpSession session,
			Model model) {
		
			if(session.getAttribute("member") != null) {
				MemberVO memberVO = (MemberVO)session.getAttribute("member"); 
				String region = memberVO.getRegion().substring(0,5);
				
				logger.info("region" + region);
				
				List<BoardVO> recommendlist1 = boardSVC.list("1", region);
				
				for(BoardVO item : recommendlist1) {
					String[] sdateTime = item.splitDatetime();
					String sdate = sdateTime[0];
					String stime = sdateTime[1];
					String stime2 = stime.substring(0, 5);
					item.setSdate(sdate);
					item.setStime(stime2);
				}
				model.addAttribute("recommendlist1", recommendlist1);
				
				List<BoardVO> recommendlist2 = boardSVC.list("2", region);
				
				for(BoardVO item : recommendlist2) {
					String[] sdateTime = item.splitDatetime();
					String sdate = sdateTime[0];
					String stime = sdateTime[1];
					String stime2 = stime.substring(0, 5);
					item.setSdate(sdate);
					item.setStime(stime2);
				}
				model.addAttribute("recommendlist2", recommendlist2);
				
				//게시글 목록
				model.addAttribute("cslist", csboardSVC.list(reqPage,searchType,keyword));
				//페이지 제어
				model.addAttribute("pc", csboardSVC.getPageCriteria(reqPage, searchType, keyword));
			}
			
			List<BoardVO> list1 = boardSVC.list("1");
			
			for(BoardVO item : list1) {
				String[] sdateTime = item.splitDatetime();
				String sdate = sdateTime[0];
				String stime = sdateTime[1];
				String stime2 = stime.substring(0, 5);
				item.setSdate(sdate);
				item.setStime(stime2);
			}
			model.addAttribute("list1", list1);
			
			List<BoardVO> list2 = boardSVC.list("2");
			
			for(BoardVO item : list2) {
				String[] sdateTime = item.splitDatetime();
				String sdate = sdateTime[0];
				String stime = sdateTime[1];
				String stime2 = stime.substring(0, 5);
				item.setSdate(sdate);
				item.setStime(stime2);
			}
			
			model.addAttribute("list2", list2);
			//게시글 목록
			model.addAttribute("cslist", csboardSVC.list(reqPage,searchType,keyword));
			//페이지 제어
			model.addAttribute("pc", csboardSVC.getPageCriteria(reqPage, searchType, keyword));
				
		return "main/main";
	}
	
	
}
