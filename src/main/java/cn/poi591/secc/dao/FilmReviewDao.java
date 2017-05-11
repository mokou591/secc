package cn.poi591.secc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.poi591.secc.dto.FilmReviewDetail;
import cn.poi591.secc.dto.FilmScore;
import cn.poi591.secc.dto.Vote;
import cn.poi591.secc.entity.Film;
import cn.poi591.secc.entity.FilmReview;
import cn.poi591.secc.entity.User;

public interface FilmReviewDao {

	/**
	 * 向数据库添加一篇影评
	 * 
	 * @param filmReview
	 */
	Integer add(FilmReview filmReview);

	/**
	 * 查出电影的评分信息
	 * 
	 * @param film
	 * @return
	 */
	FilmScore getFilmScore(Film film);


	/**
	 * 查找指定电影的所有影评
	 */
	List<FilmReview> findFilmReviewByFilm(Film film);

	/**
	 * 找到影评的作者。 根据影评找到用户。
	 * 
	 * @return
	 */
	User findUserByFilmReview(FilmReview review);

	/**
	 * 根据电影和作者找到一篇影评
	 * 
	 * @param loginUser
	 * @return
	 */
	FilmReview getFilmReview(@Param("film") Film film,@Param("user") User user);

	/**
	 * 获取当前电影的影评总数
	 * 
	 * @param film
	 * @return
	 */
	Integer getFilmReviewCount(Film film);

	/**
	 * 根据电影查询影评，根据时间从新到旧排序，需要设置起始位置和查询项数。
	 * 
	 * @return
	 */
	List<FilmReviewDetail> getFilmReviewDetailLatest(
			@Param("film") Film film, @Param("start") Integer start,
			@Param("offset") Integer offset);

	/**
	 * 获取当前电影的最好影评，需要设置起始位置和查询项数
	 * 
	 * @return
	 */
	List<FilmReviewDetail> getFilmReviewDetailBest(
			@Param("film") Film film, @Param("start") Integer start,
			@Param("offset") Integer offset);
	
	/**
	 * 检查用户是否已经评论过影评
	 * 
	 * @param filmReview
	 * @param loginUser
	 * @return
	 */
	boolean checkFilmReviewOOXXExist(
			@Param("filmReview") FilmReview filmReview,
			@Param("user") User loginUser);

	/**
	 * 添加一个影评被用户评价的关系
	 * @param filmReview
	 * @param loginUser
	 * @param type
	 * @return
	 */
	boolean addFilmReviewOOXX(@Param("filmReview") FilmReview filmReview,
			@Param("user") User loginUser, @Param("type") String type);

	/**
	 * 根据电影id获取用户投票
	 * @param filmId
	 * @return
	 */
	Vote getVoteByFilmReviewId(@Param("filmReviewId") Integer filmReviewId);

	/**
	 * 根据影评id查询详细影评数据
	 * @param reviewId
	 * @return
	 */
	FilmReviewDetail findFilmReviewDetailById(Integer reviewId);
	
	/**
	 * 随机查询出若干影评
	 * @param count
	 * @return
	 */
	List<FilmReviewDetail> findFilmReviewDetailRandom(Integer count);
}
