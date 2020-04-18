package com.jobs.run.board.vo;

import javax.persistence.Entity;
import javax.validation.constraints.Positive;

import lombok.Data;
@Entity
@Data
public class BoardCategoryVO {
	@Positive(message = "분류를 선택해 주세요")
	private long bcid;//	BCID   NOT NULL NUMBER(10)   
	private String bcname;//	BCNAME NOT NULL VARCHAR2(100) 

}