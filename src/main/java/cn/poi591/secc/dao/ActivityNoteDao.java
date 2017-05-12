package cn.poi591.secc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.poi591.secc.dto.ActivityNoteDetail;
import cn.poi591.secc.dto.ActivityNoteReplyDetail;
import cn.poi591.secc.entity.Activity;
import cn.poi591.secc.entity.ActivityNote;
import cn.poi591.secc.entity.ActivityNoteReply;
import cn.poi591.secc.entity.User;

public interface ActivityNoteDao {

	/**
	 * 向数据库添加一篇活动讨论
	 * 
	 * @param activityNote
	 */
	Integer add(ActivityNote activityNote);


	/**
	 * 查找指定活动的所有活动讨论
	 */
	List<ActivityNote> findActivityNoteByActivity(Activity activity);

	/**
	 * 找到活动讨论的作者。 根据活动讨论找到用户。
	 * 
	 * @return
	 */
	User findUserByActivityNote(ActivityNote note);

	/**
	 * 获取当前活动的活动讨论总数
	 * 
	 * @param activity
	 * @return
	 */
	Integer getActivityNoteCount(Activity activity);

	/**
	 * 根据活动查询活动讨论，根据时间从新到旧排序，需要设置起始位置和查询项数。
	 * 
	 * @return
	 */
	List<ActivityNoteDetail> getActivityNoteDetailNatural(
			@Param("activity") Activity activity, @Param("start") Integer start,
			@Param("offset") Integer offset);


	/**
	 * 根据活动讨论id查询详细活动讨论数据
	 * @param noteId
	 * @return
	 */
	ActivityNoteDetail findActivityNoteDetailById(Integer noteId);
	
	/**
	 * 随机查询出若干活动讨论
	 * @param count
	 * @return
	 */
	List<ActivityNoteDetail> findActivityNoteDetailRandom(Integer count);


	ActivityNote findById(Integer noteId);

	/**
	 * 添加一条讨论的回复
	 * @param reply
	 */
	void addReply(ActivityNoteReply reply);

	/**
	 * 查询活动讨论的回复，排序从新到旧
	 * @param note
	 * @param start
	 * @param offset
	 * @return
	 */
	List<ActivityNoteReplyDetail> findNoteReplyDetailNatural(@Param("note") ActivityNote note,
			@Param("start") Integer start,@Param("offset")  Integer offset);
}
