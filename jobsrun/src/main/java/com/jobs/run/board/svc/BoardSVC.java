package com.jobs.run.board.svc;

import java.util.List;
import java.util.Map;

import com.jobs.run.board.vo.BoardCategoryVO;
import com.jobs.run.board.vo.BoardFileVO;
import com.jobs.run.board.vo.BoardVO;
import com.jobs.run.common.PageCriteria;

public interface BoardSVC {
	//카테고리 읽어오기
	List<BoardCategoryVO> getCategory();
	
	//의뢰인, 해결사 글쓰기
	int write(BoardVO boardVO);
	
	//게시글 보기
	Map<String,Object> view(String bnum);
	//특정 사용자의 모든 작성글의 지역 검색
	List<BoardVO> userwritelist(BoardVO boardVO);
	
	//로그인 사용자의 위치 기반 게시글 목록 리턴
	List<BoardVO> boardlistAll(
			String reqPage,
			String searchType,
			String keyword,
			String bcategory,
			List<String> locationList);
	
	//로그인 사용자의 위치 기반 게시글 페이지 제어
	PageCriteria boardlistAllgetPageCriteria(
			String reqPage, 
			String searchType, 
			String keyword,
			String bcategory,
			List<String> locationList);
	//게시글목록
	//1)전체
	List<BoardVO> list();
	//메인화면 의뢰자, 해결사 게시물 리스트
	List<BoardVO> list(String category);
	//관리자 페이지 의뢰자, 해결사 게시물 리스트
	List<BoardVO> adminlist(String category);
	//메인화면 추천리스트
	List<BoardVO> list(String category, String location);
	//2)검색어 없는 게시글페이징
	List<BoardVO> list( int startRec, int endRec);	
	//3)검색어 있는 게시글검색(요청페이지, 검색유형, 검색어)
	List<BoardVO> list(
			String reqPage, 
			String searchType,
			String keyword,
			String bcategory,
			Map<String, Object> detailCond);
	
	//페이지 제어
	PageCriteria getPageCriteria(
			String reqPage,
			String searchType,
			String keyword,
			String bcategory,
			Map<String, Object> detailCond);


	//첨부파일조회
	BoardFileVO fileView(String fid);	

	//매칭 되지 않은 글 조회
	List<BoardVO> listNotMatched(String boardCategory, String bid);

	//지원된 글 조회
	List<BoardVO> listApplied(String boardCategory, String bid);
	
	//승인된 글 조회
	List<BoardVO> listPermitted(String boardCategory, String bid);
	
	//나의 신청 조회
	List<BoardVO> queryList(BoardVO boardVO);
		
	//게시글에 대한 지원과 지원철회, 지원 거절
	int application(BoardVO boardVO);
		
	//지원에 대한 승낙
	int permission(String bnum);
	
	//게시글 완료
	int boardCompletion(String bnum);	
	
	//게시글 수정
	int modify(BoardVO boardVO);
	
	//게시글 삭제
	int delete(String bnum);
	
	//첨부파일1건 삭제
	 int fileDelete(String fid);

}


















