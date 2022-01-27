package com.quiz.lesson05;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/lesson05")
@Controller
public class Lesson05Quiz01Controller {
	
	// http://localhost/lesson05/quiz01
	@RequestMapping("/quiz01")
	public String quiz1() {
		return "lesson05/quiz01";
	}
}
