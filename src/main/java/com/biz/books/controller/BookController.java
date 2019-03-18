package com.biz.books.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.biz.books.model.BookVO;
import com.biz.books.service.BookService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BookController {

	@Autowired
	BookService bs;
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String book(Model model) {
		
		BookVO bookVO = new BookVO();
		LocalDate ld = LocalDate.now();
		bookVO.setB_userid("test");
		bookVO.setB_date(ld.toString());
		model.addAttribute("BOOK",bookVO);
		
		return "book_list";
		
	}
	
	@RequestMapping(value="book",method=RequestMethod.POST)
	 public String book(@ModelAttribute BookVO bookVO) {
		
		// log.debug(String.valueOf(b_id));
		// log.debug(b_userid);
		log.debug("BOOKVO " + bookVO.toString());
		int ret = bs.save(bookVO);
		
		return "redirect:/";
		
	}

	
	@RequestMapping(value="b_1",method=RequestMethod.GET)
	public String b1(String b_id) {
		
		log.debug(b_id);
		return "redirect:/";
		
	}
	
	@RequestMapping(value="book_list", method=RequestMethod.GET)
	public String book_list(Model model) {
		
		List<BookVO> bookList = bs.selectAll();
		
		model.addAttribute("BOOKS", bookList);
		return "book_list";
		
	}
}
