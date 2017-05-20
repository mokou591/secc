package cn.poi591.secc.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.poi591.secc.constant.Page;
import cn.poi591.secc.dao.ActivityDao;
import cn.poi591.secc.dao.AdminDao;
import cn.poi591.secc.dao.BookDao;
import cn.poi591.secc.dao.BookReviewDao;
import cn.poi591.secc.dao.FilmDao;
import cn.poi591.secc.dao.FilmReviewDao;
import cn.poi591.secc.dao.MusicDao;
import cn.poi591.secc.dao.MusicReviewDao;
import cn.poi591.secc.dto.BookReviewDetail;
import cn.poi591.secc.dto.FilmReviewDetail;
import cn.poi591.secc.dto.MusicReviewDetail;
import cn.poi591.secc.entity.Activity;
import cn.poi591.secc.entity.Book;
import cn.poi591.secc.entity.Film;
import cn.poi591.secc.entity.Music;
import cn.poi591.secc.entity.User;
import cn.poi591.secc.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private FilmDao filmDao;
	
	@Autowired
	private MusicDao musicDao;
	
	@Autowired
	private BookDao bookDao;
	
	@Autowired
	private ActivityDao activityDao;
	
	@Autowired
	private FilmReviewDao filmReviewDao;
	
	@Autowired
	private MusicReviewDao musicReviewDao;
	
	@Autowired
	private BookReviewDao bookReviewDao;

	@Override
	public void checkActivityById(Integer activityId) {
		activityDao.replaceActivityStatus(activityId, "未审核", "已审核");
	}

	@Override
	public void checkBookById(Integer bookId) {
		bookDao.replaceBookStatus(bookId, "未审核", "已审核");
	}

	@Override
	public void checkFilmById(Integer filmId) {
		filmDao.replaceFilmStatus(filmId, "未审核", "已审核");
	}

	@Override
	public void checkMusicById(Integer musicId) {
		musicDao.replaceMusicStatus(musicId, "未审核", "已审核");
	}

	@Override
	public boolean checkUserAuthorityExist(HttpSession session) {
		// 权限检查
		User loginUser = (User) session.getAttribute(Page.LOGIN_USER);
		String authority = (String) session.getAttribute(Page.USER_AUTHORITY);
		if (loginUser == null || authority == null) {
			return false;
		}
		return true;
	}

	@Override
	public void deleteActivityById(Integer activityId) {
		activityDao.deleteActivityById(activityId);
	}

	@Override
	public void deleteBookById(Integer bookId) {
		bookDao.deleteBookById(bookId);
	}

	@Override
	public void deleteFilmById(Integer filmId) {
		filmDao.deleteFilmById(filmId);
	}

	@Override
	public void deleteMusicById(Integer musicId) {
		musicDao.deleteMusicById(musicId);
	}

	@Override
	public List<Activity> findNonCheckedActivity(Integer start, Integer offset) {
		return activityDao.findByStatus("未审核", start, offset);
	}

	@Override
	public List<Book> findNonCheckedBook(Integer start, Integer offset) {
		return bookDao.findByStatus("未审核", start, offset);
	}

	@Override
	public List<Film> findNonCheckedFilm(Integer start, Integer offset) {
		return filmDao.findByStatus("未审核", start, offset);
	}

	@Override
	public List<Music> findNonCheckedMusic(Integer start, Integer offset) {
		return musicDao.findByStatus("未审核", start, offset);
	}
	
	/**
	 * 给一个栏目物品设置描述，如热门和新品
	 */
	@Override
	public void addColumnDescription(String column, Integer id,
			String description) {
		adminDao.addColumnDescription(column,id,description);
	}

	@Override
	public void deleteColumnDescription(String column, Integer id,
			String description) {
		adminDao.deleteColumnDescription(column,id,description);
	}

	@Override
	public void addEssence(String column, Integer id) {
		adminDao.addEssence(column,id);
	}

	@Override
	public void deleteEssence(String column, Integer id) {
		adminDao.deleteEssence(column,id);
	}

	@Override
	public List<FilmReviewDetail> findFilmReivewDetailEssence(Integer top) {
		return filmReviewDao.findFilmReivewDetailEssence(top);
	}

	@Override
	public List<MusicReviewDetail> findMusicReivewDetailEssence(Integer top) {
		return musicReviewDao.findMusicReivewDetailEssence(top);
	}

	@Override
	public List<BookReviewDetail> findBookReivewDetailEssence(Integer top) {
		return bookReviewDao.findBookReivewDetailEssence(top);
	}


}
