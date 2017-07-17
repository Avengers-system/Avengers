package com.avengers.student.HelpDesk.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.avengers.db.dto.CommandMap;
import com.avengers.student.HelpDesk.service.StudentHelpDeskService;


@Controller
public class StudentHelpDeskController {
	
	@Autowired
	public StudentHelpDeskService service;
	
	@RequestMapping("/student/helpDesk/studentFAQList")
	public ModelAndView openBoardList(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("/student/helpDesk/studentFAQList");
	    return mv;
	}
	 
	@RequestMapping("/student/helpDesk/openFAQList")
	public ModelAndView selectBoardList(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("jsonView");
	    List<Map<String,Object>> list = service.selectBoardList(commandMap.getMap());
	    mv.addObject("list", list);
	    if(list.size() > 0){
	        mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
	    }
	    else{
	        mv.addObject("TOTAL", 0);
	    }
	     
	    return mv;
	}

	

}
