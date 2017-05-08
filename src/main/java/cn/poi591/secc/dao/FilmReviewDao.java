package cn.poi591.secc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.poi591.secc.dto.FilmReviewAndUser;
import cn.poi591.secc.dto.FilmScore;
import cn.poi591.secc.entity.Film;
import cn.poi591.secc.entity.FilmReview;
import cn.poi591.secc.entity.User;

public interface FilmReviewDao {

	/**
	 * 向数据库添加一篇影评
	 * @param filmReview
	 */
	void add(FilmReview filmReview);

	/**
	 * 查出电影的评分信息
	 * @param film
	 * @return
	 */
	FilmScore getFilmScore(Film film);

	/**
	 * 获得'影评及作者'的对象集合。
	 * @param film
	 * @return
	 */
	List<FilmReviewAndUser> getFilmReviewAndUserList(Film film);

	/**
	 * 查找指定电影的所有影评
	 */
	List<FilmReview> findFilmReviewByFilm(Film film);
	
	/**
	 * 找到影评的作者。
	 * 根据影评找到用户。
	 * @return
	 */
	User findUserByFilmReview(FilmReview review);

	/**
	 * 根据影作者找到一篇影评
	 * @param loginUser
	 * @return
	 */
	FilmReview findFilmReviewByUser(User loginUser);

	/**
	 * 获取当前电影的影评总数
	 * @param film
	 * @return
	 */
	Integer getFilmReviewCount(Film film);

	/**
	 * 根据电影查询影评，根据时间从新到旧排序，需要设置起始位置和查询项数。
	 * @return
	 */
	List<FilmReviewAndUser> getFilmReviewAndUserLatest(@Param("film") Film film, @Param("start")Integer start,
			@Param("offset")Integer offset);
}
