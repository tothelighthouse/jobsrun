package com.jobs.run.DebitCredit;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jobs.run.contract.dao.ContractDAO;
import com.jobs.run.contract.vo.ContractVO;

@Repository
public class DebitCreditDAO {
	
	private static final Logger lg = LoggerFactory.getLogger(DebitCreditDAO.class);
	
	@Autowired
	SqlSession sql;
	
	public List<DebitCreditVO> history(String id) {
		List<DebitCreditVO> history = sql.selectList("mappers.DebitCredit-mapper.history", id);
		lg.info(history.toString());
		return history;
	}

	public int incsCrd(DebitCreditVO DB) {
		lg.info(DB.toString());
		return sql.insert("mappers.DebitCredit-mapper.incsCrd", DB);
	}
	
	public int decsCrd(DebitCreditVO DB) {
		lg.info(DB.toString());
		return sql.insert("mappers.DebitCredit-mapper.decsCrd", DB);
	}
	
	//포인트 계산
	public int calculation(String id) {
		lg.info(id);
		return sql.selectOne("mappers.DebitCredit-mapper.calculation",id);
	}
	
	//계약 완료후 보수 차감
	public int contractPay(ContractVO contractVO) {
		lg.info("계약 완료후 보수 지급DAO 실행");
		lg.info("계약 상세 내용 :" + contractVO);
		return sql.insert("mappers.DebitCredit-mapper.contractPay",contractVO);
	}
	
	//계약 완료후 보수 지급
	public int scontractPay(ContractVO contractVO) {
		lg.info("계약 완료후 보수 지급DAO 실행");
		lg.info("계약 상세 내용 :" + contractVO);
		return sql.insert("mappers.DebitCredit-mapper.scontractPay",contractVO);
	}
	
	//이메일 인증 포인트 지급
	public int emailPoint(String id) {
		return sql.insert("mappers.DebitCredit-mapper.emailPoint",id);
	}
}














