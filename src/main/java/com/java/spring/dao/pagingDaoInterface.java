package com.java.spring.dao;

import java.util.HashMap;
import java.util.List;

public interface pagingDaoInterface {
	public List<HashMap<String, Object>> select(HashMap<String, Object> param);
	public HashMap<String, Object> totCnt();
}
