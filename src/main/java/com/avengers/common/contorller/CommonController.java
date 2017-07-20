package com.avengers.common.contorller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.Map;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;

import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;



@Controller
public class CommonController {
private static final Logger logger = LoggerFactory.getLogger(CommonController.class);

	

	@RequestMapping(value = "/login", method = RequestMethod.GET)

	public ModelAndView login(

		@RequestParam(value = "error", required = false) String error,

		@RequestParam(value = "logout", required = false) String logout) {

 

		ModelAndView model = new ModelAndView();

	

		if (error != null && logout==null) {

			model.addObject("error", "Invalid username and password!");

		}

 

		if (logout != null) {

			model.addObject("msg", "You've been logged out successfully.");

		}

		model.setViewName("common/commonLogin");

 

		return model;



	}	



}
