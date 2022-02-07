package com.quiz.store.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.store.model.NewReview;

@Repository
public interface NewReviewDAO {
	
	public NewReview selectNewReviewById(@Param("id") int id);
}
