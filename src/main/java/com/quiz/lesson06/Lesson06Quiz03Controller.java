package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.BookingBO;
import com.quiz.lesson06.model.Booking;

@Controller
@RequestMapping("/lesson06/quiz03")
public class Lesson06Quiz03Controller {
	
	@Autowired
	private BookingBO bookingBO; 
	
	// reservation view
	// http://localhost/lesson06/quiz03/1
	@RequestMapping("/1")
	public String reservationListPage(Model model) {
		// get list
		List<Booking> bookingList = bookingBO.getBookingList();
		model.addAttribute("bookingList", bookingList);
		
		return "lesson06/quiz03_1";
	}
	
	// 예약 삭제 - AJAX 호출 
	@DeleteMapping("/2")
	@ResponseBody
	public Map<String, String> deleteReserve(
			@RequestParam("id") int id) {
		
		// delete query
		int count = bookingBO.deleteBookingById(id);
		
		Map<String, String> result = new HashMap<>();
		result.put("result", "success");
		if (count < 1) {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	// 예약하기 view
	@RequestMapping("/3")
	public String reservePage() {
		// view return
		return "lesson06/quiz03_2";
	}
	
	// 예약하기 - AJAX 호출 
	@PostMapping("/4")
	@ResponseBody
	public Map<String, String> addBooking(
			@RequestParam("name") String name,
			@RequestParam("date") String date,
			@RequestParam("day") int day,
			@RequestParam("headcount") int headcount,
			@RequestParam("phoneNumber") String phoneNumber) {
		
		// db insert
		int count = bookingBO.addBooking(name, date, day, headcount, phoneNumber);
		
		// result map => json
		Map<String, String> result = new HashMap<>();
		result.put("code", "1");
		if (count < 1) {
			result.put("code", "500");
		}
		
		return result;
	}
	
	// 조회하기 view
	@RequestMapping("/5")
	public String getReservation() {
		return "lesson06/quiz03_3";
	}
	
	// 조회하기 
	@PostMapping("/6")
	@ResponseBody
	public Map<String, Object> searchReservation(
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber) {
		
		// db select
		Booking booking = bookingBO.getBookingByNameAndPhoneNumber(name, phoneNumber);
		
		// 결과 map => json
		Map<String, Object> result = new HashMap<>();
		// 성공 시 
		// {"result":booking}
		// {"result":"success", "code":1, "booking":{"name":이름, "phoneNumber":~}}
		if (booking != null) {
			result.put("result", "success");
			result.put("code", 1);
			result.put("booking", booking);
		} else {
			// 실패 시, 없으면 
			// {"result":"fail", "code":500}
			result.put("result", "fail");
			result.put("code", 500);			
		}
		
		return result;
	}
}
