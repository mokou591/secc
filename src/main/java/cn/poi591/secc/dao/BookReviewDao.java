package cn.poi591.secc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.poi591.secc.dto.BookReviewDetail;
import cn.poi591.secc.dto.ReplyDetail;
import cn.poi591.secc.dto.BookScore;
import cn.poi591.secc.dto.Vote;
import cn.poi591.secc.entity.Book;
import cn.poi591.secc.entity.BookReview;
import cn.poi591.secc.entity.Reply;
import cn.poi591.secc.entity.User;

public interface BookReviewDao {

	/**
	 * 根据id查找书评
	 * @param reviewId
	 * @return
	 */
	BookReview findBookReviewById(Integer id);	
	
	/**
	 * 向数据库添加一篇书评
	 * 
	 * @param bookReview
	 */
	Integer add(BookReview bookReview);

	/**
	 * 查出书的评分信息
	 * 
	 * @param book
	 * @return
	 */
	BookScore getBookScore(Book book);


	/**
	 * 查找指定书的所有书评
	 */
	List<BookReview> findBookReviewByBook(Book book);

	/**
	 * 找到书评的作者。 根据书评找到用户。
	 * 
	 * @return
	 */
	User findUserByBookReview(BookReview review);

	/**
	 * 根据书和作者找到一篇书评
	 * 
	 * @param loginUser
	 * @return
	 */
	BookReview getBookReview(@Param("book") Book book,@Param("user") User user);

	/**
	 * 获取当前书的书评总数
	 * 
	 * @param book
	 * @return
	 */
	Integer getBookReviewCount(Book book);

	/**
	 * 根据书查询书评，根据时间从新到旧排序，需要设置起始位置和查询项数。
	 * 
	 * @return
	 */
	List<BookReviewDetail> getBookReviewDetailLatest(
			@Param("book") Book book, @Param("start") Integer start,
			@Param("offset") Integer offset);

	/**
	 * 获取当前书的最好书评，需要设置起始位置和查询项数
	 * 
	 * @return
	 */
	List<BookReviewDetail> getBookReviewDetailBest(
			@Param("book") Book book, @Param("start") Integer start,
			@Param("offset") Integer offset);
	
	/**
	 * 检查用户是否已经评论过书评
	 * 
	 * @param bookReview
	 * @param loginUser
	 * @return
	 */
	boolean checkBookReviewOOXXExist(
			@Param("bookReview") BookReview bookReview,
			@Param("user") User loginUser);

	/**
	 * 添加一个书评被用户评价的关系
	 * @param bookReview
	 * @param loginUser
	 * @param type
	 * @return
	 */
	boolean addBookReviewOOXX(@Param("bookReview") BookReview bookReview,
			@Param("user") User loginUser, @Param("type") String type);

	/**
	 * 根据书id获取用户投票
	 * @param bookId
	 * @return
	 */
	Vote getVoteByBookReviewId(@Param("bookReviewId") Integer bookReviewId);

	/**
	 * 根据书评id查询详细书评数据
	 * @param reviewId
	 * @return
	 */
	BookReviewDetail findBookReviewDetailById(Integer reviewId);
	
	/**
	 * 随机查询出若干书评
	 * @param count
	 * @return
	 */
	List<BookReviewDetail> findBookReviewDetailRandom(Integer count);

	/**
	 * 查询书评回复
	 * @param review
	 * @param start
	 * @param offset
	 * @return
	 */
	List<ReplyDetail> findBookReviewReplyDetailNatural(@Param("review")BookReview review,
			@Param("start")Integer start,@Param("offset") Integer offset);

	void addBookReviewReply(Reply reply);

	

}
