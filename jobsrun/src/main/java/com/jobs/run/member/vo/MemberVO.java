package com.jobs.run.member.vo;

import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.validation.constraints.Pattern;

import org.springframework.web.multipart.MultipartFile;

import com.sun.istack.NotNull;

import lombok.Data;

@Entity
@Data
public class MemberVO {
	private String id;
	private String pw;
	private String tel;
	private String nickname;
	private String gender;
	private Date birth;
	private String region;
	private Timestamp cdate;
	private Timestamp udate;
	private long balance;
	private String clientLocation;
	private String shooterLocation;
	private int emailcheck; 
	private String rates;
	
	//회원 사진
	private MultipartFile file;
	private byte[] pic;
	private String fname;
	private long fsize;

	// 고액 추천여부
	private int moneyrecommend;
}
