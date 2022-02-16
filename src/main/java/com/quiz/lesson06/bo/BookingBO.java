package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.BookingDAO;
import com.quiz.lesson06.model.Booking;

@Service
public class BookingBO {
	
	@Autowired
	private BookingDAO bookingDAO;
	
	public List<Booking> getBookingList() {
		return bookingDAO.selectBookingList();
	}
	
	public int deleteBookingById(int id) {
		return bookingDAO.deleteBookingById(id);
	}
	
	public int addBooking(String name, String date, int day, int headcount, 
			String phoneNumber) {
		return bookingDAO.insertBooking(name, date, day, headcount, phoneNumber);
	}
	
	public Booking getBookingByNameAndPhoneNumber(String name, String phoneNumber) {
		List<Booking> bookingList = bookingDAO.selectBookingByNameAndPhoneNumber(name, phoneNumber);
		Booking booking = null;
		
		// 하나만 꺼내서 넘기기
		// 아무 data가 없을 시, 비워져있는 리스트 .. not null
		if (bookingList.isEmpty() == false) { // data가 있을 때 	
			booking = bookingList.get(bookingList.size() - 1); // -1: 마지막 리스트 (마지막 하나만 꺼내서 들고오기) or bookingList.size() -1
		}
		
		return booking;
	}
}
