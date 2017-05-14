package cn.poi591.secc.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.poi591.secc.dao.ActivityDao;
import cn.poi591.secc.dao.ActivityNoteDao;
import cn.poi591.secc.dto.ActivityNoteDetail;
import cn.poi591.secc.dto.ReplyDetail;
import cn.poi591.secc.entity.Activity;
import cn.poi591.secc.entity.ActivityNote;
import cn.poi591.secc.entity.Reply;
import cn.poi591.secc.entity.User;
import cn.poi591.secc.service.ActivityService;

@Service
public class ActivityServiceImpl implements ActivityService {

	@Autowired
	private ActivityDao activityDao;
	
	@Autowired
	private ActivityNoteDao activityNoteDao;
	
	@Override
	public Integer add(Activity activity) {
		return activityDao.add(activity);
	}

	@Override
	public Activity findActivityById(Integer id) {
		return activityDao.findById(id);
	}

	@Override
	public List<ActivityNoteDetail> getActivityNoteDetailNatural(
			Activity activity, Integer start,Integer offset) {
		return activityNoteDao.getActivityNoteDetailNatural(activity,start,offset);
	}

	@Override
	public Integer addActivityNote(ActivityNote activityNote) {
		return activityNoteDao.add(activityNote);
	}

	@Override
	public Integer getActivityNoteCount(Activity activity) {
		return activityNoteDao.getActivityNoteCount(activity);
	}

	@Override
	public ActivityNoteDetail findActivityNoteDetailById(Integer noteId) {
		return activityNoteDao.findActivityNoteDetailById(noteId);
	}

	@Override
	public List<Activity> findActivityRandom(Integer count) {
		return activityDao.findActivityRandom(count);
	}

	@Override
	public List<ActivityNoteDetail> findActivityNoteDetailRandom(Integer count) {
		return activityNoteDao.findActivityNoteDetailRandom(count);
	}

	@Override
	public List<Activity> findActivityListByGenre(@Param("genre") String genre,@Param("start") Integer start,@Param("offset")Integer offset) {
		return activityDao.findActivityListByGenre(genre,start,offset);
	}

	@Override
	public Boolean checkHasPartake(Activity activity, User user) {
		return activityDao.checkHasPartake(activity,user);
	}

	@Override
	public void addPartake(Activity activity, User user) {
		activityDao.addPartake(activity,user);
	}

	@Override
	public void deletePartake(Activity activity, User user) {
		activityDao.deletePartake(activity,user);
	}

	@Override
	public Integer getActivityPartakeCount(Activity activity) {
		return activityDao.getActivityPartakeCount(activity);
	}

	@Override
	public ActivityNote findActivityNoteById(Integer noteId) {
		return activityNoteDao.findById(noteId);
	}

	@Override
	public void addActivityNoteReply(Reply reply) {
		activityNoteDao.addReply(reply);
	}

	@Override
	public List<ReplyDetail> findNoteReplyDetailNatural(
			ActivityNote note, Integer start,Integer offset) {
		return activityNoteDao.findNoteReplyDetailNatural(note,start,offset);
	}
	
}
