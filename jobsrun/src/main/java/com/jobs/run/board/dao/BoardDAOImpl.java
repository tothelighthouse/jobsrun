package com.jobs.run.board.dao;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.BiFunction;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.jobs.run.board.vo.BoardCategoryVO;
import com.jobs.run.board.vo.BoardFileVO;
import com.jobs.run.board.vo.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	private static final Logger logger = LoggerFactory.getLogger(BoardDAOImpl.class);
	@Inject
	SqlSession sqlSession;
	
	//카테고리 읽어오기
	@Override
	public List<BoardCategoryVO> getCategory() {
		return sqlSession.selectList("mappers.BoardDAO-mapper.getCategory");
	}
	
	//게시글 보기
	@Override
	public BoardVO view(String bnum) {
		return sqlSession.selectOne("mappers.BoardDAO-mapper.view",Long.valueOf(bnum));
	}

	
	//게시글목록
	//1)전체
	@Override
	public List<BoardVO> list() {
		logger.info("BoardDAOImpl 실행!!!");
		List<BoardVO> list = sqlSession.selectList("mappers.BoardDAO-mapper.list");
		return list;
	}
	
	@Override
	public List<BoardVO> list(String category) {
		logger.info("BoardDAOImpl 실행!!!");
		List<BoardVO> list = sqlSession.selectList("mappers.BoardDAO-mapper.mainlist", category);
		return list;
	}
	
	//로그인 사용자의 모든 작성글의 지역 검색
		@Override
		public List<BoardVO> userwritelist(BoardVO boardVO) {
			Map<String, Object> map = new HashMap<>();
			map.put("bid", boardVO.getBid());
			map.put("bbcid", boardVO.getBbcid());
			return sqlSession.selectList("mappers.BoardDAO-mapper.userwritelist", map);
		}
		
		//로그인 사용자의 위치 기반 게시글 목록 리턴
		@Override
		public List<BoardVO> boardlistAll(
				int startRec, 
				int endRec, 
				String searchType, 
				String keyword, 
				String bcategory,
				List<String> locationList) {
			logger.info("로그인 사용자의 위치 기반 게시글 목록 리턴 실행");
			Map<String, Object> map = new HashMap<>();
			map.put("startRec", startRec);
			map.put("endRec", endRec);
			map.put("searchType",searchType);
			map.put("bcategory",bcategory);
			map.put("list", locationList);
			logger.info("map.toString() 값:" + map.toString());
			logger.info("locationList.toString() 값:" + locationList.toString());
			logger.info("sqlSession.selectList(\"mappers.BoardDAO-mapper.boardlistAll\", map).toString() 리턴 값:" + sqlSession.selectList("mappers.BoardDAO-mapper.boardlistAll", map).toString());
			return sqlSession.selectList("mappers.BoardDAO-mapper.boardlistAll", map);
		}
		
		//로그인 사용자의 위치 기반 게시글 목록 총 개수
		@Override
		public int boardlistAllCount(
				String searchType,
				String keyword, 
				String bcategory, 
				List<String> locationList) {
			logger.info("keyword :" + keyword);
			Map<String,Object> map = new HashMap<>();
			map.put("searchType",searchType);
			if(keyword != null) {
				map.put("list",Arrays.asList(keyword.split("\\s+")));
			}
			map.put("bcategory",bcategory);
			map.put("list", locationList);
			
			map.put("andor","or");
			logger.info("keyword2 :" + map.get("list"));
			logger.info("sqlSession.selectOne(\"mappers.BoardDAO-mapper.boardlistAllCount\",map)" 
			+ sqlSession.selectOne("mappers.BoardDAO-mapper.boardlistAllCount",map));
			return sqlSession.selectOne("mappers.BoardDAO-mapper.boardlistAllCount",map);
		}
		
		
	//메인화면 추천리스트
	@Override
	public List<BoardVO> list(String category, String location) {
		logger.info("BoardDAOImpl 실행!!!");
		Map<String,Object> map = new HashMap<>();
		map.put("category", category);
		map.put("location", location);	
		List<BoardVO> list = sqlSession.selectList("mappers.BoardDAO-mapper.recommendlist", map);
		
		
		return list;
	}
	//2)검색어 없는 게시글페이징
	@Override
	public List<BoardVO> list(int startRec, int endRec) {
		Map<String,Object> map = new HashMap<>();
		map.put("startRec", startRec);
		map.put("endRec", endRec);
		return sqlSession.selectList("mappers.BoardDAO-mapper.list2", map);
	}
	@Override
	public List<BoardFileVO> fileViews(String bnum) {
		return sqlSession.selectList("mappers.BoardDAO-mapper.fileViews", Long.valueOf(bnum));
	}
	
	@Override
	public int updateHit(String bnum) {
		return sqlSession.update("mappers.BoardDAO-mapper.updateHit", Long.valueOf(bnum));
	}	

	//첨부파일조회
	@Override
	public BoardFileVO fileView(String fid) {
		return sqlSession.selectOne("mappers.BoardDAO-mapper.fileView", Long.valueOf(fid));
	}

	//3)검색어 있는 게시글검색(전체,제목,내용,작성자ID,별칭)
		@Override
		public List<BoardVO> list(
				int startRec, 
				int endRec, 
				String searchType, 
				String keyword, 
				String bcategory,
				Map<String, Object> detailCond) {
			Map<String,Object> map = new HashMap<>();
			map.put("startRec", startRec);
			map.put("endRec", endRec);
			map.put("searchType",searchType);
			map.put("bcategory",bcategory);
			
			if(keyword != null) {
				map.put("list",Arrays.asList(keyword.split("\\s+")));
			}
			//detailCond와 map을 병합
			if(detailCond !=null) {
				BiFunction<Object, Object, Object> identity = (v1, v2) -> v1;
				detailCond.forEach((key,value) -> map.merge(key, value, identity));
			}
			map.put("andor","or");
			logger.info(map.toString());
			return sqlSession.selectList("mappers.BoardDAO-mapper.list3", map);
		}
		
		//총 레코드수
		@Override
		public int totalRecordCount(
				String searchType,
				String keyword, 
				String bcategory, 
				Map<String, Object> detailCond) {
			logger.info("keyword :" + keyword);
			Map<String,Object> map = new HashMap<>();
			map.put("searchType",searchType);
			map.put("bcategory",bcategory);
			
			logger.info("bcategory:" + bcategory);
			//detailCond와 map을 병합
			if(detailCond !=null) {
				BiFunction<Object, Object, Object> identity = (v1, v2) -> v1;
				detailCond.forEach((key,value) -> map.merge(key, value, identity));
			}
			
			if(keyword != null) {
				map.put("list",Arrays.asList(keyword.split("\\s+")));
			}
			map.put("andor","or");
			logger.info("keyword2 :" + map.get("list"));
			return sqlSession.selectOne("mappers.BoardDAO-mapper.totalRecordCount",map);
		}
	
	//매칭되지 않은 글 조회
	@Override
	public List<BoardVO> listNotMatched(String boardCategory, String bid) {
		Map<String, Object> map = new HashMap<>();
		map.put("bbcid", boardCategory);
		map.put("bid", bid);
		return sqlSession.selectList("mappers.BoardDAO-mapper.listNotMatched",map);
	}
	//지원된 글 조회
	@Override
	public List<BoardVO> listApplied(String boardCategory, String bid) {
		Map<String, Object> map = new HashMap<>();
		map.put("bbcid", boardCategory);
		map.put("bid", bid);
		return sqlSession.selectList("mappers.BoardDAO-mapper.listApplied",map);
	}
	//승인된 글 조회
	@Override
	public List<BoardVO> listPermitted(String boardCategory, String bid) {
		Map<String, Object> map = new HashMap<>();
		map.put("bbcid", boardCategory);
		map.put("bid", bid);
		return sqlSession.selectList("mappers.BoardDAO-mapper.listPermitted",map);
	}

	//나의 신청 조회
	@Override
	public List<BoardVO> queryList(BoardVO boardVO) {
		return sqlSession.selectList("mappers.BoardDAO-mapper.queryList",boardVO);
	}
		
	//게시글 작성
	@Override
	public int write(BoardVO boardVO) {
		return sqlSession.insert("mappers.BoardDAO-mapper.write",boardVO);
	}
	//첨부파일 저장
	@Override
	public int fileWrite(BoardFileVO boardFileVO) {
		return sqlSession.insert("mappers.BoardDAO-mapper.fileWrite",boardFileVO);
	}
	//게시글에 대한 지원과 지원철회, 지원 거절
	@Override
	public int application(BoardVO boardVO) {
		return sqlSession.update("mappers.BoardDAO-mapper.application",boardVO);
	}
	//지원에 대한 승낙
	@Override
	public int permission(String bnum) {
		return sqlSession.update("mappers.BoardDAO-mapper.permission",Long.valueOf(bnum));
	}
	
	//게시글 완료
	@Override
	public int boardCompletion(String bnum) {
		return sqlSession.update("mappers.BoardDAO-mapper.boardCompletion",Long.valueOf(bnum));
	}
	//게시글수정
	@Override
	public int modify(BoardVO boardVO) {
		return sqlSession.update("mappers.BoardDAO-mapper.modify", boardVO);
	}

	//게시글삭제
	@Override
	public int delete(String bnum) {
		return sqlSession.delete("mappers.BoardDAO-mapper.delete", Long.valueOf(bnum));
	}
	//첨부파일 1건 삭제
	@Override
	public int fileDelete(String fid) {
		return sqlSession.delete("mappers.BoardDAO-mapper.fileDelete", Long.valueOf(fid));
	}
	//게시글 첨부파일 전체 삭제
	@Override
	public int filesDelete(String bnum) {
		return sqlSession.delete("mappers.BoardDAO-mapper.filesDelete", Long.valueOf(bnum));
	}

	//관리자 페이지 게시물 리스트
	@Override
	public List<BoardVO> adminlist(String category) {
		List<BoardVO> adminlist = sqlSession.selectList("mappers.BoardDAO-mapper.adminlist", category);
		return adminlist;
	}

	

	
	

}
















