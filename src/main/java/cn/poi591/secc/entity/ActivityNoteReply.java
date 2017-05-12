package cn.poi591.secc.entity;

import java.util.Date;

public class ActivityNoteReply {
	private Integer id;
	private Integer activityNoteId;
	private Integer userId;
	private String text;
	private Date createTime;
	private String status;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getActivityNoteId() {
		return activityNoteId;
	}
	public void setActivityNoteId(Integer activityNoteId) {
		this.activityNoteId = activityNoteId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
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
