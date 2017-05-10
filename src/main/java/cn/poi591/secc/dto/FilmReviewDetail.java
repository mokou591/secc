package cn.poi591.secc.dto;

import cn.poi591.secc.entity.Film;
import cn.poi591.secc.entity.FilmReview;
import cn.poi591.secc.entity.User;

public class FilmReviewDetail extends FilmReview {
	// FilmReview properties..

	// author
	private User user;

	// film
	private Film film;

	// Upvote Downvote model
	private Vote vote;

	public Film getFilm() {
		return film;
	}

	public void setFilm(Film film) {
		this.film = film;
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
