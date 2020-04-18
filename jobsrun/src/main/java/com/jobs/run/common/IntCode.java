package com.jobs.run.common;

import lombok.Data;

@Data
public class IntCode {
//	private Integer code;
	private int code;
	private String label;
	
	public IntCode(int code, String label) {
		super();
		this.code = code;
		this.label = label;
	}
}