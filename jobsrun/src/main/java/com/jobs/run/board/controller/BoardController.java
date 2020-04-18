package com.jobs.run.board.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jobs.run.board.svc.BoardSVC;
import com.jobs.run.board.vo.BoardCategoryVO;
import com.jobs.run.board.vo.BoardFileVO;
import com.jobs.run.board.vo.BoardVO;
import com.jobs.run.common.Code;
import com.jobs.run.common.IntCode;
import com.jobs.run.contract.svc.ContractSVC;
import com.jobs.run.member.vo.MemberVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Inject
	BoardSVC boardSVC;
	
	@Inject
	ContractSVC contractSVC;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@ModelAttribute
	public void initJobData(Model model) {
		List<Code> job = new ArrayList<>();
		job.add(new Code("청소","청소"));
		job.add(new Code("요리","요리"));
		job.add(new Code("수리","수리"));
		job.add(new Code("배달","배달"));
		job.add(new Code("기타","기타"));
		model.addAttribute("job", job);
	}

	@ModelAttribute
	public void init2PaymentData(Model model) {
		List<IntCode> payment = new ArrayList<>();
		payment.add(new IntCode(5000,"5천원"));
		payment.add(new IntCode(10000,"1만원"));
		payment.add(new IntCode(15000,"1만 5천원"));
		payment.add(new IntCode(20000,"2만원"));
		model.addAttribute("payment", payment);
	}

	@ModelAttribute
	public void init2DurationData(Model model) {
		List<IntCode> duration = new ArrayList<>();
		duration.add(new IntCode(30,"30분"));
		duration.add(new IntCode(60,"1시간"));
		duration.add(new IntCode(90,"1시간 30분"));
		duration.add(new IntCode(120,"2시간"));
		model.addAttribute("duration", duration);
	}
	
	@ModelAttribute
	public void getCategory(Model model) {
		List<BoardCategoryVO> boardCategoryVO = boardSVC.getCategory();
		logger.info(boardCategoryVO.toString());
		model.addAttribute("boardCategoryVO", boardCategoryVO);
	}
	
	//게시글 등록 양식
	@GetMapping("/writeForm/{returnPage}/{bcategory}")
	public String writeForm(
			@ModelAttribute @PathVariable("returnPage") String returnPage,
			@PathVariable("bcategory") String bcategory,
			Model model) {
		BoardVO boardVO = new BoardVO();
		
		BoardCategoryVO boardCategoryVO = new BoardCategoryVO();
		boardCategoryVO.setBcid(Long.valueOf(bcategory));
		
		boardVO.setBoardCategoryVO(boardCategoryVO);
		
		model.addAttribute("boardVO", boardVO);
		return "board/writeForm";
	}

	//게시글 등록
	@PostMapping("/write/{returnPage}")
	public String write(
			@PathVariable String returnPage,
			@ModelAttribute BoardVO boardVO,
			HttpSession session
			) {
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		boardVO.setBid(memberVO.getId());
		boardVO.setBnickname(memberVO.getNickname());
		boardVO.setSdatetime(java.sql.Timestamp.valueOf(boardVO.combineDatetime()));
		boardSVC.write(boardVO);
		return "redirect:/board/view/"+ returnPage + "/" + boardVO.getBnum();
	}
	
	//게시물 보기
	@GetMapping({"/view/{returnPage}/{bnum}", "view/{bnum}"})
	public String view(
			@ModelAttribute @PathVariable (required = false) String returnPage, 
			@PathVariable("bnum") String bnum,
			Model model
			) {
		
		
		Map<String,Object> map = boardSVC.view(bnum);
		BoardVO boardVO = (BoardVO)map.get("board");
		String[] sdateTime = boardVO.splitDatetime();
		String sdate = sdateTime[0];
		String stime = sdateTime[1];
		boardVO.setSdate(sdate);
		boardVO.setStime(stime);

		
		logger.info(boardVO.toString());
		List<BoardFileVO> files = null;
		if(map.get("files") != null) {
			files = (List<BoardFileVO>)map.get("files");
		}
		
		if(returnPage == null) {
			model.addAttribute("returnPage", "1");
		}
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("files", files);
		logger.info("filesdwqdq" + files);
		return "board/viewForm";
	}
	
	//첨부파일 다운로드
	@GetMapping("/file/{fid}")
	public ResponseEntity<byte[]> getFile(@PathVariable String fid) {
		BoardFileVO boardVoFileVO = boardSVC.fileView(fid);
		logger.info("getFile " + boardVoFileVO.toString());
		
		final HttpHeaders headers = new HttpHeaders();
		String[] mtypes = boardVoFileVO.getFtype().split("/");
		headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
		headers.setContentLength(boardVoFileVO.getFsize());
		/* 첨부파일명이 한글일경우 깨짐 방지 */ 
		String filename = null;
		try {
			filename = new String(boardVoFileVO.getFname().getBytes("euc-kr"), "ISO-8859-1");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		headers.setContentDispositionFormData("attachment", filename);
		/***************************/
		return new ResponseEntity<byte[]>(boardVoFileVO.getFdata(), headers,	HttpStatus.OK);
	}	
	//게시글 삭제
	@GetMapping("/delete/{bcategory}/{returnPage}/{bnum}")
	public String delete(
			@PathVariable String bcategory,
			@PathVariable String returnPage,
			@PathVariable String bnum, 
			Model model) {
		
		//1)게시글 및 첨부파일 삭제
		boardSVC.delete(bnum);
		//2)게시글 목록 가져오기
		model.addAttribute("list", boardSVC.list());
		
		return "redirect:/board/list/"+bcategory+"/"+returnPage;
	}
	
	//게시글 수정
	//게시글수정
	@PostMapping("/modify/{returnPage}")
//	@PostMapping("/modify")
	public String modify(
			@PathVariable(required = false) String returnPage,
			@ModelAttribute("boardVO") BoardVO boardVO
			) {
		
		logger.info("게시글 수정 내용:" + boardVO.toString());
		logger.info("setSdatetime 수정 내용:" + boardVO.combineDatetime().toString());
		boardVO.setSdatetime(java.sql.Timestamp.valueOf(boardVO.mcombineDatetime()));
		boardSVC.modify(boardVO);
		return "redirect:/board/view" + "/" + returnPage + "/" +boardVO.getBnum();
	}

	//목록보기
	@RequestMapping({
					"/boardlistAll/{category}",
					"/boardlistAll/{category}/{reqPage}",
					"/boardlistAll/{category}/{reqPage}/{searchType}/{keyword}"})
	public String boardlistAll(
			@PathVariable(required=false) String category,
			@PathVariable(required=false) String reqPage,
			@PathVariable(required=false) String searchType,
			@PathVariable(required=false) String keyword,
			@RequestBody(required=false) Map<String, Object> detailCond,
			HttpSession session, 
			Model model) {
		//로그인 사용자 지역
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		String location = memberVO.getRegion().toString().substring(0,5);
		logger.info("memberVO.getRegion() :" + location);
		
		//로그인  사용자가 쓴 모든 글의 지역
		//1) 매개변수 설정
		BoardVO boardVO = new BoardVO();
		boardVO.setBid(memberVO.getId());
		//1-1) 카테고리 반대 설정
		//의뢰자 게시판 열람시에는 해결사 게시판에 사용자가 쓴글을 검색
		if(Integer.valueOf(category) == 1) {
			boardVO.setBbcid("2");
		//해결사 게시판 열람시에는 의뢰자 게시판에 사용자가 쓴글을 검색
		}else if(Integer.valueOf(category) == 2) {
			boardVO.setBbcid("1");
		}
		//2) 로그인 사용자가 쓴 글의 지역
		List<BoardVO> result = boardSVC.userwritelist(boardVO);
		logger.info("boardSVC.userwritelist(boardVO): 의 값" + boardSVC.userwritelist(boardVO));
		//3) 리스트로 변경
		List<String> locationList = new ArrayList<String>();
		locationList.add(location);
		for(BoardVO item : result) {
			//리스트에 값 차례로 삽입
			locationList.add(item.getBlocation());
		}
		
		
		logger.info("listAll 실행");
		List<BoardVO> list = boardSVC.boardlistAll(reqPage,searchType,keyword,category,locationList);
		for(BoardVO item : list) {
			String[] sdateTime = item.splitDatetime();
			String sdate = sdateTime[0];
			String stime = sdateTime[1].substring(0,5);;
			item.setSdate(sdate);
			item.setStime(stime);
		}
		for(BoardVO item : list) {
			logger.info("받아온 리스트" + item.toString());
		}
		//게시글 카테고리
		model.addAttribute("bcategory", category);
		//게시글목록
		model.addAttribute("list", list);
		//페이지 제어	
		model.addAttribute("pc", boardSVC.boardlistAllgetPageCriteria(reqPage, searchType, keyword, category, locationList));	
		return "board/list";
	}
	
	//목록보기
	@RequestMapping({"/list/{category}",
		"/list/{category}/{reqPage}",
	"/list/{category}/{reqPage}/{searchType}/{keyword}"})
	public String listAll(
			@PathVariable(required=false) String category,
			@PathVariable(required=false) String reqPage,
			@PathVariable(required=false) String searchType,
			@PathVariable(required=false) String keyword,
			@RequestBody(required=false) Map<String, Object> detailCond,
			HttpSession session, 
			Model model) {

		logger.info("listAll 실행");
		List<BoardVO> list = boardSVC.list(reqPage,searchType,keyword,category,detailCond);
		//		logger.info(list.toString());
		for(BoardVO item : list) {
			String[] sdateTime = item.splitDatetime();
			String sdate = sdateTime[0];
			String stime = sdateTime[1].substring(0,5);
			item.setSdate(sdate);
			item.setStime(stime);
		}
		//게시글 카테고리
		model.addAttribute("bcategory", category);
		//게시글목록
		model.addAttribute("list", list);
		//페이지 제어	
		model.addAttribute("pc", boardSVC.getPageCriteria(reqPage, searchType, keyword, category, detailCond));	
		return "board/list";
	}
		
	//게시글에 대한 지원 양식
	@GetMapping("/applicationForm")
	public String applicationForm() {
		return null;
	}
	
	//게시글에 대한 지원과 지원철회
	@GetMapping("/application/{bnum}")
	public String application(
			@PathVariable("bnum") String bnum,
			HttpSession session) {
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		logger.info(memberVO.toString());
		BoardVO boardVO = new BoardVO();
		boardVO.setBnum(Long.valueOf(bnum));
		boardVO.setBapplication(memberVO.getId());
		logger.info(boardVO.toString());
		int cnt = boardSVC.application(boardVO);
		return "redirect:/member/myPage";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
