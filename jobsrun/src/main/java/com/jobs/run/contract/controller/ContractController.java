package com.jobs.run.contract.controller;


import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jobs.run.DebitCredit.DebitCreditSVC;
import com.jobs.run.board.svc.BoardSVC;
import com.jobs.run.board.vo.BoardCategoryVO;
import com.jobs.run.board.vo.BoardVO;
import com.jobs.run.contract.svc.ContractSVC;
import com.jobs.run.contract.vo.ContractVO;

@Controller
@RequestMapping("/contract")
public class ContractController {

	private static final Logger logger = LoggerFactory.getLogger(ContractController.class);
	@Inject
	BoardSVC boardSVC;
	
	@Inject
	ContractSVC contractSVC;
	
	@Inject
	DebitCreditSVC DCSVC;
	
	//지원에 대한 승낙과 계약생성
	@GetMapping("/permission/{bnum}")
	public String create(
			@PathVariable String bnum,
			HttpSession session
			) {
		logger.info("계약 생성실행");
		logger.info("글번호 :" + bnum);
		//
		
		//지원에 대한 승낙, status 2->3
		boardSVC.permission(bnum);
		
		//승낙한 글
		BoardVO boardVO = (BoardVO)boardSVC.view(bnum).get("board");
		logger.info("승낙한 글의 카테고리 :" + boardVO.getBoardCategoryVO().toString());
		BoardCategoryVO boardCategoryVO = boardVO.getBoardCategoryVO();
		long category = boardCategoryVO.getBcid();
		//의뢰자 글 승낙의 경우
		if(category == 1) {
			logger.info("의뢰자가 승낙한 글 상세 내용 boardVO :" + boardVO.toString());

			//계약 생성
			ContractVO contractVO = new ContractVO();
			contractVO.setCbnum(boardVO.getBnum());
			contractVO.setClientID(boardVO.getBid());
			contractVO.setShooterID(boardVO.getBapplication());
			contractVO.setCamount(boardVO.getPayment());
			logger.info("의뢰자가 생성한 계약 상세 내용 contractVO :" + contractVO.toString());

			contractSVC.create(contractVO);
			
		//해결사 글 승낙의 경우
		}else if(category == 2) {
			logger.info("해결사가 승낙한 글 상세 내용 boardVO :" + boardVO.toString());

			//계약 생성
			ContractVO contractVO = new ContractVO();
			contractVO.setCbnum(boardVO.getBnum());
			contractVO.setClientID(boardVO.getBapplication());
			contractVO.setShooterID(boardVO.getBid());
			contractVO.setCamount(boardVO.getPayment());
			logger.info("해결사가 생성한 계약 상세 내용 contractVO :" + contractVO.toString());

			contractSVC.create(contractVO);
		}
		return "redirect:/member/myPage";
	}
	
	//계약 완료
	@GetMapping("/contractCompletion/{bnum}")
	public String contractCompletion(
			@PathVariable String bnum) {
		
		//글번호로 게시판과 계약 join 하여 계약번호 검색
		logger.info("계약 완료를 위한 글번호 :" + bnum.toString());
		String contnum = contractSVC.searchContnum(bnum).toString();
		
		//보수 지급 차감에 필요한 정보를 포함한 계약 검색
		ContractVO contractVO = contractSVC.contView(contnum);
		
		//보수 지급
		DCSVC.contractPay(contractVO);
		//보수 차감
		DCSVC.scontractPay(contractVO);

		//계약 완료, status 0->1
		contractSVC.contractCompletion(contnum);
		
		//게시글 완료, status 2->3
		boardSVC.boardCompletion(bnum);
		
		return "redirect:/member/myPage";
	}
	
}

























