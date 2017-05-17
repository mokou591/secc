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
import cn.poi591.secc.dto.FilmReviewDetail;
import cn.poi591.secc.dto.FilmScore;
import cn.poi591.secc.dto.Paging;
import cn.poi591.secc.dto.ReplyDetail;
import cn.poi591.secc.entity.Film;
import cn.poi591.secc.entity.FilmReview;
import cn.poi591.secc.entity.Reply;
import cn.poi591.secc.entity.User;
import cn.poi591.secc.service.FilmService;
import cn.poi591.secc.service.SearchService;

@Controller
@RequestMapping("/film")
public class FilmController {
	@Autowired
	private FilmService filmService;

	@Autowired
	private SearchService searchService;

	@RequestMapping("/genre/{genre}")
	@ResponseBody
	public ModelAndView findByGenre(@PathVariable String genre) {
		// 参数检查
		List<Film> filmList;
		if (genre.equals("随机")) {
			filmList = filmService.findFilmRandom(8);
		} else {
			filmList = filmService.findFilmListByGenre(genre, 0, 8);
		}
		// 存入参数，页面跳转
		ModelAndView mv = new ModelAndView(Path.JSP_FILM
				+ "/ajax/find_by_genre");
		mv.addObject("filmList", filmList);
		return mv;
	}

	/**
	 * 跳转至电影主页
	 * 
	 * @return
	 */
	@RequestMapping(value = { "", "/index" })
	public ModelAndView filmIndex() {
		// 正在热映
		List<Film> hotFilmList = filmService.findFilmRandom(4);
		// 最新影评
		List<FilmReviewDetail> hotReviewDetailList = filmService
				.findFilmReviewDetailRandom(5);
		// 存入参数，页面跳转
		ModelAndView mv = new ModelAndView(Path.JSP_FILM + "/index_film");
		mv.addObject("hotFilmList", hotFilmList);
		mv.addObject("hotReviewDetailList", hotReviewDetailList);
		return mv;
	}

	/**
	 * 跳转到电影的所有影评页面
	 * 
	 * @return
	 */
	@RequestMapping("/{filmId}/review/latest/{page}")
	public ModelAndView filmAllReview(@PathVariable Integer filmId,
			@PathVariable Integer page) {
		// 访问失败的跳转页面
		ModelAndView mv = new ModelAndView("/index");
		// 电影对象
		Film mainFilm = filmService.findFilmById(filmId);
		// 查询影评总数
		Integer filmReviewCount = filmService.getFilmReviewCount(mainFilm);
		// 分页所需参数
		final Integer PAGE_ITEM_COUNT = Review.PAGE_ITEM_COUNT;
		int maxPage = (int) Math.ceil(filmReviewCount * 1.0f / PAGE_ITEM_COUNT);
		// 判断页码是否正确
		if (maxPage != 0 && (page < 1 || page > maxPage)) {
			return mv;
		}
		// 查询当页、一页数量的影评
		Integer start = (page - 1) * PAGE_ITEM_COUNT;
		List<FilmReviewDetail> filmReviewList = filmService
				.getFilmReviewDetailLatest(mainFilm, start, PAGE_ITEM_COUNT);
		// 分页模型
		Paging paging = new Paging();
		paging.setCurrent(page);
		paging.setMax(maxPage);
		paging.setMin(1);
		paging.setHasPrev(page == 1 ? false : true);
		paging.setHasNext(page == maxPage ? false : true);
		paging.generatePageList();
		// 向页面添加参数
		mv.addObject("mainFilm", mainFilm);
		mv.addObject("reviewList", filmReviewList);
		mv.addObject("reviewCount", filmReviewCount);
		mv.addObject("paging", paging);
		// 跳转到全部影评页面
		mv.setViewName(Path.JSP_FILM + "/film_review_latest");
		return mv;
	}

	/**
	 * 处理影评的回复。
	 * 
	 * @param noteId
	 * @return
	 */
	@RequestMapping("/review/{reviewId}/reply_submit")
	public String filmReviewReply(@PathVariable Integer reviewId, Reply reply) {
		// 参数检查
		FilmReview reivew = filmService.findFilmReviewById(reviewId);
		// 保存回复
		filmService.addFilmReviewReply(reply);
		// 转发到单篇讨论的页面
		return "forward:" + Path.JSP_FILM_REVIEW + "/" + reivew.getId();
	}

