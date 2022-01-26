package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	@RequestMapping("/1")  // 여러 상황을 대비하여 @Post, @Get보다 @Request가 안정적 
	public String getRealtorView() {
		return "lesson04/addRealtor";
	}
	
	// http://localhost/lesson04/quiz02/add_realtor
	@PostMapping("/add_realtor")
	public String addRealtor(@ModelAttribute Realtor realtor
			, Model model) {
		
		// DB insert => id 반환을 받고 
		realtorBO.addRealtor(realtor);
		
		// DB select => 반환받은 id로 model에 담아 return받아 출
		realtor = realtorBO.getRealtorById(realtor.getId()); // realtor 재활용 
		
		// jsp에서 사용할 객체를 model에 담는다. 
		model.addAttribute("result", realtor);
		
		return "lesson04/realtorInfo"; // 추가된 공인중개사 jsp
	}
	
}
