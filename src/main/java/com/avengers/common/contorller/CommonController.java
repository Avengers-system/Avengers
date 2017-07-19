package com.avengers.common.contorller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {
	
	
	@RequestMapping("/empty/testTop")
	public String testTopPage(){
		return "/empty/testTop";
	}
	
}
