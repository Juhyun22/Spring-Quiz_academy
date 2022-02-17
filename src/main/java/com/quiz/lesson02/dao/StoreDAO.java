package com.quiz.lesson02.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson02.model.Store;

@Repository
public interface StoreDAO {
	public List<Store> selectStoreList();
	
	public Store selectStoreListById(@Param("id") int id);
}
