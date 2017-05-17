package cn.poi591.secc.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.poi591.secc.constant.Page;
import cn.poi591.secc.constant.Path;
import cn.poi591.secc.constant.Review;
import cn.poi591.secc.dto.BookReviewDetail;
import cn.poi591.secc.dto.BookScore;
import cn.poi591.secc.dto.Paging;
import cn.poi591.secc.dto.ReplyDetail;
import cn.poi591.secc.entity.Book;
import cn.poi591.secc.entity.BookReview;
import cn.poi591.secc.entity.Reply;
import cn.poi591.secc.entity.User;
import cn.poi591.secc.service.BookService;
import cn.poi591.secc.service.SearchService;

@Controller
@RequestMapping("/book")
public class BookController {
	@Autowired
	private BookService bookService;

	@Autowired
	private SearchService searchService;
	
	/**
	 * 根据类型查询
	 * 
	 * @param genre
	 * @return
	 */
	@RequestMapping("/genre/{genre}")
	@ResponseBody
	public ModelAndView findByGenre(@PathVariable String genre) {
		// 参数检查
		List<Book> bookList;
		if (genre.equals("随机")) {
			bookList = bookService.findBookRandom(8);
		} else {
			bookList = bookService.findBookListByGenre(genre, 0, 8);
		}
		// 存入参数，页面跳转
		ModelAndView mv = new ModelAndView(Path.JSP_BOOK
				+ "/ajax/find_by_genre");
		mv.addObject("bookList", bookList);
		return mv;
	}

	/**
	 * 跳转至书主页
	 * 
	 * @return
	 */
	@RequestMapping(value = { "", "/index" })
	public ModelAndView bookIndex() {
		// 正在热映
		List<Book> hotBookList = bookService.findBookRandom(8);
		// 最新书评
		List<BookReviewDetail> hotReviewDetailList = bookService
				.findBookReviewDetailRandom(8);
		// 存入参数，页面跳转
		ModelAndView mv = new ModelAndView(Path.JSP_BOOK + "/index_book");
		mv.addObject("hotBookList", hotBookList);
		mv.addObject("hotReviewDetailList", hotReviewDetailList);
		return mv;
	}

	/**
	 * 跳转到书的所有书评页面
	 * 
	 * @return
	 */
	@RequestMapping("/{bookId}/review/latest/{page}")
	public ModelAndView bookAllReview(@PathVariable Integer bookId,
			@PathVariable Integer page) {
		// 访问失败的跳转页面
		ModelAndView mv = new ModelAndView("/index");
		// 书对象
		Book mainBook = bookService.findBookById(bookId);
		// 查询书评总数
		Integer bookReviewCount = bookService.getBookReviewCount(mainBook);
		// 分页所需参数
		final Integer PAGE_ITEM_COUNT = Review.PAGE_ITEM_COUNT;
		int maxPage = (int) Math.ceil(bookReviewCount * 1.0f / PAGE_ITEM_COUNT);
		// 判断页码是否正确
		if (maxPage != 0 && (page < 1 || page > maxPage)) {
			return mv;
		}
		// 查询当页、一页数量的书评
		Integer start = (page - 1) * PAGE_ITEM_COUNT;
		List<BookReviewDetail> bookReviewList = bookService
				.getBookReviewDetailLatest(mainBook, start, PAGE_ITEM_COUNT);
		// 分页模型
		Paging paging = new Paging();
		paging.setCurrent(page);
		paging.setMax(maxPage);
		paging.setMin(1);
		paging.setHasPrev(page == 1 ? false : true);
		paging.setHasNext(page == maxPage ? false : true);
		paging.generatePageList();
		// 向页面添加参数
		mv.addObject("mainBook", mainBook);
		mv.addObject("reviewList", bookReviewList);
		mv.addObject("reviewCount", bookReviewCount);
		mv.addObject("paging", paging);
		// 跳转到全部书评页面
		mv.setViewName(Path.JSP_BOOK + "/book_review_latest");
		return mv;
	}

	/**
	 * 处理书评的回复。
	 * 
	 * @param noteId
	 * @return
	 */
	@RequestMapping("/review/{reviewId}/reply_submit")
	public String bookReviewReply(@PathVariable Integer reviewId, Reply reply) {
		// 参数检查
		BookReview reivew = bookService.findBookReviewById(reviewId);
		// 保存回复
		bookService.addBookReviewReply(reply);
		// 转发到单篇讨论的页面
		return "forward:" + Path.JSP_BOOK_REVIEW + "/" + reivew.getId();
	}

	/**
	 * 跳转至展示单篇书评。
	 * 
	 * @param bookId
	 * @param reviewId
	 * @return
	 */
	@RequestMapping("/review/{reviewId}")
	public ModelAndView showBookReview(@PathVariable Integer reviewId) {
		// 查询出详细书评
		BookReviewDetail reviewDetail = bookService
				.findBookReviewDetailById(reviewId);
		// 查询回复列表
		List<ReplyDetail> replyDetailList = bookService
				.findReviewReplyDetailNatural(reviewDetail, 0, 30);
		//查询是不是精华
		Boolean isEssence = searchService.checkIsEssence("book",reviewDetail.getId());
		// 跳转页面
		ModelAndView mv = new ModelAndView(Path.JSP_BOOK + "/book_review_show");
		mv.addObject("review", reviewDetail);
		mv.addObject("replyDetailList", replyDetailList);
		mv.addObject("isEssence", isEssence);
		return mv;
	}

