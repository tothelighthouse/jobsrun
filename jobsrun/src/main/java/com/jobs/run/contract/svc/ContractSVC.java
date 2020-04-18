package com.jobs.run.contract.svc;

import java.util.List;

import com.jobs.run.contract.vo.ContractVO;

public interface ContractSVC {
	
	//계약 생성
	int create(ContractVO contractVO);

	//계약 완료
	int contractCompletion(String contnum);
	
	//계약 조회
	ContractVO contView(String contnum);
	
	//글번호로 게시판과 계약 join 하여 계약번호 검색
	Long searchContnum(String bnum);
	
	//의뢰자 미 완료 계약 조회
	List<ContractVO> contractNotCompleteList(String id);
	
	//의뢰자 완료 계약 조회
	List<ContractVO> contractCompleteList(String id);
	
	//해결사 미 완료 계약 조회
	List<ContractVO> scontractNotCompleteList(String id);
	
	//해결사 완료 계약 조회
	List<ContractVO> scontractCompleteList(String id);

}
