package com.quiz.lesson05;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson05.bo.WeatherHistoryBO;
import com.quiz.lesson05.model.WeatherHistory;

@RequestMapping("/lesson05/quiz05")
@Controller
public class Lesson05Quiz05Controller {
	
	@Autowired
	private WeatherHistoryBO weatherHistoryBO;

	// http://localhost/lesson05/quiz05/weather_info
	@RequestMapping("/weather_info")
	public String quiz05(@ModelAttribute WeatherHistory weatherHistory
			, Model model) {
		
		// select db
		weatherHistoryBO.getWeatherHistory(weatherHistory);
		
		// set model for jsp
		model.addAttribute("weatherinfo", weatherHistory);
		
		return "lesson05/quiz05_1";
	}
}