	/**
	 * 处理ajax提交的对书评点赞或踩的评价
	 * 
	 * @param bookId
	 * @param page
	 * @return
	 */
	@RequestMapping("/review/{reviewId}/{type}")
	public @ResponseBody
	String reviewVote(@PathVariable Integer reviewId,
			@PathVariable String type, HttpSession session) {
		// 检查是否有登录用户
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "needToLogin";
		}
		// 检查是否已经评价过
		BookReview bookReview = new BookReview();
		bookReview.setId(reviewId);
		boolean hasDone = bookService.checkBookReviewOOXXExist(bookReview,
				loginUser);
		if (hasDone) {
			return "hasDone";
		}
		// 保存评价
		bookService.addBookReviewOOXX(bookReview, loginUser, type);
		return "success";
	}

	/**
	 * 提交新的书评
	 */
	@RequestMapping("/review_submit")
	public ModelAndView reviewSubmit(BookReview bookReview) {
		// 参数判断和转换
		if (bookReview.getIsSpoiler() == null) {
			bookReview.setIsSpoiler(false);
		}
		if (bookReview.getIsPrivate() == null) {
			bookReview.setIsPrivate(false);
		}
		// 储存书评
		bookService.addBookReview(bookReview);
		// 向页面储存参数，页面跳转
		ModelAndView mv = new ModelAndView(Path.JSP_BOOK
				+ "/success/book_review_submit");
		mv.addObject("bookReview", bookReview);
		return mv;
	}

	/**
	 * 跳转到创建新书评的页面
	 */
	@RequestMapping("/{id}/review_new")
	public ModelAndView newReview(@PathVariable Integer id, HttpSession session) {
		Book mainBook = bookService.findBookById(id);
		// 判断是否有登录用户
		User loginUser = (User) session.getAttribute("loginUser");
		// 向页面储存参数，页面跳转
		ModelAndView mv = new ModelAndView();
		if (loginUser == null) {
			// 没有登录，跳转到登录
			mv.setViewName(Path.JSP_USER + "/login");
			// 存入登录前页面，登录后可以跳转回来
			session.setAttribute(Page.LOGIN_PREV, "/book/" + id);
		} else {
			// 有登录用户，跳转到创建新书评页面
			mv.setViewName(Path.JSP_BOOK + "/book_review_new");
		}
		// 向页面储存参数，页面跳转
		mv.addObject("mainBook", mainBook);
		return mv;
	}

	/**
	 * 书展示页面
	 */
	@RequestMapping("/{id}")
	public ModelAndView bookShow(@PathVariable Integer id, HttpSession session) {
		/**
		 * 页面所需的参数：书、评分、书评、用户评分
		 */
		// 书
		Book mainBook = bookService.findBookById(id);
		// 评分
		BookScore mainScore = bookService.getBookScore(mainBook);
		// 书评
		List<BookReviewDetail> reviewList = bookService
				.getBookReviewDetailBest(mainBook, 0, 5);
		Integer reviewListLength = reviewList.size();
		// 用户评分
		Integer loginUserScore = null;
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser != null) {// 有登录用户
			BookReview bookReview = bookService.getBookReview(mainBook,
					loginUser);
			if (bookReview != null) {// 用户有评分
				loginUserScore = bookReview.getScore();
			}
		}
		// 是否为新品热门
		String description = searchService.findDescription("book", id);
		Boolean idHotnew = false;
		if (description != null) {
			idHotnew = description.equals("hotnew");
		}
		/**
		 * 
		 */
		// 存入页面
		ModelAndView mv = new ModelAndView(Path.JSP_BOOK + "/book_show");
		mv.addObject("mainBook", mainBook);
		mv.addObject("mainScore", mainScore);
		mv.addObject("reviewList", reviewList);
		mv.addObject("reviewListLength", reviewListLength);
		mv.addObject("loginUserScore", loginUserScore);
		mv.addObject("idHotnew", idHotnew);
		return mv;
	}

	/**
	 * 处理提交的新书参数
	 * 
	 * @return 成功提交页面
	 */
	@RequestMapping("/submit")
	public ModelAndView bookSubmit(Book book) {
		// 检查参数

		// 存入数据库
		bookService.addBook(book);

		ModelAndView mv = new ModelAndView(Path.JSP_BOOK
				+ "/success/book_submit");
		mv.addObject("mainBook", book);
		return mv;
	}

	/**
	 * 跳转到添加新书的页面
	 */
	@RequestMapping("/new")
	public String newBook() {
		return Path.JSP_BOOK + "/book_new";
	}
}
