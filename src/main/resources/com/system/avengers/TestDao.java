package com.system.avengers;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class TestDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<TestVO> getTestList(){
		return sqlSession.selectList("getTestList");
	}
	public TestVO getTest(TestVO vo){
		return (TestVO)sqlSession.selectOne("getTest",vo);
	}
}
