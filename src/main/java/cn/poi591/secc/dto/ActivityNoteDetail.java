package cn.poi591.secc.dto;

import cn.poi591.secc.entity.Activity;
import cn.poi591.secc.entity.ActivityNote;
import cn.poi591.secc.entity.User;

public class ActivityNoteDetail extends ActivityNote {
	// extends props...

	// activity
	private Activity activity;
	
	// user
	private User user;

	public Activity getActivity() {
		return activity;
	}

	public void setActivity(Activity activity) {
		this.activity = activity;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	

}
