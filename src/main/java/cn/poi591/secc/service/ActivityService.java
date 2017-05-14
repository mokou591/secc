package cn.poi591.secc.service;

import java.util.List;

import cn.poi591.secc.dto.ActivityNoteDetail;
import cn.poi591.secc.dto.ReplyDetail;
import cn.poi591.secc.entity.Activity;
import cn.poi591.secc.entity.ActivityNote;
import cn.poi591.secc.entity.Reply;
import cn.poi591.secc.entity.User;

public interface ActivityService {

	public Integer add(Activity activity);

	public Activity findActivityById(Integer id);

	public List<ActivityNoteDetail> getActivityNoteDetailNatural(
			Activity activity, Integer start, Integer offset);

	public Integer addActivityNote(ActivityNote activityNote);

	public Integer getActivityNoteCount(Activity activity);

	public ActivityNoteDetail findActivityNoteDetailById(Integer noteId);

	public List<Activity> findActivityRandom(Integer count);

	public List<ActivityNoteDetail> findActivityNoteDetailRandom(Integer count);

	public List<Activity> findActivityListByGenre(String genre, Integer start,
			Integer offset);

	public Boolean checkHasPartake(Activity activity, User user);

	public void addPartake(Activity activity, User user);

	public void deletePartake(Activity activity, User user);

	public Integer getActivityPartakeCount(Activity activity);

	public ActivityNote findActivityNoteById(Integer noteId);

	public void addActivityNoteReply(Reply reply);

	public List<ReplyDetail> findNoteReplyDetailNatural(ActivityNote note,
			Integer start, Integer offset);

}