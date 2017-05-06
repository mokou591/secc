package cn.poi591.secc.dao;

import org.apache.ibatis.annotations.Param;

import cn.poi591.secc.entity.User;

public interface UserDao {

	/**
	 * 根据用户名查找用户
	 * 
	 * @param username
	 * @return
	 */
	User findByUsername(String username);

	/**
	 * 向数据库添加一个用户
	 * 
	 * @param user
	 */
	void add(User user);

	
	/**
	 * 根据id查找用户
	 * 
	 * @param id
	 * @return
	 */
	User findById(Integer id);

	/**
	 * 更新用户资料
	 * 
	 * @param id
	 * @return
	 */
	void updateProfile(User user);

	/**
	 * 确认一个用户关系是否存在
	 */
	boolean checkRelationExist(@Param("type") Integer RELATION_TYPE,@Param("fromUser") User fromUser,@Param("toUser") User toUser);

	
	/**
	 * 添加一个用户与用户的关系
	 */
	void addRelation(@Param("type") Integer RELATION_TYPE,@Param("fromUser") User fromUser,@Param("toUser") User toUser);

	/**
	 * 删除一个用户与用户的关系
	 */
	void deleteRelation(@Param("type") Integer RELATION_TYPE,@Param("fromUser") User fromUser,@Param("toUser") User toUser);

	
	/**
	 * 更新用户头像地址
	 */
	void updateAvatarUrl(@Param("user")User loginUser,@Param("filename") String filename);

}
