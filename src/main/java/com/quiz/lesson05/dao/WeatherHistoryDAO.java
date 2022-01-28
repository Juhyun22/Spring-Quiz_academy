package com.quiz.lesson05.dao;

import org.springframework.stereotype.Repository;

import com.quiz.lesson05.model.WeatherHistory;

@Repository
public interface WeatherHistoryDAO {
	public WeatherHistory selectWeatherHistory(WeatherHistory weatherHistory);
}
