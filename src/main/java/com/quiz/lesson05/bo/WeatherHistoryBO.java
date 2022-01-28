package com.quiz.lesson05.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson05.dao.WeatherHistoryDAO;
import com.quiz.lesson05.model.WeatherHistory;

@Service
public class WeatherHistoryBO {
	
	@Autowired
	private WeatherHistoryDAO weatherHistoryDAO;
	
	public WeatherHistory getWeatherHistory(WeatherHistory weatherHistory) {
		return weatherHistoryDAO.selectWeatherHistory(weatherHistory);
	}
}
