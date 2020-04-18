package com.jobs.run.csboard.dao;

import org.springframework.stereotype.Repository;

import com.jobs.run.board.vo.BoardCategoryVO;
import com.jobs.run.csboard.vo.CSBoardVO;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Repository
public class CSBoardDAOImpl implements CSBoardDAO {
	private static Logger logger 
	= LoggerFactory.getLogger(CSBoardDAOImpl.class);
	
	@Inject
	SqlSessionTemplate sqlSession;

	//게시글작성
	@Override
	public int write(CSBoardVO csboardVO) {
		return sqlSession.insert("mappers.CSBoardDAO-mapper.write", csboardVO);
	}
	
	//게시글수정
	@Override
	public int modify(CSBoardVO csboardVO) {
		return sqlSession.update("mappers.CSBoardDAO-mapper.modify", csboardVO);
	}

	//게시글삭제
	@Override
	public int delete(String csbnum) {
		return sqlSession.delete("mappers.CSBoardDAO-mapper.delete", Long.valueOf(csbnum));
	}	
	
	//게시글보기
	@Override
	public CSBoardVO view(String csbnum) {
		return sqlSession.selectOne("mappers.CSBoardDAO-mapper.view", Long.valueOf(csbnum));
	}

	
	//1)전체
	@Override
	public List<CSBoardVO> list() {
		return sqlSession.selectList("mappers.CSBoardDAO-mapper.list");
	}
	
	//2)검색어 없는 게시글페이징
	@Override
	public List<CSBoardVO> list(int startRec, int endRec) {
		Map<String,Object> map = new HashMap<>();
		map.put("startRec", startRec);
		map.put("endRec", endRec);
		return sqlSession.selectList("mappers.CSBoardDAO-mapper.list2", map);
	}
	
	//3)검색어 있는 게시글검색
	@Override
	public List<CSBoardVO> list(int startRec, int endRec, String searchType, String keyword) {
		Map<String,Object> map = new HashMap<>();
		map.put("startRec", startRec);
		map.put("endRec", endRec);
		map.put("searchType",searchType);
		if(keyword != null) {
			map.put("list",Arrays.asList(keyword.split("\\s+")));
		}

		logger.info("map = " + map);
		return sqlSession.selectList("mappers.CSBoardDAO-mapper.list3", map);
	}
	
	//총 레코드수
	@Override
	public int totalRecordCount(String searchType, String keyword) {
		Map<String,Object> map = new HashMap<>();
		map.put("searchType",searchType);
		map.put("keyword",keyword);
		if(keyword != null) {
			map.put("list",Arrays.asList(keyword.split("\\s+")));
		}
		return sqlSession.selectOne("mappers.CSBoardDAO-mapper.totalRecordCount",map);
	}
	
	//게시글답글작성
	@Override
	public int reply(CSBoardVO csboardVO) {
		//1) 이전답글 step 업데이트
		updateStep(csboardVO.getCsbgroup(), csboardVO.getCsbstep());
		//2) 답글달기
		return sqlSession.insert("mappers.CSBoardDAO-mapper.reply", csboardVO);
	}
	
	//이전 답글 step 업데이트
	private int updateStep(int csbgroup, int csbstep) {
		Map<String,Object> map = new HashMap();
		map.put("csbgroup", csbgroup);
		map.put("csbstep", csbstep);
		return sqlSession.update("mappers.CSBoardDAO-mapper.updateStep", map);
	}
}
