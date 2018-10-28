package com.som.project.model;

import lombok.Data;

@Data
public class BbsDto {
	private String seq;
	private String id;
	private String title;
	private String content;
	private String readcount;
	private String wdate;
	private String status;
}
