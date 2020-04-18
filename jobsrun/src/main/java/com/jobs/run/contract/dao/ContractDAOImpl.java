package com.jobs.run.contract.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.jobs.run.contract.vo.ContractVO;

@Repository
public class ContractDAOImpl implements ContractDAO {
	private static final Logger logger = LoggerFactory.getLogger(ContractDAOImpl.class);

	@Inject
	SqlSession sqlSession;
	
	//계약 생성
	@Override
	public int create(ContractVO contractVO) {
		logger.info("contractVO DAO 전달 값 :" + contractVO);
		return sqlSession.insert("mappers.ContractDAO-mapper.create",contractVO);
	}
	
	//계약 완료
	@Override
	public int contractCompletion(String contnum) {
		return sqlSession.update("mappers.ContractDAO-mapper.contractCompletion",Long.valueOf(contnum));
	}
	//계약 조회
	@Override
	public ContractVO contView(String contnum) {
		ContractVO contractVO = sqlSession.selectOne("mappers.ContractDAO-mapper.contView",Long.valueOf(contnum));
		logger.info("조회된 계약 :" + contractVO.toString());
		return contractVO;
	}
	
	//글번호로 게시판과 계약 join 하여 계약번호 검색
	@Override
	public Long searchContnum(String bnum) {
		logger.info("searchContnum DAO 실행");
		Long result = sqlSession.selectOne("mappers.ContractDAO-mapper.searchContnum",Long.valueOf(bnum));
		logger.info("searchContnum DAO 가 찾은 글 번호" + result);
		return result;
	}

	//의뢰자 미 완료 계약 조회
	@Override
	public List<ContractVO> contractNotCompleteList(String id) {
		return sqlSession.selectList("mappers.ContractDAO-mapper.contractNotCompleteList",id);
	}

	//의뢰자 완료 계약 조회
	@Override
	public List<ContractVO> contractCompleteList(String id) {
		return sqlSession.selectList("mappers.ContractDAO-mapper.contractCompleteList",id);
	}
	
	//해결사 미 완료 계약 조회
	@Override
	public List<ContractVO> scontractNotCompleteList(String id) {
		return sqlSession.selectList("mappers.ContractDAO-mapper.scontractNotCompleteList",id);
	}
	
	//해결사 완료 계약 조회
	@Override
	public List<ContractVO> scontractCompleteList(String id) {
		return sqlSession.selectList("mappers.ContractDAO-mapper.scontractCompleteList",id);
	}
	

}
