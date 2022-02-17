package com.quiz.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson02.bo.StoreBO;
import com.quiz.lesson02.model.Store;
import com.quiz.store.bo.NewReviewBO;
import com.quiz.store.model.NewReview;

@Controller
public class StoreController {
	
	@Autowired
	private StoreBO storeBO;
	private NewReviewBO newReviewBO;
	
	// http://localhost/store/store_information
	// store 출력하는 view
	@RequestMapping("/store/store_information")
	public String storeView(Model model) {
		
		// get db
		List<Store> storeList = storeBO.getStoreList();
		
		// select model for jsp
		model.addAttribute("storeList", storeList);
		
		return "store/store_info";
	}
	
	// id, name 받는 view 
	@GetMapping("/store/reviews")
	public String reviewView(Model model,
			@RequestParam(value="id", required=true) int id) {
		
		Store storeById = storeBO.getStoreListById(id);
		
		NewReview getReview = newReviewBO.getNewReviewById(id);
		
		model.addAttribute("storeById", storeById);
		model.addAttribute("getReview", getReview);
		
		return "store/store_review";
	}
	
	// id, name 토대로 출력하는 view 
}
