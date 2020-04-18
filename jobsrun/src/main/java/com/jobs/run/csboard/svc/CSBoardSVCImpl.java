package com.jobs.run.csboard.svc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.jobs.run.board.vo.BoardCategoryVO;
import com.jobs.run.common.FindCriteria;
import com.jobs.run.common.PageCriteria;
import com.jobs.run.common.RecordCriteria;
import com.jobs.run.csboard.dao.CSBoardDAO;
import com.jobs.run.csboard.vo.CSBoardVO;

@Service
public class CSBoardSVCImpl implements CSBoardSVC {
	public static final Logger logger 
	= LoggerFactory.getLogger(CSBoardSVCImpl.class);

@Inject
CSBoardDAO csboardDAO;


//게시글작성
	@Transactional //메소드내에 다른 실행 메소드가 여러개일 경우 하나가 성공하고 다음 메소드가 실패할경우 처음성공한 하나도 다시 롤백시켜주기위함
	@Override
	public int write(CSBoardVO csboardVO) {
		//1) 게시글 작성
		int cnt = csboardDAO.write(csboardVO);
	
		return cnt;
	}
	
	//게시글수정
	@Transactional
	@Override
	public int modify(CSBoardVO csboardVO) {
		//1) 게시글 수정
		int cnt = csboardDAO.modify(csboardVO);
		return cnt;
	}
	//게시글삭제
	@Transactional
	@Override
	public int delete(String csbnum) {
		int cnt = 0;
		cnt = csboardDAO.delete(csbnum);
		return cnt;
	}
	
	//게시글보기
	@Transactional
	@Override
	public Map<String,Object> view(String csbnum) {
		//1) 게시글 가져오기
		CSBoardVO csboardVO = csboardDAO.view(csbnum);
		
		Map<String,Object> map = new HashMap<>();
		map.put("csboard", csboardVO);
		
		return map;
	}

	//게시글목록
	//1)전체
	@Override
	public List<CSBoardVO> list() {
		return csboardDAO.list();
	}
	
	//2)검색어 없는 게시글페이징
	@Override
	public List<CSBoardVO> list(int startRec, int endRec) {
		return null;
	}
	
	//3)검색어 있는 게시글검색(요청페이지,검색유형,검색어)
	@Override
	public List<CSBoardVO> list(String reqPage, String searchType, String keyword) {	
		 
		int l_reqPage = 0;
		
		//요청 페이지 정보가 없으면 1로 초기화
		if(reqPage == null || reqPage.trim().isEmpty()) {
			l_reqPage =  1;
		}else {
			l_reqPage = Integer.parseInt(reqPage);
		}
		
		RecordCriteria recordCriteria = new RecordCriteria(l_reqPage);
		
		return csboardDAO.list(
				recordCriteria.getStartRec(), 
				recordCriteria.getEndRec(), 
				searchType, keyword);
	}
	
	//페이지 제어
	@Override
	public PageCriteria getPageCriteria(String reqPage, String searchType, String keyword) {
		
		PageCriteria 		pc = null;					//한페이지에 보여줄 페이징 계산하는 클래스
		FindCriteria 		fc = null;					//PageCriteira + 검색타입, 검색어		
		
		int totalRec = 0;										//전체레코드 수
		
		int l_reqPage = 0;
		
		//요청 페이지 정보가 없으면 1로 초기화
		if(reqPage == null || reqPage.trim().isEmpty()) {
			l_reqPage =  1;
		}else {
			l_reqPage = Integer.parseInt(reqPage);
		}
			
		totalRec = csboardDAO.totalRecordCount(searchType,keyword);
		
		fc = new FindCriteria(l_reqPage, searchType, keyword);
		pc = new PageCriteria(fc, totalRec);
		
		logger.info("fc:"+fc.toString());
		logger.info("rc:"+((RecordCriteria)fc).toString());
		logger.info("pc:"+pc.toString());
		return pc;
	}
	
	//게시글답글작성
	@Transactional
	@Override
	public int reply(CSBoardVO csboardVO) {
		//1) 게시글 답글 작성
		int cnt = csboardDAO.reply(csboardVO);
		//2) bnum 가져오기 => mybatis: selectkey 사용
		return cnt;
	}
}
