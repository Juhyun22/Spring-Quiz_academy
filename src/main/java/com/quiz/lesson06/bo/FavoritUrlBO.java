package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.FavoritUrlDAO;
import com.quiz.lesson06.model.FavoritUrl;

@Service
public class FavoritUrlBO {
	
	@Autowired
	private FavoritUrlDAO favoritUrlDAO;
	
	public void addFavoritUrl(String name, String url) {
		favoritUrlDAO.insertFavoritUrl(name, url);
	}
	
	public List<FavoritUrl> getFavoritUrl() {
		return favoritUrlDAO.selectFavoritUrl();
	}
}
