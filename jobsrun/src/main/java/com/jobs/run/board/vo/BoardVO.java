package com.jobs.run.board.vo;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Entity;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Entity
@Data
public class BoardVO {

	private static final Logger logger = LoggerFactory.getLogger(BoardVO.class);

	private long bnum; // BNUM NOT NULL NUMBER(10)
	@Valid
	private BoardCategoryVO boardCategoryVO;
	private String bbcid;
	private String blocation; // BLOCATION VARCHAR2(100 BYTE)
	private String bid; // BID NOT NULL VARCHAR2(40)
	private String bnickname; // BNICKNAME NOT NULL VARCHAR2(30)
	// BGENDER VARCHAR2(30 BYTE)
	@Size(min = 4, max = 50, message = "제목은 4~50자 까지 입력 가능합니다!")
	private String btitle; // BTITLE NOT NULL VARCHAR2(150)

	@NotNull(message = "내용을 입력바랍니다!!")
	@Size(min = 4, message = "내용은 최소4자 이상 입력 바랍니다.!")
	private String bcontent; // BCONTENT NOT NULL CLOB

	@JsonFormat(pattern = "yyyy-MM-dd")
	private Timestamp bcdate; // BCDATE NOT NULL TIMESTAMP(6)
	private Timestamp budate; // BUDATE TIMESTAMP(6)

//	@JsonFormat(pattern = "yyyy-MM-dd'T'hh:mm")

	@JsonFormat(pattern = "yyyy-mm-dd hh:mm:ss")
	private Timestamp sdatetime; // STIME TIMESTAMP(6)
	@JsonFormat(pattern = "yyyy-mm-dd")
	private String sdate; // 시작 날짜
	@JsonFormat(pattern = "hh:mm:ss")
	private String stime; // 시작 시간

	// 글작성시: sdatetime 문자열 결합
	public String combineDatetime() {
		return sdate + " " + stime + ":00";
	}
	// 글수정시:sdatetime 문자열 결합 (수정시에 :00 이 중복되어 빼버림)
	public String mcombineDatetime() {
		return sdate + " " + stime;
	}

	// sdatetime 문자열 분리
	public String[] splitDatetime() {
		return sdatetime.toString().split(" ");
	}

	private String job; // JOB VARCHAR2(30 BYTE)
	private Long duration; // TIME VARCHAR2(30 BYTE)
	private Long payment; // PAYMENT VARCHAR2(30 BYTE) @NotNull

//	private String duration; 	//TIME	VARCHAR2(30 BYTE)
//	private String payment; 	//PAYMENT	VARCHAR2(30 BYTE)	@NotNull
	private int bhit; // BHIT NOT NULL NUMBER(5)
	private int bstatus; //BSTATUS NUMBER(10)
	private String bapplication;//BAPPLICATION VARCHAR(100 BYTE)
	private String latitude; //위도
	private String longitude;
	// 첨부파일
	private List<MultipartFile> bfiles;

}
