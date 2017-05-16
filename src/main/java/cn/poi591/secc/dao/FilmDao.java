package cn.poi591.secc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.poi591.secc.entity.Film;

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
	
	/**
	 * 根据影片原名查找电影
	 * @param originalName
	 * @return
	 */
	Film findByOriginalName(String originalName);

	/**
	 * 根据类型查找电影
	 * @param genre
	 * @return
	 */
	List<Film> findFilmListByGenre(@Param("genre") String genre,@Param("start") Integer start,@Param("offset") Integer offset);


	List<Film> findFilmRandom(@Param("count")Integer count);

	List<Film> findByStatus(@Param("status")String status, @Param("start") Integer start,@Param("offset") Integer offset);


	void replaceFilmStatus(@Param("filmId")Integer filmId ,@Param("oldStr")String oldStr, @Param("newStr")String newStr);


	void deleteFilmById(Integer filmId);
}
