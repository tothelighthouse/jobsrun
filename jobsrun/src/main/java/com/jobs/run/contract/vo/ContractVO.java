package com.jobs.run.contract.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ContractVO {
	private long contnum; //CONTNUM	NUMBER(10,0)
	private long cbnum; //CBNUM	NUMBER(10,0)
	private String clientID; //CLIENTID	VARCHAR2(100 BYTE)
	private String shooterID;//SHOOTERID	VARCHAR2(100 BYTE)
	private long camount; //CAMOUNT	NUMBER(10,0)
	private long cstatus; //CSTATUS	NUMBER(10,0)
	private Timestamp ccdate;
	private Timestamp cudate;
}
