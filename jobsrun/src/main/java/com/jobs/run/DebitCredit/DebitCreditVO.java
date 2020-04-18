package com.jobs.run.DebitCredit;

import java.sql.Timestamp;

import javax.persistence.Entity;

import lombok.Data;

@Entity
@Data
public class DebitCreditVO {
	private int num;			//	NUM     NOT NULL NUMBER(10)   
	private String id;			//	ID      NOT NULL VARCHAR2(30) 
	private int amount;			//	AMOUNT  NOT NULL NUMBER(10)   
	private String via;			//	VIA     NOT NULL VARCHAR2(30)
	private String detail;		// 	DETAIL	NOT NULL VARCHAR2(30)
	private Timestamp tdate;	//	TDATE   NOT NULL TIMESTAMP(6)
	private long contnum;       //  CONTNUM NOT NULL NUMBER(10)
}
