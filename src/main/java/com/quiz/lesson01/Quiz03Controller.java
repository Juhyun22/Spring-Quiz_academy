package com.quiz.lesson01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller // @ResponseBody 없음 
public class Quiz03Controller {

	// http://localhost/lesson01/quiz03/1
	@RequestMapping("/lesson01/quiz03/1")
	public String quiz03() {
		return "lesson01/quiz03_1"; // jsp 뷰 경로 
	}
}
