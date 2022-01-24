package com.quiz.lesson04.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson04.model.Seller;

@Repository
public interface SellerDAO {
	public void insertSeller(
			@Param("nickname") String nickname, 
			@Param("profileImgUrl") String profileImgUrl, 
			@Param("temperature") Double temperature);
	
	public Seller getLastSeller(@Param("id") int id);
}
