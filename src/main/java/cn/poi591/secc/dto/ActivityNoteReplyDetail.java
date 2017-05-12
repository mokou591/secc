package cn.poi591.secc.dto;

import cn.poi591.secc.entity.ActivityNoteReply;
import cn.poi591.secc.entity.User;

public class ActivityNoteReplyDetail extends ActivityNoteReply{
	//reply props...
	
	//user
	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
}
