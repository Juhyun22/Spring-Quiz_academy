package com.quiz.lesson05;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson05.bo.WeatherHistoryBO;
import com.quiz.lesson05.model.WeatherHistory;

@RequestMapping("/lesson05/quiz05")
@Controller
public class Lesson05Quiz05Controller {
	
	@Autowired
	private WeatherHistoryBO weatherHistoryBO;

	// http://localhost/lesson05/quiz05/weather_info
	// request -> response
	// 날씨 정보 목록 화면
	@RequestMapping("/weather_info")
	public String quiz05_1(Model model) {
		
		// get db
		List<WeatherHistory> WeatherHistoryList = weatherHistoryBO.getWeatherHistoryList();
		
		// set model for jsp
		model.addAttribute("WeatherHistoryList", WeatherHistoryList);
		
		return "lesson05/quiz05_1";
	}
	
	// 날씨 정보 입력 화면 
	@RequestMapping("/add_weather_info")
	public String quiz05_2() {
		return "lesson05/quiz05_2";
	}
	
	// 날씨 입력 => 결과는 날씨 정보 목록 화면으로 redirect 
	@PostMapping("/add_weather_history")
	public String quiz05_3(
			@RequestParam("date") String date,
			@RequestParam("weather") String weather,
			@RequestParam("microDust") String microDust,
			@RequestParam("temperatures") double temperatures,
			@RequestParam("precipitation") double precipitation,
			@RequestParam("windSpeed") double windSpeed,
			HttpServletResponse response) {
		
		// DB insert
		weatherHistoryBO.addWeatherHistory(date, weather, microDust, temperatures, precipitation, windSpeed);
		
		// 날씨 정보 목록 화면으로 리다이렉트 
		// response.sendRedirect("/weather_info");
		return "redirect:/weather_info";
	}
}
