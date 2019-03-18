package com.biz.books.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biz.books.mapper.BookDao;
import com.biz.books.model.BookVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BookService {

	@Autowired
	BookDao dao;
	
	public int save(BookVO bookVO) {

		int ret = 0;
		if(bookVO.getB_id() > 0) {
			ret = dao.update(bookVO);
		}else {
			log.debug("Before Insert BookId:" + bookVO.getB_id());
			ret = dao.insert(bookVO);
			log.debug("After Insert BookId :" + bookVO.getB_id());
		}
		
		return 0;
	}
	
	public int insert(BookVO bookVO) {
		int ret = dao.insert(bookVO);
		return ret;
	}
	
	public List<BookVO> findById(long b_id){
		return dao.selectById(b_id);
	}

	public List<BookVO> selectAll() {
		// TODO Auto-generated method stub
		return dao.selectAll();
	}
	
	
	
}
