package com.jobs.run.member.svc;

import java.sql.Date;
import java.util.List;

import com.jobs.run.member.vo.MemberVO;

public interface MemberSVC {
	// 회원 등록
	int joinMember(MemberVO memberVO);

	// 아이디 중복 체크
	int idCheck(String id);

	// 로그인
	MemberVO loginMember(String id, String pw);

	// 회원 전체조회
	List<MemberVO> selectAllMember();

	// 회원 개별조회
	MemberVO selectMember(String id);
	
	//회원 수정
	int modifyMember(MemberVO memberVO);
	
	//회원 탈퇴
	int outMember(String id, String pw);
	
	//아이디 찾기
	MemberVO findID(String tel, Date birth);
	
	//비밀번호 변경
	int changePW(String id, String pw);
	
	//사진 삭제
	int fileDelete(String id);
	
	//이메일 인증
    int emailcheck(String id);

    //비밀번호 찾기 후 임시비밀번호로 변경
    int findpwupdate(String id,String pw);
    
	//회원삭제 
    int deleteMember(String id);
	  
	//평점4점이하 삭제 
    int rdeleteMember(String id);
	 
    
}
