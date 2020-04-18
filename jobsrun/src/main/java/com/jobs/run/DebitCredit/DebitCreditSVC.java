package com.jobs.run.DebitCredit;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobs.run.contract.dao.ContractDAO;
import com.jobs.run.contract.vo.ContractVO;

@Service
public class DebitCreditSVC {

	private static final Logger lg = LoggerFactory.getLogger(DebitCreditSVC.class);

	@Autowired
	DebitCreditDAO DCDAO;
	
	public List<DebitCreditVO> history(String id) {
		List<DebitCreditVO> history = DCDAO.history(id);
		lg.info(DCDAO.history(id).toString());		
		return history;
	}
	

	public int incsCrd(DebitCreditVO DB) {
		lg.info(DB.toString());
		return DCDAO.incsCrd(DB);
	}
	
	
	public int decsCrd(DebitCreditVO DB) {
		lg.info(DB.toString());
		return DCDAO.decsCrd(DB);
	}
	
	//포인트 계산
	public int calculation(String id) {
		lg.info(id);
		return DCDAO.calculation(id);
	}
	//계약 완료후 보수 차감
	public int contractPay(ContractVO contractVO) {
		lg.info("계약 완료후 보수 지급SVC 실행");
		lg.info("계약 상세 내용 :" + contractVO);
		return DCDAO.contractPay(contractVO);
	}
	
	//계약 완료후 보수 지금
	public int scontractPay(ContractVO contractVO) {
		lg.info("계약 완료후 보수 지급SVC 실행");
		lg.info("계약 상세 내용 :" + contractVO);
		return DCDAO.scontractPay(contractVO);
	}
	
	//이메일 인증 포인트 지급
	public int emailPoint(String id) {
		return DCDAO.emailPoint(id);
	}

}
















