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
}
