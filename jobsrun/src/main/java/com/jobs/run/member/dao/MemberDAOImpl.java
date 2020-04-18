package com.jobs.run.member.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.jobs.run.member.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	private static final Logger logger = LoggerFactory.getLogger(MemberDAOImpl.class);

	@Inject
	private SqlSession sqlSession;

	// 회원등록
	@Override
	public int joinMember(MemberVO memberVO) {
		logger.info("MemberDAOImplXML.joinMember(MemberVO memberVO) 호출됨!");
		return sqlSession.insert("mappers.MemberDAO-mapper.joinMember", memberVO);
	}

	// 아이디 중복체크
	public int idCheck(String id) {
		System.out.println("===> Mybatis로 idCheck");
		int result = sqlSession.selectOne("mappers.MemberDAO-mapper.idCheck", id);
		return result;
	}

	// 로그인
	@Override
	public MemberVO loginMember(String id, String pw) {
		logger.info("MemberDAOImplXML.loginMember(String id, String pw) 호출됨!");
		MemberVO memberVO = new MemberVO();
		memberVO.setId(id);
		memberVO.setPw(pw);
		return sqlSession.selectOne("mappers.MemberDAO-mapper.loginMember", memberVO);
	}

	// 회원 전체조회
	@Override
	public List<MemberVO> selectAllMember() {
		logger.info("MemberDAOImplXML.selectAllMember(MemberVO memberVO) 호출됨!");
		return sqlSession.selectList("mappers.MemberDAO-mapper.selectAllMember");
		// selectList에서 첫번째꺼 사용(string statement
	}

	// 회원 개별조회
	@Override
	public MemberVO selectMember(String id) {
		logger.info("MemberDAOImplXML.selectMember(String id) 호출됨!");
		return sqlSession.selectOne("mappers.MemberDAO-mapper.selectMember", id);
		// selectOne에서 파라미터값받는 메소드사용
	}
	
	//회원수정
	@Override
	public int modifyMember(MemberVO memberVO) {
		logger.info("MemberDAOImplXML.joinMember(MemberVO memberVO) 호출됨!");
		return sqlSession.update("mappers.MemberDAO-mapper.modifyMember", memberVO);
	}
	
	//회원탈퇴
	@Override
	public int outMember(String id, String pw) { 
		logger.info("MemberDAOImplXML.outMember(String id, String pw) 호출됨!");
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		return sqlSession.delete("mappers.MemberDAO-mapper.outMember", map);
	}
	
	//아이디 찾기
	@Override
	public MemberVO findID(String tel, Date birth) {
		logger.info("MemberDAOImplXML.findID(String tel, Date birth) 호출됨!");
		MemberVO memberVO = new MemberVO();
		memberVO.setTel(tel);
		memberVO.setBirth(birth);
		return sqlSession.selectOne("mappers.MemberDAO-mapper.findID",memberVO);
	}
		
	//비밀번호 변경
	@Override
	public int changePW(String id,String pw) {
		logger.info("MemberDAOImplXML.changePW(String id, String pw) 호출됨!");
		MemberVO memberVO = new MemberVO();
		memberVO.setPw(pw);
		memberVO.setId(id);
		return sqlSession.update("mappers.MemberDAO-mapper.changePW", memberVO);
	}
	
	//사진 삭제
	@Override
	public int fileDelete(String id) {
		return sqlSession.delete("mappers.MemberDAO-mapper.fileDelete",id);
		}
	
	//이메일 인증
	@Override
	public int emailcheck(String id) {
		return sqlSession.update("mappers.MemberDAO-mapper.emailcheck",id);
	}

	//비밀번호 찾기 후 임시비밀번호로 변경
	@Override
	public int findpwupdate(String id, String pw) {
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		return sqlSession.update("mappers.MemberDAO-mapper.updatepw",map);
	}

	//회원삭제

	
	 @Override public int deleteMember(String id) {
	  logger.info("MemberDAOImplXML.deleteMember(MemberVO memberVO) 호출됨!"); return
	  sqlSession.delete("mappers.MemberDAO-mapper.deleteMember", id); }
	 
	  //회원삭제(메세지)
	 
	  @Override public int rdeleteMember(String id) {
	  logger.info("MemberDAOImplXML.rdeleteMember(String id) 호출됨!"); return
	  sqlSession.delete("mappers.MemberDAO-mapper.rdeleteMember", id); }
	 
}
