package com.jobs.run.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jobs.run.DebitCredit.DebitCreditSVC;
import com.jobs.run.board.svc.BoardSVC;
import com.jobs.run.board.vo.BoardVO;
import com.jobs.run.common.Code;
import com.jobs.run.common.PasswordGenerator;
import com.jobs.run.common.mail.MailService;
import com.jobs.run.contract.svc.ContractSVC;
import com.jobs.run.contract.vo.ContractVO;
import com.jobs.run.member.svc.MemberSVC;
import com.jobs.run.member.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	MemberSVC memberSVC;
	
	@Inject
	BoardSVC boardSVC;
	
	@Inject
	MailService mailService;
	
	@Inject
	ContractSVC contractSVC;
	
	@Inject
	DebitCreditSVC  DCSVC;
	
	
	@ModelAttribute
	public void initData(Model model) {
		// 성별
		List<Code> gender = new ArrayList<>();
		gender.add(new Code("남", "남자"));
		gender.add(new Code("여", "여자"));

		model.addAttribute("gender", gender);
	}

	// 회원 가입 약관 동의 양식 불러오기
	@GetMapping("/joinFormclause")
	public String joinFormclause(Model model) {
		return "member/joinFormclause";
	}

	// 약관동의후에 회원가입 양식 폼 불러오기
	@GetMapping("/joinForm")
	public String joinForm(Model model) {
		model.addAttribute("mvo", new MemberVO());
		return "member/joinForm";
	}

	// 회원 등록
	@RequestMapping("/join")
	public String memberJoin(@Valid @ModelAttribute("mvo") MemberVO memberVO, 
			BindingResult result, 
			Model model,
			HttpServletResponse response) throws IOException {
		logger.info(memberVO.toString());

		// 유효성 오류체크 중 오류가 발견되면 회원 가입 페이지로 이동
		if (result.hasErrors()) {
			return "member/joinForm";
		}

		// 3)회원 가입처리
		int cnt = memberSVC.joinMember(memberVO);

		  if (cnt == 1) { PrintWriter out=response.getWriter();
		 
		  response.setContentType("text/html; charset=utf-8");
		  
		  out.println("<script language='javascript'>");
		  
		  out.println("alert('가입이 완료되었습니다. 로그인 해주세요!');");
		  
		  out.println("</script>");
		  
		  out.flush();
		  
		  return "member/loginForm"; } else { return "redirect:/"; }
		 	}

	// 아이디 중복체크 처리
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String idCheck(HttpServletRequest request) {
		String id = request.getParameter("id");
		int result = memberSVC.idCheck(id);
		return Integer.toString(result);
	}

	// 아이디 찾기 화면 양식
	@GetMapping("/findIDForm")
	public String findIDForm(Model model) {
		MemberVO memberVO = new MemberVO();
		model.addAttribute("memberVO", memberVO);
		return "member/findIDForm";
	}

	//아이디 찾기 post방식
		@PostMapping(value="/id",produces = "application/json")
		@ResponseBody
		public ResponseEntity<Map> findId(
				@RequestBody MemberVO memberVO
				){
			ResponseEntity<Map> res = null;
			String findId = null;
			String cdate = null;
			logger.info("tel:"+memberVO.getTel());
			logger.info("birth:"+memberVO.getBirth());
			
			//java.sql.Date타입으로 변환
			memberVO.setBirth(java.sql.Date.valueOf(memberVO.getBirth().toString()));
			//아이디 찾기 service 호출
			Map<String,Object> map = new HashMap();
			
			String result = null;
			if(memberSVC.findID(memberVO.getTel(),memberVO.getBirth()) != null) {
				findId = memberSVC.findID(memberVO.getTel(),memberVO.getBirth()).getId();
				cdate = memberSVC.findID(memberVO.getTel(),memberVO.getBirth()).getCdate().toString();

				result = cdate.substring(0,10);
							
				map.put("success",true);
				map.put("id",findId);
				map.put("cdate",result);
				res = new ResponseEntity<Map>(map, HttpStatus.OK);  // 200
			}			
			else {
				map.put("success",false);
				map.put("id",findId);
				map.put("cdate",result);
				map.put("msg","찾고자하는 아이디가 없습니다!");
				res = new ResponseEntity<Map>(map, HttpStatus.OK); //200
			}
			return res;
		}	
		
	// 비밀번호 찾기 화면 양식
	@GetMapping("/findPWForm")
	public String findPWForm(Model model) {
		MemberVO memberVO = new MemberVO();
		model.addAttribute("memberVO", memberVO);
		return "member/findPWForm";
	}
	
	//비밀번호 찾기 후 임시비밀번호 생성 처리
	@GetMapping(value = "/sendMail2")
	public String findpwupdate(HttpServletRequest request, 
			HttpServletResponse response,
			@RequestParam String id,
			Model model) throws Exception {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");

		/* List<MemberVO> list = memberSVC.selectAllMember(); */
		int result = memberSVC.idCheck(id);
		logger.info("result" + result);
		model.addAttribute("result", result);
		if(result == 0) {
			model.addAttribute("svr_msg", "가입된 회원정보가 없습니다.!");
		}
		else {
		
		/*
		 * for(MemberVO item:list) { if(item.getId() != id || id == null) {
		 * model.addAttribute("svr_msg", "가입된회원정보가 없습니다.!"); } }
		 */
				
		String to = id;
		
		logger.info("to" + to);
		//비밀번호 생성
		PasswordGenerator passwordGenerator = new PasswordGenerator.PasswordGeneratorBuilder()
				.useDigits(true)	//숫자포함
				.useLower(true)		//소문자포함
				.useUpper(true)		//대문자포함
				.usePunctuation(true)	//특수문자포함
				.build();
		String password = passwordGenerator.generate(8); //8자리 비밀번호 생성 
				
        //PrintWriter out = response.getWriter();
		StringBuffer sb = new StringBuffer();
		sb.append("<html><body>");
		sb.append("<meta http-equiv='Content-Type' content='text/html; charset=euc-kr'>");
		sb.append("<h1>" + "신규비밀번호" + "<h1><br>");
		sb.append("아래 비밀번호로 로그인 하셔서 비밀번호를 변경하세요.<br><br>");
		sb.append("<b>비밀번호 : </b>");
		sb.append(password+"<br><br>");
		sb.append("<a href='http://localhost:9080/run/loginForm'>로그인</a>");
		sb.append("</body></html>");
		
		int cnt = memberSVC.findpwupdate(to, password);
		logger.info("cnt" + cnt);
		logger.info("sb" + sb.toString());
		
		if(cnt == 1) {
			mailService.sendMail(to, "신규 비밀번호 발송", sb.toString());
			//out.print("메일을 발송하였습니다.!! 메일함에서 새로운 비밀번호를 확인하세요");
		}
	 }
		return "member/findPWForm";
	}
	
	//회원정보보기 양식
	@GetMapping("/memberinfoForm/{id:.+}")
	public String memberinfo(@PathVariable String id, Model model) {
		
		//1) 현재 로긴한 회원정보 읽어오기
		MemberVO memberVO = memberSVC.selectMember(id);
		logger.info("memberVO:" + memberVO);
		//비밀번호 제거
		
		model.addAttribute("mvo", memberVO);		

		return "member/memberinfoForm";
	} 
	

	//회원수정 양식
		@GetMapping("/modifyForm/{id:.+}") 
		public String modifyForm(@PathVariable String id, Model model) {
			
			//1) 현재 로긴한 회원정보 읽어오기
			MemberVO memberVO = memberSVC.selectMember(id);
			logger.info("memberVO:" + memberVO);
			//비밀번호 제거
			memberVO.setPw(null);
			model.addAttribute("mvo", memberVO);		

			return "member/modifyForm";
		} 
		@GetMapping("/file/{id:.+}")
		public ResponseEntity<byte[]> getFile(@PathVariable String id){
			MemberVO memberVO = memberSVC.selectMember(id);
			logger.info("getFile " + memberVO.toString());
			final HttpHeaders headers = new HttpHeaders();
			/*if(memberVO.getFile() != null ) {*/
				
				String filename = null;
				try {
					filename = new String(memberVO.getFname().getBytes("euc-kr"), "ISO-8859-1");			
				}
				catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				headers.setContentDispositionFormData("attachment", filename);
			/* } */
			return new ResponseEntity<byte[]>(memberVO.getPic(), headers, HttpStatus.OK);
		}
		//회원수정
		@PostMapping("/modify")
		public String modify(
				@Valid @ModelAttribute("mvo") MemberVO memberVO,
				BindingResult result,
				HttpSession session,
				HttpServletResponse response,
				Model model
				) throws IOException {
			logger.info("/modify호출됨!");
			//유효성 체크
			if(result.hasErrors()) {
				logger.info(result.getAllErrors().toString());
				//비밀번호 제거
				memberVO.setPw(null);
				return "member/modifyForm";
			}
			
			//회원정보수정
			int cnt = memberSVC.modifyMember(memberVO);
			if(cnt == 1) {
				logger.info("수정처리결과 :" + cnt);

				//세션정보 수정
				session.removeAttribute("member");	
				session.setAttribute("member", memberVO);
				
			/*
			 * PrintWriter out= response.getWriter();
			 * 
			 * response.setContentType("text/html; charset=utf-8");
			 * 
			 * out.println("<script language='javascript'>");
			 * 
			 * out.println("alert('회원정보가 수정되었습니다.!');");
			 * 
			 * out.println("</script>");
			 * 
			 * out.flush();
			 */
				return "/member/memberinfoForm";			
			}
			else {
				model.addAttribute("svr_msg", "비밀번호가 일치하지 않습니다.!");
				return "member/modifyForm";
			}
		}
		
		//url에 입력해서 들어가야합니다. 따로 a태그에 걸어논거는 없어요
		//회원탈퇴 양식 
		@GetMapping("/memberoutForm")
		public String memberoutForm() {
			return "member/memberoutForm";
		}
		
		//회원 탈퇴 처리
		@PostMapping("/out")
		public String out(
				@RequestParam("id") String id,
				@RequestParam("pw") String pw,
				HttpSession session,
				Model model){
				
				int cnt = memberSVC.outMember(id, pw);
				if(cnt == 1) {
					session.invalidate();
					return "redirect:/";
				}
				
				model.addAttribute("svr_msg", "비밀번호가 잘못되었습니다.!");
				
				return "member/memberoutForm";
			}
		
		//마이페이지 보안설정 화면 양식
		@GetMapping("/membersecurityForm/{id:.+}") //이메일로 가입을 받았기 때문에 . 있음
		public String membersecurityForm(@PathVariable String id, Model model) {		
			//1) 현재 로긴한 회원정보 읽어오기
			
			MemberVO memberVO = memberSVC.selectMember(id);		
			model.addAttribute("memberVO", memberVO);
			return "member/membersecurityForm";
		} 
		
		//마이페이지 보안설정에서 이메일 인증하러가기 클릭시 화면
		//이메일 인증 양식
		@GetMapping("/mailcheckForm/{id:.+}") //이메일로 가입을 받았기 때문에 . 있음
		public String mailcheckForm(@PathVariable String id, Model model) {		
			//1) 현재 로긴한 회원정보 읽어오기
			MemberVO memberVO = memberSVC.selectMember(id);
			logger.info("memberVO:" + memberVO);
			//비밀번호 제거
			memberVO.setPw(null);
			model.addAttribute("mvo", memberVO);		

			return "member/mailcheckForm";
		} 
		
		//이메일 인증
		@GetMapping("/emailcheck")
		public String emailcheck(
				HttpSession session,HttpServletResponse response) throws IOException {
			MemberVO memberVO = (MemberVO)session.getAttribute("member");
			String id = memberVO.getId();
			logger.info("아이디" + id);
			

			//이메일 인증 포인트 지급
			DCSVC.emailPoint(id);
			logger.info(id + "에게 이메일 오천 포인트 지급 완료");
			
			int cnt = memberSVC.emailcheck(id);
			
			if(cnt == 1) {
				PrintWriter out= response.getWriter();

				response.setContentType("text/html; charset=utf-8");

				out.println("<script language='javascript'>");

				out.println("alert('이메일 인증이 완료되었습니다. 5000포인트를 지급합니다.!');");

				out.println("</script>");

				out.flush();
				
				return "member/membersecurityForm";
			}
			
			return "member/mailcheckForm";
			
		}
		
		//마이페이지 보안설정에서 비밀번호 변경 클릭시 화면
		//비밀번호 변경 양식
		@GetMapping("/memberchangepwForm/{id:.+}") //이메일로 가입을 받았기 때문에 . 있음
		public String memberchangepwForm(@PathVariable String id, Model model) {		
			//1) 현재 로긴한 회원정보 읽어오기
			MemberVO memberVO = memberSVC.selectMember(id);
			logger.info("memberVO:" + memberVO);
			//비밀번호 제거
			memberVO.setPw(null);
			model.addAttribute("mvo", memberVO);		

			return "member/memberchangepwForm";
		} 
		
		//비밀번호 변경
		@PostMapping("/changepw")
		public String changepw(
				@Valid @ModelAttribute("mvo") MemberVO memberVO,
				BindingResult result,
				@RequestParam("id") String id,
				@RequestParam("pw") String pw,
				HttpSession session,
				HttpServletResponse response,
				Model model) throws IOException  {
			//유효성 체크
			if(result.hasErrors()) {
				logger.info(result.getAllErrors().toString());
				//비밀번호 제거
				memberVO.setPw(null);
				return "member/memberchangepwForm";
			}
			
			//비밀번호변경
			int cnt = memberSVC.changePW(id,pw);
			
			if(cnt == 1) {
				logger.info("수정처리결과 :" + cnt);
				
				PrintWriter out= response.getWriter();

				response.setContentType("text/html; charset=utf-8");

				out.println("<script language='javascript'>");

				out.println("alert('비밀번호가 변경되었습니다.!');");

				out.println("</script>");
				
				out.flush();
				
				return "main/main";			
			}
			else {
				logger.info("오류발생");
				return "member/memberchangepwForm";
			}
		}
		//사진 1건 삭제
		@DeleteMapping("/file/{id:.+}")
		@ResponseBody
		public ResponseEntity<String> fileDelete(
				@PathVariable String id){
			logger.info("id="+id);
			int cnt = memberSVC.fileDelete(id);
			
			if(cnt == 1) {
				return new ResponseEntity<String>("success", HttpStatus.OK);
			}
			else {
				return new ResponseEntity<String>("fail", HttpStatus.FAILED_DEPENDENCY);
			}
		}
		
		
		//마이페이지에서 글 목록 조회하기
		@GetMapping("/myPage")
		public String myList(Model model,HttpSession session) {
			MemberVO memberVO = (MemberVO)session.getAttribute("member");
			String bid = memberVO.getId();
			logger.info("bid = " + bid);
			//1)의뢰자 신청
			//지원후 승인 대기중
			BoardVO boardVO1 = queryParam("2", 1, bid);//검색 파라미터 설정
			List<BoardVO> queryList1 = boardSVC.queryList(boardVO1);
			trans(queryList1);//sdatetime 을 날짜 시간으로 분할
			model.addAttribute("queryList1", queryList1);
			//지원후 승인됨
			BoardVO boardVO2 = queryParam("2", 2, bid);//검색 파라미터 설정
			List<BoardVO> queryList2 = boardSVC.queryList(boardVO2);
			trans(queryList2);//sdatetime 을 날짜 시간으로 분할
			model.addAttribute("queryList2", queryList2);
			
			//2)의뢰자 글 
			//미지원
			List<BoardVO> listNotMatched = boardSVC.listNotMatched("1", bid);
			trans(listNotMatched);//sdatetime 을 날짜 시간으로 분할
			model.addAttribute("listNotMatched", listNotMatched);
			
			//지원 받은 글
			List<BoardVO> listApplied = boardSVC.listApplied("1", bid);
			trans(listApplied);//sdatetime 을 날짜 시간으로 분할
			model.addAttribute("listApplied", listApplied);
			
			//승인 완료 글
			List<BoardVO> listPermitted = boardSVC.listPermitted("1", bid);
			trans(listPermitted);//sdatetime 을 날짜 시간으로 분할
			model.addAttribute("listPermitted", listPermitted);
			
			//의뢰자 계약
			//의뢰자의 미완료 계약
			model.addAttribute("contractNotCompleteList", contractSVC.contractNotCompleteList(bid));
			//의뢰자의 완료 계약
			model.addAttribute("contractCompleteList", contractSVC.contractCompleteList(bid));
			
			//3)해결사 신청 
			//지원후 승인 대기중
			BoardVO boardVO3 = queryParam("1", 1, bid);//검색 파라미터 설정
			List<BoardVO> queryList3 = boardSVC.queryList(boardVO3);
			trans(queryList3);//sdatetime 을 날짜 시간으로 분할
			model.addAttribute("queryList3", queryList3);
			//지원후 승인됨
			BoardVO boardVO4 = queryParam("1", 2, bid);//검색 파라미터 설정
			List<BoardVO> queryList4 = boardSVC.queryList(boardVO4);
			trans(queryList4);//sdatetime 을 날짜 시간으로 분할
			model.addAttribute("queryList4", queryList4);
			//4)해결사 글 
			//미지원
			List<BoardVO> slistNotMatched = boardSVC.listNotMatched("2", bid);
			trans(slistNotMatched);//sdatetime 을 날짜 시간으로 분할
			model.addAttribute("slistNotMatched", slistNotMatched);
			
			//지원 받은 글
			List<BoardVO> slistApplied = boardSVC.listApplied("2", bid);
			trans(slistApplied);//sdatetime 을 날짜 시간으로 분할
			model.addAttribute("slistApplied", slistApplied);
			
			//승인 완료 글
			List<BoardVO> slistPermitted = boardSVC.listPermitted("2", bid);
			trans(slistPermitted);//sdatetime 을 날짜 시간으로 분할
			model.addAttribute("slistPermitted", slistPermitted);
			
			//해결사 계약
			//해결사의 미완료 계약
			model.addAttribute("scontractNotCompleteList", contractSVC.scontractNotCompleteList(bid));
			//해결사의 완료 계약
			logger.info("contractSVC.scontractCompleteList(bid) 해결사 완료계약 결과");
			for(ContractVO item : contractSVC.scontractCompleteList(bid)) {
				logger.info(item.toString());
			}
			model.addAttribute("scontractCompleteList", contractSVC.scontractCompleteList(bid));
			
			return "myPage/myPage";
		}
		
		//sdatetime 을 날짜 시간으로 분할 기능
		private void trans(List<BoardVO> list) {
			for(BoardVO item : list) {
				String[] sdateTime = item.splitDatetime();
				String sdate = sdateTime[0];
				String stime = sdateTime[1];
				String stime2 = stime.substring(0, 5);
				item.setSdate(sdate);
				item.setStime(stime2);
			}
		}
		//신청 조회시 매개변수 설정
		private BoardVO queryParam(
				String bbcid,
				int bstatus,
				String bapplication) {
			BoardVO boardVO = new BoardVO();
			boardVO.setBbcid(bbcid);
			boardVO.setBstatus(bstatus);
			boardVO.setBapplication(bapplication);
			return boardVO;
		}
		
		
		
}

