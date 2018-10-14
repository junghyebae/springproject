package com.som.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.som.project.dao.UserDao;
import com.som.project.model.UserDto;
import com.som.project.service.UserService;

@Service
public class UserService {
	
	@Autowired
	private UserDao userdao;

	public UserDto login(UserDto dto) throws Exception {
		return (UserDto) userdao.login(dto);
	}
	
	public boolean regiIdCheck(String id) {
		String check = userdao.regiIdCheck(id);
		if(check != null ) {
			return false;
		}	
		return true; 
	}
	
	public UserDto regiAf(UserDto dto) throws Exception{
		int i = userdao.regiAf(dto);
		if(i == 1) {
			return userdao.login(dto);
		}
		return null;
	}
}
