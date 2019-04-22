package com.biz.books.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.biz.books.model.BookVO;
import com.biz.books.service.BookService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BookController {

	@Autowired
	BookService bs;
	
	@ModelAttribute("bookVO")
	public BookVO newBook() {
		BookVO vo = new BookVO();
		return vo;
	}
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String book(Model model) {
		
		BookVO bookVO = new BookVO();
		LocalDate ld = LocalDate.now();
		bookVO.setB_userid("test");
		bookVO.setB_date(ld.toString());
		model.addAttribute("BOOK",bookVO);
		
		return "home";
		
	}
	
	@RequestMapping(value="book",method=RequestMethod.POST)
	 public String book(@ModelAttribute BookVO bookVO) {
		
		// log.debug(String.valueOf(b_id));
		// log.debug(b_userid);
		log.debug("BOOKVO " + bookVO.toString());
		int ret = bs.save(bookVO);
		
		return "redirect:/book_list"; //book_list가 보이게 하라
		
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
	
	@RequestMapping(value="book_view", method=RequestMethod.GET)
	public String book_view(@RequestParam("id") long id, Model model) {
		
		// long id = bookVO.getB_id();
		
		log.debug("BOOK ID: " + id);
		
		BookVO bookVO = bs.findById(id);
		model.addAttribute("bookVO",bookVO);
		return "book_view";
	}
	@RequestMapping(value="book_update", method=RequestMethod.GET)
	public String book_update(@RequestParam("id") long id, Model model) {
		// update를 할때에 클릭을 해서 수정을 하기 때문에 그 번호의 기준은 id값이고
		// id값을 불러와야하기 때문에 RequestParam을 해줘야한다.....
		List<BookVO> bookList = bs.selectAll();
		
		// long b_id = bookVO.getB_id();
		BookVO bookVO = bs.findById(id);
		
		bookVO = bs.findById(bookVO.getB_id());
		
		model.addAttribute("BOOK", bookVO);
		model.addAttribute("LIST",bookList);
		model.addAttribute("BODY","BOOK_LIST");
		return "home";
	}
	@RequestMapping(value="book_update", method=RequestMethod.POST)
	public String book_update(@ModelAttribute("bookVO") BookVO bookVO, 
			Model model, SessionStatus session) {
		
		bs.update(bookVO);
		session.setComplete();
		return "redirect:/book_list"; //완료 후 bookList가 보인다
	}
	@RequestMapping(value="book_delete", method=RequestMethod.GET)
	public String book_delete(@RequestParam long id) {
		// delete도 마찬가지로 id의 값을 기준으로 불러오는것이므로
		// requestparma(id)값을 지정해줘야한다.
		// 이때 vo에서 선언한 b_id로 해주어도 되고 id로 해주어도 되는데
		// id로 하고 싶은 경우에는 
		bs.delete(id);
		return "redirect:/book_list"; //완료 후 bookList가 보인다
		
	}
}
