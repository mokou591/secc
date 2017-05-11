package cn.poi591.secc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.poi591.secc.dao.ActivityDao;
import cn.poi591.secc.dao.ActivityNoteDao;
import cn.poi591.secc.dto.ActivityNoteDetail;
import cn.poi591.secc.entity.Activity;
import cn.poi591.secc.entity.ActivityNote;
import cn.poi591.secc.service.ActivityService;

@Service
public class ActivityServiceImpl implements  ActivityService{

	@Autowired
	private ActivityDao activityDao;
	
	@Autowired
	private ActivityNoteDao activityNoteDao;
	
	public Integer add(Activity activity) {
		return activityDao.add(activity);
	}

	public Activity findById(Integer id) {
		return activityDao.findById(id);
	}

	public List<ActivityNoteDetail> getActivityNoteDetailLatest(
			Activity activity, Integer start,Integer offset) {
		return activityNoteDao.getActivityNoteDetailLatest(activity,start,offset);
	}

	public Integer addActivityNote(ActivityNote activityNote) {
		return activityNoteDao.add(activityNote);
	}

	public Integer getActivityNoteCount(Activity activity) {
		return activityNoteDao.getActivityNoteCount(activity);
	}

	public ActivityNoteDetail findActivityNoteDetailById(Integer noteId) {
		return activityNoteDao.findActivityNoteDetailById(noteId);
	}

	public List<Activity> findActivityRandom(Integer count) {
		return activityDao.findActivityRandom(count);
	}

	public List<ActivityNoteDetail> findActivityNoteDetailRandom(Integer count) {
		return activityNoteDao.findActivityNoteDetailRandom(count);
	}

	public List<Activity> findActivityListByGenre(String genre, Integer start,Integer offset) {
		return activityDao.findActivityListByGenre(genre,start,offset);
	}
	
}
