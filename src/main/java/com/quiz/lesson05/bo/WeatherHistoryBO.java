package com.quiz.lesson05.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson05.dao.WeatherHistoryDAO;
import com.quiz.lesson05.model.WeatherHistory;

@Service
public class WeatherHistoryBO {
	
	@Autowired
	private WeatherHistoryDAO weatherHistoryDAO;
	
	public List<WeatherHistory> getWeatherHistoryList() {
		return weatherHistoryDAO.selectWeatherHistoryList();
	}
	
	public void addWeatherHistory(String date, String weather, String microDust,
			double temperatures, double precipitation, double windSpeed) {
		weatherHistoryDAO.insertWeatherHistory(date, weather, microDust, temperatures, precipitation, windSpeed);
	}
}
