package com.quiz.lesson06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.FavoritUrlBO;
import com.quiz.lesson06.model.FavoritUrl;

@Controller
public class Lesson06Quiz01Controller {
	
	@Autowired
	private FavoritUrlBO favoritUrlBO;

	// 값 받는 view
	// http://localhost/lesson06/quiz01_1
	@RequestMapping("/lesson06/quiz01_1")
	public String addFavoritView() {
		return "lesson06/quiz01_1";
	}
	
	// 데이터 추가하는 view 
	@GetMapping("/lesson06/quiz01_2")
	@ResponseBody
	public String addFavoritUrl(
			@RequestParam("name") String name,
			@RequestParam("url") String url) {
		
		// insert db
		favoritUrlBO.addFavoritUrl(name, url);
		
		return "";
	}
	
	// 결과화면 
	@RequestMapping("/lesson06/quiz01_3") 
	public String getFavoritUrl(Model model) {
		// select db
		List<FavoritUrl> favoritUrl = favoritUrlBO.getFavoritUrl();
		model.addAttribute("favoritUrl", favoritUrl);
		
		return "lesson06/quiz01_2";
	}
}
