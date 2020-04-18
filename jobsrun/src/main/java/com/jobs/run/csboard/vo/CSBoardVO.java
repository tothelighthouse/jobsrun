package com.jobs.run.csboard.vo;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class CSBoardVO {
	private long csbnum;
	private String csbid;				   
	private String csbcontent;	
	private String csbtitle;	
	private Timestamp	csbcdate;			 
	private Timestamp csbudate;			
	private int	csbgroup;						
	private int csbstep;						
	private int csbindent;				
}
