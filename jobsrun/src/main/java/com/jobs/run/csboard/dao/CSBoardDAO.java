package com.jobs.run.csboard.dao;

import java.util.List;

import com.jobs.run.board.vo.BoardCategoryVO;
import com.jobs.run.csboard.vo.CSBoardVO;

public interface CSBoardDAO {

	//게시글작성
	int write(CSBoardVO csboardVO);
	//게시글수정
	int modify(CSBoardVO csboardVO);
	//게시글삭제
	int delete(String csbnum);
	//게시글보기
	CSBoardVO view(String csbnum);
	//1)게시글 목록
	List<CSBoardVO> list();
	//2)검색어 없는 게시글페이징
	List<CSBoardVO> list(int startRec, int endRec);	
	//3)검색어 있는 게시글검색
	List<CSBoardVO> list(int startRec, int endRec, String searchType,String keyword);
	//총 레코드수
	int totalRecordCount(String searchType,String keyword);
	//게시글답글작성
	int reply(CSBoardVO csboardVO);
}
