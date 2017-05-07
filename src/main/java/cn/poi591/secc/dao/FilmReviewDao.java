package cn.poi591.secc.dao;

import java.util.List;

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
}
