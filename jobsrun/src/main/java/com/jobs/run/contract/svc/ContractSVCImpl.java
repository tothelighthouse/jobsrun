package com.jobs.run.contract.svc;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.jobs.run.contract.dao.ContractDAO;
import com.jobs.run.contract.vo.ContractVO;

@Service
public class ContractSVCImpl implements ContractSVC {
	private static final Logger logger = LoggerFactory.getLogger(ContractSVCImpl.class);
	
	@Inject
	ContractDAO contractDAO;
	//계약 생성
	@Override
	public int create(ContractVO contractVO) {
		logger.info("createSVC 실행");
		return contractDAO.create(contractVO);
	}
	
	//계약 조회
	@Override
	public ContractVO contView(String contnum) {
		logger.info("계약조회SVC 실행");
		return contractDAO.contView(contnum);
	}
	
	@Override
	public Long searchContnum(String bnum) {
		return contractDAO.searchContnum(bnum);
	}
	
	
	//계약 완료
	@Override
	public int contractCompletion(String bnum) {
		return contractDAO.contractCompletion(bnum);
	}
	
	//의뢰자 미 완료 계약 조회
	@Override
	public List<ContractVO> contractNotCompleteList(String id) {
		return contractDAO.contractNotCompleteList(id);
	}
	
	//의뢰자 완료 계약 조회
	@Override
	public List<ContractVO> contractCompleteList(String id) {
		return contractDAO.contractCompleteList(id);
	}
	
	//해결사 미 완료 계약 조회
	@Override
	public List<ContractVO> scontractNotCompleteList(String id) {
		return contractDAO.scontractNotCompleteList(id);
	}
	
	//해결사 완료 계약 조회
	@Override
	public List<ContractVO> scontractCompleteList(String id) {
		return contractDAO.scontractCompleteList(id);
	}
	

}
;