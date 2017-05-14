package cn.poi591.secc.dto;

import cn.poi591.secc.entity.Book;

public class BookDetail extends Book{
	//extends..
	
	private BookScore bookScore;

	public BookScore getBookScore() {
		return bookScore;
	}

	public void setBookScore(BookScore bookScore) {
		this.bookScore = bookScore;
	}
	
}
