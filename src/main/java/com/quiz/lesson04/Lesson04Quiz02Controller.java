package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson04.bo.RealtorBO;
import com.quiz.lesson04.model.Realtor;

@RequestMapping("/lesson04/quiz02")
@Controller
public class Lesson04Quiz02Controller {
	
	@Autowired
	private RealtorBO realtorBO;

	// http://localhost/lesson04/quiz02/1
	@GetMapping("/1")
	public String getRealtorView() {
		return "lesson04/addRealtor";
	}
	
	// http://localhost/lesson04/quiz02/add_realtor
	@PostMapping("/add_realtor")
	public String addRealtor(@ModelAttribute Realtor realtor
			, Model model) {
		
		// DB 넣기 
		realtorBO.addRealtor(realtor);
		
		// DB 출력 
		Realtor result = realtorBO.getRealtorById(realtor.getId());
		model.addAttribute("result", result);
		
		return "lesson04/realtorInfo";
	}
	
}
