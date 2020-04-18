package com.jobs.run.csboard.svc;

import java.util.List;
import java.util.Map;

import com.jobs.run.board.vo.BoardCategoryVO;
import com.jobs.run.common.PageCriteria;
import com.jobs.run.csboard.vo.CSBoardVO;


public interface CSBoardSVC {
	//게시글작성
	int write(CSBoardVO csboardVO);
	//게시글수정
	int modify(CSBoardVO csboardVO);
	//게시글삭제
	int delete(String csbnum);
	//게시글보기
	Map<String,Object> view(String csbnum);
	//게시글목록
	//1)전체
	List<CSBoardVO> list();
	//2)검색어 없는 게시글페이징
	List<CSBoardVO> list(int startRec, int endRec);	
	//3)검색어 있는 게시글검색(요청페이지, 검색유형, 검색어)
	List<CSBoardVO> list(String reqPage, String searchType,String keyword);
	//페이지 제어
	PageCriteria getPageCriteria(String reqPage, String searchType,String keyword);
	//게시글답글작성
	int reply(CSBoardVO csboardVO);
}
