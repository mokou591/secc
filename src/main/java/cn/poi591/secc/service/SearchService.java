package cn.poi591.secc.service;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.poi591.secc.dao.SearchDao;
import cn.poi591.secc.dto.ActivityDetail;
import cn.poi591.secc.dto.BookDetail;
import cn.poi591.secc.dto.FilmDetail;
import cn.poi591.secc.dto.MusicDetail;
import cn.poi591.secc.dto.SearchResult;
import cn.poi591.secc.entity.Book;
import cn.poi591.secc.entity.Film;
import cn.poi591.secc.entity.Music;

@Service
public class SearchService {

	@Autowired
	private SearchDao searchDao;

	/**
	 * 根据类型和关键词搜索前若干条记录
	 * 
	 * @param keywordList
	 * @param top
	 * @return
	 */
	public List<SearchResult> search(String type, List<String> keywordList,
			Integer top) {
		// 结果集
		List<SearchResult> resultList = new ArrayList<SearchResult>();
		// 按类型进行搜索
		List<FilmDetail> filmList = new ArrayList<>();
		List<MusicDetail> musicList = new ArrayList<>();
		List<BookDetail> bookList = new ArrayList<>();
		List<ActivityDetail> activityList = new ArrayList<>();
		if (type.equals("film") || type.equals("all")) {
			filmList = searchDao.searchFilm(keywordList, 0, top);
		}
		if (type.equals("music") || type.equals("all")) {
			musicList = searchDao.searchMusic(keywordList, 0, top);
		}
		if (type.equals("book") || type.equals("all")) {
			bookList = searchDao.searchBook(keywordList, 0, top);
		}
		if (type.equals("activity") || type.equals("all")) {
			activityList = searchDao.searchActivity(keywordList, 0, top);
		}
		// 包装结果，放入集合
		for (FilmDetail film : filmList) {
			SearchResult result = new SearchResult();
			result.setType("film");
			result.setObject(film);
			result.setScore(film.getFilmScore().getCount());
			resultList.add(result);
		}
		for (MusicDetail music : musicList) {
			SearchResult result = new SearchResult();
			result.setType("music");
			result.setObject(music);
			result.setScore(music.getMusicScore().getCount());
			resultList.add(result);
		}
		for (BookDetail book : bookList) {
			SearchResult result = new SearchResult();
			result.setType("book");
			result.setObject(book);
			result.setScore(book.getBookScore().getCount());
			resultList.add(result);
		}
		for (ActivityDetail activity : activityList) {
			SearchResult result = new SearchResult();
			result.setType("activity");
			result.setObject(activity);
			result.setScore(activity.getNoteCount());
			resultList.add(result);
		}
		// 排序，评价或讨论的人数从多到少
		Comparator<SearchResult> comp = new Comparator<SearchResult>() {
			@Override
			public int compare(SearchResult a, SearchResult b) {
				return b.getScore() - a.getScore();
			}
		};
		resultList.sort(comp);
		// 判断最多返回的条数
		if (top > resultList.size()) {
			top = resultList.size();
		}
		return resultList.subList(0, top);
	}

	public String findDescription(String column, Integer id) {
		return searchDao.findDescription(column,id);
	}

	public Boolean checkIsEssence(String column, Integer id) {
		return searchDao.checkIsEssence(column,id);
	}

	public List<Book> findBookByColumnDescription(Integer topCount,String colDesc) {
		return searchDao.findBookByColumnDescription(topCount,colDesc);
	}

	public List<Music> findMusicByColumnDescription(Integer topCount,String colDesc) {
		return searchDao.findMusicByColumnDescription(topCount,colDesc);
	}

	public List<Film> findFilmByColumnDescription(Integer topCount,String colDesc) {
		return searchDao.findFilmByColumnDescription(topCount,colDesc);
	}
}
