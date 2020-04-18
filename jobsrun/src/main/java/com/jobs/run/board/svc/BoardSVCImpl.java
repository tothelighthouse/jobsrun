package com.jobs.run.board.svc;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jobs.run.board.dao.BoardDAO;
import com.jobs.run.board.vo.BoardCategoryVO;
import com.jobs.run.board.vo.BoardFileVO;
import com.jobs.run.board.vo.BoardVO;
import com.jobs.run.common.FindCriteria;
import com.jobs.run.common.PageCriteria;
import com.jobs.run.common.RecordCriteria;

@Service
public class BoardSVCImpl implements BoardSVC {
	private static final Logger logger = LoggerFactory.getLogger(BoardSVCImpl.class);
	
	@Inject
	BoardDAO boardDAO;

	@Override
	public List<BoardCategoryVO> getCategory() {
		return boardDAO.getCategory();
	}
	
	//게시글보기
	@Transactional
	@Override
	public Map<String,Object> view(String bnum) {
		//1) 게시글 가져오기
		BoardVO boardVO = boardDAO.view(bnum);
		//2) 첨부파일 가져오기
		List<BoardFileVO> files = boardDAO.fileViews(bnum);
		//3) 조회수 +1증가
		boardDAO.updateHit(bnum);
		
		Map<String,Object> map = new HashMap<>();
		map.put("board", boardVO);
		if(files != null && files.size() > 0) {
			map.put("files", files);
		}
		return map;
	}
	//게시글 작성
	@Transactional
	@Override
	public int write(BoardVO boardVO) {
		//1) 게시글 작성
		int cnt = boardDAO.write(boardVO);
		
		//2) 첨부파일 있는 경우
		logger.info("첨부개수 :" + boardVO.getBfiles());
		logger.info("if 문 이전 첨부파일 내역 : " + boardVO.getBfiles().toString() );
		if(boardVO.getBfiles()!=null && boardVO.getBfiles().size() > 0) {// 크기가 0인 파일이 전달 되지 않도록 체크
			for(MultipartFile file : boardVO.getBfiles()) {
				logger.info("첨부파일 내역 :" + file.toString());
			}
			fileWrite(boardVO.getBfiles(), boardVO.getBnum());//bnum 가져오기 => mybatis : selectkey 사용
		}
		return cnt;
	}
	
