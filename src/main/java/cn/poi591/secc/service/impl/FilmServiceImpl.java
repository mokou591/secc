package cn.poi591.secc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.poi591.secc.dao.FilmDao;
import cn.poi591.secc.dao.FilmReviewDao;
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

}
