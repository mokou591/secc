package cn.poi591.secc.dto;

import cn.poi591.secc.entity.Music;
import cn.poi591.secc.entity.MusicReview;
import cn.poi591.secc.entity.User;

public class MusicReviewDetail extends MusicReview {
	// MusicReview properties..

	// author
	private User user;

	// music
	private Music music;

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

	public Music getMusic() {
		return music;
	}

	public void setMusic(Music music) {
		this.music = music;
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
