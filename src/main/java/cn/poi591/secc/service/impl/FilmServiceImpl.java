package cn.poi591.secc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.poi591.secc.dao.FilmDao;
import cn.poi591.secc.dao.FilmReviewDao;
import cn.poi591.secc.dto.FilmReviewAndUser;
import cn.poi591.secc.dto.FilmScore;
import cn.poi591.secc.entity.Film;
import cn.poi591.secc.entity.FilmReview;
import cn.poi591.secc.service.FilmService;

@Service
public class FilmServiceImpl implements FilmService{

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
	 * @param filmReview
	 */
	public void addFilmReview(FilmReview filmReview) {
		filmReviewDao.add(filmReview);
	}

	/**
	 * 获取电影的评分信息
	 * @param mainFilm
	 * @return
	 */
	public FilmScore getFilmScore(Film film) {
		return filmReviewDao.getFilmScore(film);
	}

	/**
	 * 查询电影的所有影评，返回的集合包含的对象有影评信息和作者引用。
	 * @param mainFilm
	 * @return 一个 集合
	 */
	public List<FilmReviewAndUser> getFilmReviewAndUserList(Film film) {
		return filmReviewDao.getFilmReviewAndUserList(film);
	}

}
