package cn.poi591.secc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.poi591.secc.dto.ActivityDetail;
import cn.poi591.secc.dto.BookDetail;
import cn.poi591.secc.dto.FilmDetail;
import cn.poi591.secc.dto.MusicDetail;
import cn.poi591.secc.entity.Book;
import cn.poi591.secc.entity.Film;
import cn.poi591.secc.entity.Music;

public interface SearchDao {

	List<FilmDetail> searchFilm(@Param("keywordList") List<String> keywordList,
			@Param("start") Integer start, @Param("offset") Integer offset);

	List<BookDetail> searchBook(@Param("keywordList") List<String> keywordList,
			@Param("start") Integer start, @Param("offset") Integer offset);

	List<MusicDetail> searchMusic(
			@Param("keywordList") List<String> keywordList,
			@Param("start") Integer start, @Param("offset") Integer offset);

	List<ActivityDetail> searchActivity(@Param("keywordList") List<String> keywordList,
			@Param("start") Integer start, @Param("offset") Integer offset);

	String findDescription(@Param("column")String column, @Param("id")Integer id);

	Boolean checkIsEssence(@Param("column")String column,@Param("id") Integer id);

	List<Book> findBookByColumnDescription(@Param("topCount")Integer topCount,@Param("colDesc")String colDesc);

	List<Music> findMusicByColumnDescription(@Param("topCount")Integer topCount,@Param("colDesc")String colDesc);

	List<Film> findFilmByColumnDescription(@Param("topCount")Integer topCount,@Param("colDesc")String colDesc);

}
