package com.system.avengers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestService {

	
	@Autowired
	private TestDao dao;
	
	public List<TestVO> getTestList(){
		return dao.getTestList();
	}
	public TestVO getTest(TestVO vo){
		return dao.getTest(vo);		
	}
}
