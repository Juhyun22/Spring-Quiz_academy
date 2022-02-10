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
public class Lesson06Quiz02Controller {

	@Autowired
	private FavoritUrlBO favoritUrlBO;

	// 값 받는 view
	// 즐겨찾기 추가 화면 
	// http://localhost/lesson06/quiz02_1
	@RequestMapping("/lesson06/quiz02_1")
	public String addFavoritView() {
		return "lesson06/quiz02_1";
	}
	
	// 주소 중복 검증 - AJAX 통신 호출
	@PostMapping("/lesson06/is_duplication_url")
	@ResponseBody
	public Map<String, Boolean> is_Duplication(
			@RequestParam("url") String url) {
		
		// DB 중복확인
		FavoritUrl favoritUrl = favoritUrlBO.getFavoritByUrl(url);
		
		Map<String, Boolean>urlResult = new HashMap<>();
		urlResult.put("result", true);
		
		if (favoritUrl == null) {
			// 중복되지 않음
			urlResult.put("result", false);
		}
		
		return urlResult;
	}
	
	// 데이터 추가하는 view 
	// 즐겨찾기 추가 기능 - AJAX 호출로 들어오는 요청  
	@PostMapping("/lesson06/quiz02_3")
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
	@RequestMapping("/lesson06/quiz02_4") 
	public String getFavoritUrl(Model model) {
		// select db
		List<FavoritUrl> favoritUrlList = favoritUrlBO.getFavoritUrlList();
		model.addAttribute("favoritUrlList", favoritUrlList);
		
		return "lesson06/quiz02_2";
	}
}
