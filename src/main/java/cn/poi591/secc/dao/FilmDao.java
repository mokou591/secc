package cn.poi591.secc.dao;

import org.apache.ibatis.annotations.Param;

import cn.poi591.secc.entity.Film;
import cn.poi591.secc.entity.User;

public interface FilmDao {

	/**
	 * 向数据库添加新的电影
	 * @param film
	 */
	void add(Film film);

	
	/**
	 * 根据id查找电影
	 * @param id
	 * @return
	 */
	Film findById(Integer id);
	
	
}
