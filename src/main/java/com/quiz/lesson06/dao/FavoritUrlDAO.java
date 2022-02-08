package com.quiz.lesson06.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson06.model.FavoritUrl;

@Repository
public interface FavoritUrlDAO {

	public void insertFavoritUrl(
			@Param("name") String name, 
			@Param("url") String url);
	
	public List<FavoritUrl> selectFavoritUrl();
}
