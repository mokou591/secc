package cn.poi591.secc.service;

import java.util.List;

import cn.poi591.secc.dto.BookReviewDetail;
import cn.poi591.secc.dto.BookScore;
import cn.poi591.secc.dto.ReplyDetail;
import cn.poi591.secc.entity.Book;
import cn.poi591.secc.entity.BookReview;
import cn.poi591.secc.entity.Reply;
import cn.poi591.secc.entity.User;

public interface BookService {

	public void addBook(Book book);

	public Book findBookById(Integer id);

	/**
	 * 添加一篇书评
	 * 
	 * @param bookReview
	 */
	public Integer addBookReview(BookReview bookReview);

	/**
	 * 获取书的评分信息
	 * 
	 * @param mainBook
	 * @return
	 */
	public BookScore getBookScore(Book book);

	/**
	 * 查询书的所有书评，返回的集合包含的对象有书评信息和作者引用。
	 * 
	 * @param mainBook
	 * @return 一个 集合
	 */
	public List<BookReviewDetail> getBookReviewDetailBest(Book book,
			Integer start, Integer offset);

	/**
	 * 获取用户的一篇书评
	 * @param mainBook 
	 * 
	 * @param loginUser
	 * @return
	 */
	public BookReview getBookReview(Book book, User user);

	/**
	 * 获取当前书的书评总数
	 * 
	 * @param book
	 * @return
	 */
	public Integer getBookReviewCount(Book book);

	public List<BookReviewDetail> getBookReviewDetailLatest(Book book,
			Integer start, Integer offset);

	public boolean checkBookReviewOOXXExist(BookReview bookReview,
			User loginUser);

	public boolean addBookReviewOOXX(BookReview bookReview, User loginUser,
			String type);

	public BookReviewDetail findBookReviewDetailById(Integer reviewId);

	public Book findBookByOriginalName(String originalName);

	public List<Book> findBookListByGenre(String genre, Integer start,
			Integer offset);

	public List<Book> findBookRandom(Integer count);

	public List<BookReviewDetail> findBookReviewDetailRandom(Integer count);

	public List<ReplyDetail> findReviewReplyDetailNatural(BookReview review,
			Integer start, Integer offset);

	public void addBookReviewReply(Reply reply);

	public BookReview findBookReviewById(Integer id);

}