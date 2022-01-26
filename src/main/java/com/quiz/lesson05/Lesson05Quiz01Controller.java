package com.quiz.lesson05;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/lesson05")
@Controller
public class Lesson05Quiz01Controller {
	
	@RequestMapping("/quiz01")
	public String quiz1() {
		return "lesson05/quiz01";
	}
}
