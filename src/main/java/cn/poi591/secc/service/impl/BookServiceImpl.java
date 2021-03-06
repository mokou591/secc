package cn.poi591.secc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.poi591.secc.dao.BookDao;
import cn.poi591.secc.dao.BookReviewDao;
import cn.poi591.secc.dto.BookReviewDetail;
import cn.poi591.secc.dto.BookScore;
import cn.poi591.secc.dto.ReplyDetail;
import cn.poi591.secc.entity.Book;
import cn.poi591.secc.entity.BookReview;
import cn.poi591.secc.entity.Reply;
import cn.poi591.secc.entity.User;
import cn.poi591.secc.service.BookService;

@Service
public class BookServiceImpl implements   BookService {

	@Autowired
	private BookDao bookDao;

	@Autowired
	private BookReviewDao bookReviewDao;

	@Override
	public void addBook(Book book) {
		bookDao.add(book);
	}

	@Override
	public Book findBookById(Integer id) {
		return bookDao.findById(id);
	}

	/**
	 * 添加一篇书评
	 * 
	 * @param bookReview
	 */
	@Override
	public Integer addBookReview(BookReview bookReview) {
		return	bookReviewDao.add(bookReview);
	}

	/**
	 * 获取书的评分信息
	 * 
	 * @param mainBook
	 * @return
	 */
	@Override
	public BookScore getBookScore(Book book) {
		return bookReviewDao.getBookScore(book);
	}

	/**
	 * 查询书的所有书评，返回的集合包含的对象有书评信息和作者引用。
	 * 
	 * @param mainBook
	 * @return 一个 集合
	 */
	@Override
	public List<BookReviewDetail> getBookReviewDetailBest(Book book,Integer start,Integer offset) {
		return bookReviewDao.getBookReviewDetailBest(book,start,offset);
	}

	/**
	 * 获取用户的一篇书评
	 * @param mainBook 
	 * 
	 * @param loginUser
	 * @return
	 */
	@Override
	public BookReview getBookReview(Book book, User user) {
		return bookReviewDao.getBookReview(book ,user);
	}

	/**
	 * 获取当前书的书评总数
	 * 
	 * @param book
	 * @return
	 */
	@Override
	public Integer getBookReviewCount(Book book) {
		return bookReviewDao.getBookReviewCount(book);
	}

	@Override
	public List<BookReviewDetail> getBookReviewDetailLatest(Book book,
			Integer start, Integer offset) {
		return bookReviewDao.getBookReviewDetailLatest(book, start, offset);
	}

	@Override
	public boolean checkBookReviewOOXXExist(BookReview bookReview,
			User loginUser) {
		return bookReviewDao.checkBookReviewOOXXExist(bookReview, loginUser);
	}

	@Override
	public boolean addBookReviewOOXX(BookReview bookReview, User loginUser,
			String type) {
		return bookReviewDao.addBookReviewOOXX(bookReview, loginUser, type);
	}
	
	@Override
	public BookReviewDetail findBookReviewDetailById(Integer reviewId) {
		return bookReviewDao.findBookReviewDetailById(reviewId);
	}
	
	@Override
	public Book findBookByOriginalName(String originalName) {
		return bookDao.findByOriginalName(originalName);
	}

	@Override
	public List<Book> findBookListByGenre(String genre,Integer start,Integer offset) {
		return bookDao.findBookListByGenre(genre,start ,offset);
	}

	@Override
	public List<Book> findBookRandom(Integer count) {
		return bookDao.findBookRandom(count);
	}

	@Override
	public List<BookReviewDetail> findBookReviewDetailRandom(Integer count) {
		return bookReviewDao.findBookReviewDetailRandom(count);
	}
	
	@Override
	public List<ReplyDetail> findReviewReplyDetailNatural(
			BookReview review,Integer start, Integer offset) {
		return bookReviewDao.findBookReviewReplyDetailNatural(review,start,offset);
	}

	@Override
	public void addBookReviewReply(Reply reply) {
		bookReviewDao.addBookReviewReply(reply);
	}

	@Override
	public BookReview findBookReviewById(Integer id) {
		return bookReviewDao.findBookReviewById(id);
	}

}
