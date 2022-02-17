package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
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
	// 즐겨찾기 추가 화면 
	// http://localhost/lesson06/quiz01_1
	@RequestMapping("/lesson06/quiz01_1")
	public String addFavoritView() {
		return "lesson06/quiz01_1";
	}
	
	// 데이터 추가하는 view 
	// 즐겨찾기 추가 기능 - AJAX 호출로 들어오는 요청  
	@PostMapping("/lesson06/quiz01_2")
	@ResponseBody
	public Map<String, String> addFavoritUrl(
			@RequestParam("name") String name,
			@RequestParam("url") String url) {
		
		// insert db
		favoritUrlBO.addFavoritUrl(name, url);
		
		// return map => return json string
		Map<String, String> result = new HashMap<>();
		result.put("result", "success");
		return result;
	}
	
	// 즐겨찾기 목록 화면 
	@RequestMapping("/lesson06/quiz01_3") 
	public String getFavoritUrl(Model model) {
		// select db
		List<FavoritUrl> favoritUrlList = favoritUrlBO.getFavoritUrlList();
		model.addAttribute("favoritUrlList", favoritUrlList);
		
		return "lesson06/quiz01_2";
	}
}
