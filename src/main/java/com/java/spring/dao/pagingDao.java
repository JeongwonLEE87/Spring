package com.java.spring.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class pagingDao implements pagingDaoInterface {

	@Resource(name="sqlSession")
	SqlSession session;
	
	@Override
	public List<HashMap<String, Object>> select(HashMap<String, Object> param) {
		return session.selectList("paging.select", param);
	}

}
