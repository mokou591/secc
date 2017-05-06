package cn.poi591.secc.dao;

import cn.poi591.secc.entity.FilmReview;

public interface FilmReviewDao {

	/**
	 * 向数据库添加一篇影评
	 * @param filmReview
	 */
	void add(FilmReview filmReview);

}
