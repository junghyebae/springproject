package com.som.project.model;

import lombok.Data;

@Data
public class UserDto {
	private String id;
	private String password;
	private String name;
	private String email;
	private String crate_time;

}
