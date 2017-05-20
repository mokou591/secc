package cn.poi591.secc.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import cn.poi591.secc.dto.FilmReviewDetail;
import cn.poi591.secc.entity.Film;

public interface AdminService {

	boolean checkUserAuthorityExist(HttpSession session);

	void checkFilmById(Integer filmId);

	void deleteFilmById(Integer filmId);

	void checkBookById(Integer bookId);

	void deleteBookById(Integer bookId);

	void checkMusicById(Integer musicId);

	void deleteMusicById(Integer musicId);

	void checkActivityById(Integer activityId);

	void deleteActivityById(Integer activityId);

	List<Film> findNonCheckedFilm(Integer start, Integer offset);

	List findNonCheckedMusic(Integer start, Integer offset);

	List findNonCheckedBook(Integer start, Integer offset);

	List findNonCheckedActivity(Integer start, Integer offset);

	void addColumnDescription(String column, Integer id, String description);

	void deleteColumnDescription(String column, Integer id, String description);

	void addEssence(String column, Integer id);

	void deleteEssence(String column, Integer id);

	List<FilmReviewDetail> findFilmReivewDetailEssence(Integer top);

	List findMusicReivewDetailEssence(Integer top);

	List findBookReivewDetailEssence(Integer top);

}
