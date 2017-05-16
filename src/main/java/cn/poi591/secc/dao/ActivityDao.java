package cn.poi591.secc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.poi591.secc.entity.Activity;
import cn.poi591.secc.entity.User;

public interface ActivityDao {

	/**
	 * 向数据库添加新的活动
	 * @param activity
	 * @return 
	 */
	Integer add(Activity activity);

	
	/**
	 * 根据id查找活动
	 * @param id
	 * @return
	 */
	Activity findById(Integer id);

	/**
	 * 根据类型查找活动
	 * @param genre
	 * @return
	 */
	List<Activity> findActivityListByGenre(@Param("genre") String genre,@Param("start") Integer start,@Param("offset") Integer offset);


	List<Activity> findActivityRandom(@Param("count")Integer count);


	Boolean checkHasPartake(@Param("activity")Activity activity,@Param("user") User user);

	/**
	 * 用户报名活动：添加一个用户参与活动的关系
	 * @param activity
	 * @param user
	 */
	void addPartake(@Param("activity")Activity activity, @Param("user")User user);

	/**
	 * 取消活动报名：删除一个用户参与活动的关系
	 * @param activity
	 * @param user
	 */
	void deletePartake(@Param("activity")Activity activity,  @Param("user")User user);

	/**
	 * 查询活动报名人数
	 * @param activity
	 * @return
	 */
	Integer getActivityPartakeCount(Activity activity);
	
	/**
	 * 查询活动讨论人数
	 * @param activity
	 * @return
	 */
	Integer getNoteCount(Activity activity);


	List<Activity> findByStatus(@Param("status")String status, @Param("start") Integer start,@Param("offset") Integer offset);

	void replaceActivityStatus(@Param("activityId")Integer activityId ,@Param("oldStr")String oldStr, @Param("newStr")String newStr);


	void deleteActivityById(Integer activityId);
}
