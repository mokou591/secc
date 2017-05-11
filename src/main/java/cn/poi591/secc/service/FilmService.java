package cn.poi591.secc.service;

import java.util.List;

import cn.poi591.secc.dto.FilmReviewDetail;
import cn.poi591.secc.dto.FilmScore;
import cn.poi591.secc.entity.Film;
import cn.poi591.secc.entity.FilmReview;
import cn.poi591.secc.entity.User;

public interface FilmService {

	public void addFilm(Film film);

	public Film findFilmById(Integer id);

	/**
	 * 添加一篇影评
	 * 
	 * @param filmReview
	 */
	public Integer addFilmReview(FilmReview filmReview);

	/**
	 * 获取电影的评分信息
	 * 
	 * @param mainFilm
	 * @return
	 */
	public FilmScore getFilmScore(Film film);

	/**
	 * 查询电影的所有影评，返回的集合包含的对象有影评信息和作者引用。
	 * 
	 * @param mainFilm
	 * @return 一个 集合
	 */
	public List<FilmReviewDetail> getFilmReviewDetailBest(Film film,
			Integer start, Integer offset);

	/**
	 * 获取用户的一篇影评
	 * @param mainFilm 
	 * 
	 * @param loginUser
	 * @return
	 */
	public FilmReview getFilmReview(Film film, User user);

	/**
	 * 获取当前电影的影评总数
	 * 
	 * @param film
	 * @return
	 */
	public Integer getFilmReviewCount(Film film);

	public List<FilmReviewDetail> getFilmReviewDetailLatest(Film film,
			Integer start, Integer offset);

	public boolean checkFilmReviewOOXXExist(FilmReview filmReview,
			User loginUser);

	public boolean addFilmReviewOOXX(FilmReview filmReview, User loginUser,
			String type);

	public FilmReviewDetail findFilmReviewDetailById(Integer reviewId);

	public Film findFilmByOriginalName(String originalName);

	public List<Film> findFilmListByGenre(String genre, Integer start,
			Integer offset);

	public List<Film> findFilmRandom(Integer count);

	public List<FilmReviewDetail> findFilmReviewDetailRandom(Integer count);

}