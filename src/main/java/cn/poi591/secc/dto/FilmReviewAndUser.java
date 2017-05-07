package cn.poi591.secc.dto;

import cn.poi591.secc.entity.FilmReview;
import cn.poi591.secc.entity.User;

public class FilmReviewAndUser extends FilmReview{
	//FilmReview properties..
	
	//author
	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}
