package cn.poi591.secc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.poi591.secc.dao.FilmDao;
import cn.poi591.secc.dao.FilmReviewDao;
import cn.poi591.secc.dto.FilmReviewDetail;
import cn.poi591.secc.dto.FilmScore;
import cn.poi591.secc.entity.Film;
import cn.poi591.secc.entity.FilmReview;
import cn.poi591.secc.entity.User;
import cn.poi591.secc.service.FilmService;

@Service
public class FilmServiceImpl implements  FilmService {

	@Autowired
	private FilmDao filmDao;

	@Autowired
	private FilmReviewDao filmReviewDao;

	public void addFilm(Film film) {
		filmDao.add(film);
	}

	public Film findFilmById(Integer id) {
		return filmDao.findById(id);
	}

	/**
	 * 添加一篇影评
	 * 
	 * @param filmReview
	 */
	public Integer addFilmReview(FilmReview filmReview) {
		return	filmReviewDao.add(filmReview);
	}

	/**
	 * 获取电影的评分信息
	 * 
	 * @param mainFilm
	 * @return
	 */
	public FilmScore getFilmScore(Film film) {
		return filmReviewDao.getFilmScore(film);
	}

	/**
	 * 查询电影的所有影评，返回的集合包含的对象有影评信息和作者引用。
	 * 
	 * @param mainFilm
	 * @return 一个 集合
	 */
	public List<FilmReviewDetail> getFilmReviewDetailBest(Film film,Integer start,Integer offset) {
		return filmReviewDao.getFilmReviewDetailBest(film,start,offset);
	}

	/**
	 * 获取用户的一篇影评
	 * @param mainFilm 
	 * 
	 * @param loginUser
	 * @return
	 */
	public FilmReview getFilmReview(Film film, User user) {
		return filmReviewDao.getFilmReview(film ,user);
	}

	/**
	 * 获取当前电影的影评总数
	 * 
	 * @param film
	 * @return
	 */
	public Integer getFilmReviewCount(Film film) {
		return filmReviewDao.getFilmReviewCount(film);
	}

	public List<FilmReviewDetail> getFilmReviewDetailLatest(Film film,
			Integer start, Integer offset) {
		return filmReviewDao.getFilmReviewDetailLatest(film, start, offset);
	}

	public boolean checkFilmReviewOOXXExist(FilmReview filmReview,
			User loginUser) {
		return filmReviewDao.checkFilmReviewOOXXExist(filmReview, loginUser);
	}

	public boolean addFilmReviewOOXX(FilmReview filmReview, User loginUser,
			String type) {
		return filmReviewDao.addFilmReviewOOXX(filmReview, loginUser, type);
	}
	
	public FilmReviewDetail findFilmReviewDetailById(Integer reviewId) {
		return filmReviewDao.findFilmReviewDetailById(reviewId);
	}
	
	public Film findFilmByOriginalName(String originalName) {
		return filmDao.findByOriginalName(originalName);
	}

	public List<Film> findFilmListByGenre(String genre,Integer start,Integer offset) {
		return filmDao.findFilmListByGenre(genre,start ,offset);
	}

	public List<Film> findFilmRandom(Integer count) {
		return filmDao.findFilmRandom(count);
	}

	public List<FilmReviewDetail> findFilmReviewDetailRandom(Integer count) {
		return filmReviewDao.findFilmReviewDetailRandom(count);
	}

}
