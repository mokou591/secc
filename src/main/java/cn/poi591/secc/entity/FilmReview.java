package cn.poi591.secc.entity;

import java.util.Date;

public class FilmReview {
	private Integer id;
	private Integer filmId;
	private Integer userId;
	private Integer score;
	private String title;
	private String text;
	private Boolean isSpoiler;
	private Boolean  isPrivate;
	private Date createTime;
	private String status;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getFilmId() {
		return filmId;
	}
	public void setFilmId(Integer filmId) {
		this.filmId = filmId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Boolean getIsSpoiler() {
		return isSpoiler;
	}
	public void setIsSpoiler(Boolean isSpoiler) {
		this.isSpoiler = isSpoiler;
	}
	public Boolean getIsPrivate() {
		return isPrivate;
	}
	public void setIsPrivate(Boolean isPrivate) {
		this.isPrivate = isPrivate;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
