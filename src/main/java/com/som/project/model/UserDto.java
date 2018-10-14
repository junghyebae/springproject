package com.som.project.model;

public class UserDto {
	private String id;
	private String password;
	private String name;
	private String email;
	private String crate_time;
	public UserDto() {
		super();
	}
	public UserDto(String id, String password, String name, String email, String crate_time) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.crate_time = crate_time;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCrate_time() {
		return crate_time;
	}
	public void setCrate_time(String crate_time) {
		this.crate_time = crate_time;
	}
	@Override
	public String toString() {
		return "UserDto [id=" + id + ", password=" + password + ", name=" + name + ", email=" + email + ", crate_time="
				+ crate_time + "]";
	}
}
