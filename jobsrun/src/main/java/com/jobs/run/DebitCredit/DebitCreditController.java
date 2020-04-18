package com.jobs.run.DebitCredit;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jobs.run.contract.svc.ContractSVC;
import com.jobs.run.contract.vo.ContractVO;
import com.jobs.run.member.vo.MemberVO;

@Controller
@RequestMapping("/DebitCredit")
public class DebitCreditController {

	private static final Logger lg = LoggerFactory.getLogger(DebitCreditController.class);
	
	@Autowired
	DebitCreditSVC  DCSVC;
	
	@Inject
	ContractSVC contractSVC;

/* 포인트 충전, 받기 거래내역 보기 ********************************************************************/
	@GetMapping("/history/{id:.+}")
	public String History(
			@PathVariable String id, Model model) {
		lg.info(id);
		List<DebitCreditVO> history = DCSVC.history(id);
		lg.info("list==> " + history.toString());
		
		model.addAttribute("history", history);
		return "myPage/DebitCredit/History";
	} // end History();
/* 끝 포인트 충전, 받기 거래내역 보기 ********************************************************************/
	
	
/* 포인트 충전 ******************************************************************************************/	
	@GetMapping("/CreditForm")
	public String CreditForm() {
		return "myPage/DebitCredit/CreditForm";
	}
	
	
	@PostMapping("/Credit.do")
	public String Credit(
			@RequestParam String id,
			@RequestParam String amount,
			@RequestParam String cards,
			@RequestParam String card,
			@RequestParam String cvc
			) {
		System.out.println(id);
		System.out.println(amount);
		System.out.println(cards);
		System.out.println(card);
		System.out.println(cvc);
		
		DebitCreditVO DC= new DebitCreditVO(); 
		
		DC.setAmount( ((Integer.parseInt(amount))) );
		DC.setId(id);
		DC.setVia(cards);
		DC.setDetail(card);
		
		int cnt = DCSVC.incsCrd(DC);
		System.out.println("성공여부?" + cnt);
		if(cnt == 1) {
			return "redirect:/DebitCredit/history/"+id;
		} else {
			return null;
		}
	} // end credit();
/* 포인트 충전 ******************************************************************************************/	
	
/* 포인트 현금으로 가져가기 ************************************************************************/
	@GetMapping("/DebitForm")
	public String DebitForm() {
		return "myPage/DebitCredit/DebitForm";
	}
	
	@PostMapping("/Debit.do")
	public String Debit(
			@RequestParam String id,
			@RequestParam String amount,
			@RequestParam String bank,
			@RequestParam String acctNum
			) {
		System.out.println(id);
		System.out.println(amount);
		System.out.println(bank);
		System.out.println(acctNum);
		
		DebitCreditVO DC= new DebitCreditVO(); 
		
		DC.setAmount( ((Integer.parseInt(amount))*-1) );
		DC.setId(id);
		DC.setVia(bank);
		DC.setDetail(acctNum);
		
		int cnt = DCSVC.decsCrd(DC);
		System.out.println("성공여부?" + cnt);
		if(cnt == 1) {
			return "redirect:/DebitCredit/history/"+id;
		} else {
			return null;
		}		
	} // end Debit();
/* 끝 포인트 현금으로 가져가기 ************************************************************************/
	
/* 시작 포인트 계산  ************************************************************************/
	@GetMapping("/calculation")
	public ResponseEntity<Integer> calculation(HttpSession session){
		ResponseEntity<Integer> res = null;
		String id = null;
		//로그인 ID
		if(session.getAttribute("member") != null) {
			MemberVO memberVO = (MemberVO)session.getAttribute("member");
			id = memberVO.getId();
			//잔액 계산
			int cnt = DCSVC.calculation(id);
			
			//뷰로 잔액 전달
			res = new ResponseEntity<Integer>(cnt, HttpStatus.OK);
			return res;
		}
		return null;
	}
/* 끝 포인트 계산  ************************************************************************/	
	
/* 시작 계약 완료후 보수 지급, 차감 ************************************************************************/	
	@GetMapping("/contractPay/{contnum}")
	public String contractPay(@PathVariable String contnum) {
		
		//계약 검색
		ContractVO contractVO = contractSVC.contView(contnum);
		
		//보수 지급
		DCSVC.contractPay(contractVO);
		//보수 차감
		DCSVC.scontractPay(contractVO);
		return "myPage/DebitCredit/History";
	}
/* 끝 계약 완료후 보수 지급, 차감  ************************************************************************/	

/* 시작 이메일 인증 포인트 지급 ************************************************************************/	
@GetMapping("/emailPoint")
public String emailPoint(HttpSession session) {
	MemberVO memberVO = (MemberVO)session.getAttribute("member");
	DCSVC.emailPoint(memberVO.getId());
	
	
	return "myPage/DebitCredit/History";
}
/* 끝 이메일 인증 포인트 지급  ************************************************************************/	
	
	
}





