	//첨부파일 저장
	private void fileWrite(List<MultipartFile> files, long bnum) {
		for(MultipartFile file : files) {
			try {
				logger.info("파일 첨부:" + file.getOriginalFilename());
				BoardFileVO boardFileVO = new BoardFileVO();
				//게시글 번호
				boardFileVO.setBnum(bnum);
				//첨부파일 명
				boardFileVO.setFname(file.getOriginalFilename());
				//첨부파일 크기
				boardFileVO.setFsize(file.getSize());
				//첨부파일 타입
				boardFileVO.setFtype(file.getContentType());
				//첨부파일
				boardFileVO.setFdata(file.getBytes());
				logger.info("boardFileVO 상세 내역: " + boardFileVO.toString());
				//첨부파일 저장
				if(file.getSize() > 0) {
					boardDAO.fileWrite(boardFileVO);
				}
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	//게시글목록
	//1)전체
	@Override
	public List<BoardVO> list() {
		return boardDAO.list();
	}
	
	@Override
	public List<BoardVO> list(String category) {
		return boardDAO.list(category);
	}
	
	@Override
	public List<BoardVO> adminlist(String category) {
		return boardDAO.adminlist(category);
	}
	

	@Override
	public List<BoardVO> list(String category,String location) {
		return boardDAO.list(category, location);
	}
	//특정 사용자의 모든 작성글의 지역 검색
		@Override
		public List<BoardVO> userwritelist(BoardVO boardVO) {
			return boardDAO.userwritelist(boardVO);
		}
		//로그인 사용자의 위치 기반 게시글 목록 리턴
		@Override
		public List<BoardVO> boardlistAll(
				String reqPage,
				String searchType,
				String keyword,
				String bcategory,
				List<String> locationList) {	
			logger.info("bcategory 값 in BoardSVCImpl:" + bcategory); 
			int l_reqPage = 0;
			
			//요청 페이지 정보가 없으면 1로 초기화
			if(reqPage == null || reqPage.trim().isEmpty()) {
				l_reqPage =  1;
			}else {
				l_reqPage = Integer.parseInt(reqPage);
			}
			
			RecordCriteria recordCriteria = new RecordCriteria(l_reqPage);
			logger.info("BoardSVCImpl 에 넘어온 locationList값:"+ locationList);
			return boardDAO.boardlistAll(
					recordCriteria.getStartRec(), 
					recordCriteria.getEndRec(), 
					searchType, keyword, bcategory, locationList);
		}
				
		//로그인 사용자의 위치 기반 게시글 페이지 제어
		@Override
		public PageCriteria boardlistAllgetPageCriteria(
				String reqPage, 
				String searchType, 
				String keyword,
				String bcategory,
				List<String> locationList) {
			logger.info("boardSVCImpl 에서 넘겨받은  bcategory 값:" + bcategory);
			
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
			logger.info("boardSVCImpl 에서  totalRecordCount로 넘겨주는 bcategory 값:" + bcategory);
			totalRec = boardDAO.boardlistAllCount(searchType,keyword, bcategory, locationList);
			
			fc = new FindCriteria(l_reqPage, searchType, keyword);
			pc = new PageCriteria(fc, totalRec);
			logger.info("totalRec:"+totalRec, searchType, keyword);
			logger.info("fc:"+fc.toString());
			logger.info("rc:"+((RecordCriteria)fc).toString());
			logger.info("pc:"+pc.toString());
			return pc;
		}
	//2)검색어 없는 게시글페이징
	@Override
	public List<BoardVO> list(int startRec, int endRec) {
		// TODO Auto-generated method stub
		return null;
	}
	//3)검색어 있는 게시글검색(요청페이지,검색유형,검색어)
		@Override
		public List<BoardVO> list(
				String reqPage,
				String searchType,
				String keyword,
				String bcategory,
				Map<String, Object> detailCond) {	
			logger.info("bcategory 값 in BoardSVCImpl:" + bcategory); 
			int l_reqPage = 0;
			
			//요청 페이지 정보가 없으면 1로 초기화
			if(reqPage == null || reqPage.trim().isEmpty()) {
				l_reqPage =  1;
			}else {
				l_reqPage = Integer.parseInt(reqPage);
			}
			
			RecordCriteria recordCriteria = new RecordCriteria(l_reqPage);
			
			return boardDAO.list(
					recordCriteria.getStartRec(), 
					recordCriteria.getEndRec(), 
					searchType, keyword, bcategory, detailCond);
		}
		
		//페이지 제어
		@Override
		public PageCriteria getPageCriteria(
				String reqPage, 
				String searchType, 
				String keyword,
				String bcategory,
				Map<String, Object> detailCond) {
			logger.info("boardSVCImpl 에서 넘겨받은  bcategory 값:" + bcategory);
			
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
			logger.info("boardSVCImpl 에서  totalRecordCount로 넘겨주는 bcategory 값:" + bcategory);
			totalRec = boardDAO.totalRecordCount(searchType,keyword, bcategory, detailCond);
			
			fc = new FindCriteria(l_reqPage, searchType, keyword);
			pc = new PageCriteria(fc, totalRec);
			logger.info("totalRec:"+totalRec, searchType, keyword);
			logger.info("fc:"+fc.toString());
			logger.info("rc:"+((RecordCriteria)fc).toString());
			logger.info("pc:"+pc.toString());
			return pc;
		}	
	
	//매칭 되지 않은 글 조회
	@Override
	public List<BoardVO> listNotMatched(String boardCategory, String bid) {
		return boardDAO.listNotMatched(boardCategory, bid);
	}
	
	//지원된 글 조회
	@Override
	public List<BoardVO> listApplied(String boardCategory, String bid) {
		return boardDAO.listApplied(boardCategory, bid);
	}
	
	//승인된 글 조회
	@Override
	public List<BoardVO> listPermitted(String boardCategory, String bid) {
		return boardDAO.listPermitted(boardCategory, bid);
	}

	//나의 신청 조회
	@Override
	public List<BoardVO> queryList(BoardVO boardVO) {
		return boardDAO.queryList(boardVO);
	}
	//게시글에 대한 지원과 지원철회, 지원 거절
	@Override
	public int application(BoardVO boardVO) {
		return boardDAO.application(boardVO);
	}
	//지원에 대한 승낙
	@Override
	public int permission(String bnum) {
		return boardDAO.permission(bnum);
	}
	//게시글 완료
	@Override
	public int boardCompletion(String bnum) {
		return boardDAO.boardCompletion(bnum);
	}
	//게시글수정
	@Transactional
	@Override
	public int modify(BoardVO boardVO) {
		//1) 게시글 수정
		int cnt = boardDAO.modify(boardVO);
		//2) 첨부파일 추가
		if(boardVO.getBfiles() != null && boardVO.getBfiles().size() > 0) {
			fileWrite(boardVO.getBfiles(),boardVO.getBnum());
		}
		return cnt;
	}
	//게시글삭제
	@Transactional
	@Override
	public int delete(String bnum) {
		int cnt = 0;
		boardDAO.filesDelete(bnum);
		cnt = boardDAO.delete(bnum);
		return cnt;
	}
	
	//첨부파일1건 삭제
	@Override
	public int fileDelete(String fid) {
		return boardDAO.fileDelete(fid);
	}

	//첨부파일조회
	@Override
	public BoardFileVO fileView(String fid) {
		return boardDAO.fileView(fid);
	}

	
	
}

















