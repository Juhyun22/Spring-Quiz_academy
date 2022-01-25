package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;
import com.quiz.lesson04.model.Seller;

@RequestMapping("/lesson04/quiz01")
@Controller
public class Lesson04Quiz01Controller {
	
	@Autowired
	private SellerBO sellerBO;
	
	// http://localhost/lesson04/quiz01/1
	// view를 뿌리는 controller 
	// 판매자 추가 view 화면 
	@RequestMapping("/1")
	public String addSellerView() {
		return "lesson04/addSeller";
	}
	
	// http://localhost/lesson04/quiz01/add_seller
	// 받고 나서 넘기는 view -> @PostMapping : 데이터 추가 시!! 
	@PostMapping("/add_seller")
	public String addSeller(
			@RequestParam("nickname") String nickname,
			@RequestParam(value="profileImgUrl", required=false) String profileImgUrl,
			@RequestParam(value="temperature", required=false) Double temperature) {
		
		// DB insert
		sellerBO.addSeller(nickname, profileImgUrl, temperature);
		
		// return 
		return "lesson04/afterAddSeller";
	}
	
	// http://localhost/lesson04/quiz01/seller_info
	// http://localhost/lesson04/quiz01/seller_info?id=1
	// @GetMapping : 데이터 조회 시 
	// 최근에 만든 data + id에 따른 data
	@GetMapping("seller_info")
	public String sellerInfo(Model model,
			@RequestParam(value="id", required=false) Integer id) {
		
		if (id == null) {
			// 최근 seller 1행 정보 select 
			Seller seller = sellerBO.getLastSeller();
			model.addAttribute("result", seller);
		} else {
			Seller seller = sellerBO.getSellerById(id);
			model.addAttribute("result", seller);
		}
		
		return "lesson04/getLastSeller";
	}
}