	/**
	 * 跳转至展示单篇影评。
	 * 
	 * @param filmId
	 * @param reviewId
	 * @return
	 */
	@RequestMapping("/review/{reviewId}")
	public ModelAndView showFilmReview(@PathVariable Integer reviewId) {
		// 查询出详细影评
		FilmReviewDetail reviewDetail = filmService
				.findFilmReviewDetailById(reviewId);
		// 查询回复列表
		List<ReplyDetail> replyDetailList = filmService
				.findReviewReplyDetailNatural(reviewDetail, 0, 30);
		// 查询是不是精华
		Boolean isEssence = searchService.checkIsEssence("film",
				reviewDetail.getId());
		// 跳转页面
		ModelAndView mv = new ModelAndView(Path.JSP_FILM + "/film_review_show");
		mv.addObject("review", reviewDetail);
		mv.addObject("replyDetailList", replyDetailList);
		mv.addObject("isEssence", isEssence);
		return mv;
	}

	/**
	 * 处理ajax提交的对影评点赞或踩的评价
	 * 
	 * @param filmId
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
		FilmReview filmReview = new FilmReview();
		filmReview.setId(reviewId);
		boolean hasDone = filmService.checkFilmReviewOOXXExist(filmReview,
				loginUser);
		if (hasDone) {
			return "hasDone";
		}
		// 保存评价
		filmService.addFilmReviewOOXX(filmReview, loginUser, type);
		return "success";
	}

	/**
	 * 提交新的影评
	 */
	@RequestMapping("/review_submit")
	public ModelAndView reviewSubmit(FilmReview filmReview) {
		// 参数判断和转换
		if (filmReview.getIsSpoiler() == null) {
			filmReview.setIsSpoiler(false);
		}
		if (filmReview.getIsPrivate() == null) {
			filmReview.setIsPrivate(false);
		}
		// 储存影评
		filmService.addFilmReview(filmReview);
		// 向页面储存参数，页面跳转
		ModelAndView mv = new ModelAndView(Path.JSP_FILM
				+ "/success/film_review_submit");
		mv.addObject("filmReview", filmReview);
		return mv;
	}

	/**
	 * 跳转到创建新影评的页面
	 */
	@RequestMapping("/{id}/review_new")
	public ModelAndView newReview(@PathVariable Integer id, HttpSession session) {
		Film mainFilm = filmService.findFilmById(id);
		// 判断是否有登录用户
		User loginUser = (User) session.getAttribute("loginUser");
		// 向页面储存参数，页面跳转
		ModelAndView mv = new ModelAndView();
		if (loginUser == null) {
			// 没有登录，跳转到登录
			mv.setViewName(Path.JSP_USER + "/login");
			// 存入登录前页面，登录后可以跳转回来
			session.setAttribute(Page.LOGIN_PREV, "/film/" + id);
		} else {
			// 有登录用户，跳转到创建新影评页面
			mv.setViewName(Path.JSP_FILM + "/film_review_new");
		}
		// 向页面储存参数，页面跳转
		mv.addObject("mainFilm", mainFilm);
		return mv;
	}

	/**
	 * 电影展示页面
	 */
	@RequestMapping("/{id}")
	public ModelAndView filmShow(@PathVariable Integer id, HttpSession session) {
		/**
		 * 页面所需的参数：电影、评分、影评、用户评分
		 */
		// 电影
		Film mainFilm = filmService.findFilmById(id);
		// 评分
		FilmScore mainScore = filmService.getFilmScore(mainFilm);
		// 影评
		List<FilmReviewDetail> reviewList = filmService
				.getFilmReviewDetailBest(mainFilm, 0, 5);
		Integer reviewListLength = reviewList.size();
		// 用户评分
		Integer loginUserScore = null;
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser != null) {// 有登录用户
			FilmReview filmReview = filmService.getFilmReview(mainFilm,
					loginUser);
			if (filmReview != null) {// 用户有评分
				loginUserScore = filmReview.getScore();
			}
		}
		// 是否为新品热门
		String description = searchService.findDescription("film", id);
		Boolean idHotnew = false;
		if (description != null) {
			idHotnew = description.equals("hotnew");
		}
		/**
		 * 
		 */
		// 存入页面
		ModelAndView mv = new ModelAndView(Path.JSP_FILM + "/film_show");
		mv.addObject("mainFilm", mainFilm);
		mv.addObject("mainScore", mainScore);
		mv.addObject("reviewList", reviewList);
		mv.addObject("reviewListLength", reviewListLength);
		mv.addObject("loginUserScore", loginUserScore);
		mv.addObject("idHotnew", idHotnew);
		return mv;
	}

	/**
	 * 处理提交的新电影参数
	 * 
	 * @return 成功提交页面
	 */
	@RequestMapping("/submit")
	public ModelAndView filmSubmit(Film film) {
		// 检查参数

		// 存入数据库
		filmService.addFilm(film);

		ModelAndView mv = new ModelAndView(Path.JSP_FILM
				+ "/success/film_submit");
		mv.addObject("mainFilm", film);
		return mv;
	}

	/**
	 * 跳转到添加新电影的页面
	 */
	@RequestMapping("/new")
	public String newFilm() {
		return Path.JSP_FILM + "/film_new";
	}
}
