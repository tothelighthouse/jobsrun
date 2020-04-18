package com.jobs.run.common;

import lombok.Data;

@Data
public class Code {
	private String code;
	private String label;
	
	public Code(String code, String label) {
		super();
		this.code = code;
		this.label = label;
	}
}
