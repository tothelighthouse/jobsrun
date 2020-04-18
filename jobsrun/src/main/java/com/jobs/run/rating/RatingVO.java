package com.jobs.run.rating;

import java.sql.Date;

import javax.persistence.Entity;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Entity
@Data
public class RatingVO {
	int num;		//	NUM      NOT NULL NUMBER(10)   
	String rater;	//	RATER    NOT NULL VARCHAR2(30) 
	String ratee;	//	RECEIVER NOT NULL VARCHAR2(30) 
	String rates;	//	RATES    NOT NULL NUMBER(10)   
	String detail;	//	DETAIL			  CLOB         
	Date rdate;		//	RDATE    NOT NULL TIMESTAMP(6)
	//회원 사진
	private MultipartFile file;
	private byte[] pic;
	private String fname;
	private long fsize;
}
