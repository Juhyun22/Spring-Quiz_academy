package com.quiz.store.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.store.dao.NewReviewDAO;
import com.quiz.store.model.NewReview;

@Service
public class NewReviewBO {
	
	@Autowired
	private NewReviewDAO newReviewDAO;
	
	public NewReview getNewReviewById(int id) {
		return newReviewDAO.selectNewReviewById(id);
	}
}
