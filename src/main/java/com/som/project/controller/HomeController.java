package com.som.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.som.project.model.UserDto;
import com.som.project.service.UserService;

@Controller
public class HomeController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() throws Exception {
		return "main/main";
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		return "main/login";
	}

	@ResponseBody
	@RequestMapping(value = "loginAf", produces = "application/String; charset=utf-8", method = RequestMethod.POST )
	public String loginAf(UserDto dto, HttpServletRequest req) {

		UserDto login = null;
		try {
			login = userService.login(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (login != null) {
			req.getSession().setAttribute("login", login);
			return "로그인 성공";
		}else {
			return "로그인 실패";
		}
	}

	@RequestMapping(value = "logout")
	public String logout(Model model, HttpServletRequest req) {
		req.getSession().invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value = "regi")
	public String regi() {
		return "register/regi";
	}
	
	@ResponseBody
	@RequestMapping(value = "regiIdCheck", method = RequestMethod.POST )
	public boolean regiIdCheck(String id) {
		return userService.regiIdCheck(id);
	}
	
	@ResponseBody
	@RequestMapping(value = "regiAf", method = RequestMethod.POST )
	public boolean regiAf(UserDto dto, HttpServletRequest req) throws Exception {
		UserDto login = userService.regiAf(dto);
		if(login != null) {
			req.getSession().setAttribute("login", login);
			return true;
		}else {
			return false;
		}
	}
	
}
