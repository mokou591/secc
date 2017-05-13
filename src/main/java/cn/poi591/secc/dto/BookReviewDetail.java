package cn.poi591.secc.dto;

import cn.poi591.secc.entity.Book;
import cn.poi591.secc.entity.BookReview;
import cn.poi591.secc.entity.User;

public class BookReviewDetail extends BookReview {
	// BookReview properties..

	// author
	private User user;

	// book
	private Book book;

	//replyCount
	private Integer replyCount;
	
	
	public Integer getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(Integer replyCount) {
		this.replyCount = replyCount;
	}

	// Upvote Downvote model
	private Vote vote;

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Vote getVote() {
		return vote;
	}

	public void setVote(Vote vote) {
		this.vote = vote;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
