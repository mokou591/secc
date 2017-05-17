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
import cn.poi591.secc.dto.MusicReviewDetail;
import cn.poi591.secc.dto.MusicScore;
import cn.poi591.secc.dto.Paging;
import cn.poi591.secc.dto.ReplyDetail;
import cn.poi591.secc.entity.Music;
import cn.poi591.secc.entity.MusicReview;
import cn.poi591.secc.entity.Reply;
import cn.poi591.secc.entity.User;
import cn.poi591.secc.service.MusicService;
import cn.poi591.secc.service.SearchService;

@Controller
@RequestMapping("/music")
public class MusicController {
	@Autowired
	private MusicService musicService;

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
		List<Music> musicList;
		if (genre.equals("随机")) {
			musicList = musicService.findMusicRandom(8);
		} else {
			musicList = musicService.findMusicListByGenre(genre, 0, 8);
		}
		// 存入参数，页面跳转
		ModelAndView mv = new ModelAndView(Path.JSP_MUSIC
				+ "/ajax/find_by_genre");
		mv.addObject("musicList", musicList);
		return mv;
	}

	/**
	 * 跳转至音乐主页
	 * 
	 * @return
	 */
	@RequestMapping(value = { "", "/index" })
	public ModelAndView musicIndex() {
		// 正在热映
		List<Music> hotMusicList = musicService.findMusicRandom(8);
		// 最新音乐评
		List<MusicReviewDetail> hotReviewDetailList = musicService
				.findMusicReviewDetailRandom(8);
		// 存入参数，页面跳转
		ModelAndView mv = new ModelAndView(Path.JSP_MUSIC + "/index_music");
		mv.addObject("hotMusicList", hotMusicList);
		mv.addObject("hotReviewDetailList", hotReviewDetailList);
		return mv;
	}

	/**
	 * 跳转到音乐的所有音乐评页面
	 * 
	 * @return
	 */
	@RequestMapping("/{musicId}/review/latest/{page}")
	public ModelAndView musicAllReview(@PathVariable Integer musicId,
			@PathVariable Integer page) {
		// 访问失败的跳转页面
		ModelAndView mv = new ModelAndView("/index");
		// 音乐对象
		Music mainMusic = musicService.findMusicById(musicId);
		// 查询音乐评总数
		Integer musicReviewCount = musicService.getMusicReviewCount(mainMusic);
		// 分页所需参数
		final Integer PAGE_ITEM_COUNT = Review.PAGE_ITEM_COUNT;
		int maxPage = (int) Math
				.ceil(musicReviewCount * 1.0f / PAGE_ITEM_COUNT);
		// 判断页码是否正确
		if (maxPage != 0 && (page < 1 || page > maxPage)) {
			return mv;
		}
		// 查询当页、一页数量的音乐评
		Integer start = (page - 1) * PAGE_ITEM_COUNT;
		List<MusicReviewDetail> musicReviewList = musicService
				.getMusicReviewDetailLatest(mainMusic, start, PAGE_ITEM_COUNT);
		// 分页模型
		Paging paging = new Paging();
		paging.setCurrent(page);
		paging.setMax(maxPage);
		paging.setMin(1);
		paging.setHasPrev(page == 1 ? false : true);
		paging.setHasNext(page == maxPage ? false : true);
		paging.generatePageList();
		// 向页面添加参数
		mv.addObject("mainMusic", mainMusic);
		mv.addObject("reviewList", musicReviewList);
		mv.addObject("reviewCount", musicReviewCount);
		mv.addObject("paging", paging);
		// 跳转到全部音乐评页面
		mv.setViewName(Path.JSP_MUSIC + "/music_review_latest");
		return mv;
	}

	/**
	 * 处理音乐评的回复。
	 * 
	 * @param noteId
	 * @return
	 */
	@RequestMapping("/review/{reviewId}/reply_submit")
	public String musicReviewReply(@PathVariable Integer reviewId, Reply reply) {
		// 参数检查
		MusicReview reivew = musicService.findMusicReviewById(reviewId);
		// 保存回复
		musicService.addMusicReviewReply(reply);
		// 转发到单篇讨论的页面
		return "forward:" + Path.JSP_MUSIC_REVIEW + "/" + reivew.getId();
	}

	/**
	 * 跳转至展示单篇音乐评。
	 * 
	 * @param musicId
	 * @param reviewId
	 * @return
	 */
	@RequestMapping("/review/{reviewId}")
	public ModelAndView showMusicReview(@PathVariable Integer reviewId) {
		// 查询出详细音乐评
		MusicReviewDetail reviewDetail = musicService
				.findMusicReviewDetailById(reviewId);
		// 查询回复列表
		List<ReplyDetail> replyDetailList = musicService
				.findReviewReplyDetailNatural(reviewDetail, 0, 30);
		// 查询是不是精华
		Boolean isEssence = searchService.checkIsEssence("music",
				reviewDetail.getId());
		// 跳转页面
		ModelAndView mv = new ModelAndView(Path.JSP_MUSIC
				+ "/music_review_show");
		mv.addObject("review", reviewDetail);
		mv.addObject("replyDetailList", replyDetailList);
		mv.addObject("isEssence", isEssence);
		return mv;
	}

	/**
	 * 处理ajax提交的对音乐评点赞或踩的评价
	 * 
	 * @param musicId
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
		MusicReview musicReview = new MusicReview();
		musicReview.setId(reviewId);
		boolean hasDone = musicService.checkMusicReviewOOXXExist(musicReview,
				loginUser);
		if (hasDone) {
			return "hasDone";
		}
		// 保存评价
		musicService.addMusicReviewOOXX(musicReview, loginUser, type);
		return "success";
	}

	/**
	 * 提交新的音乐评
	 */
	@RequestMapping("/review_submit")
	public ModelAndView reviewSubmit(MusicReview musicReview) {
		// 参数判断和转换
		if (musicReview.getIsPrivate() == null) {
			musicReview.setIsPrivate(false);
		}
		// 储存音乐评
		musicService.addMusicReview(musicReview);
		// 向页面储存参数，页面跳转
		ModelAndView mv = new ModelAndView(Path.JSP_MUSIC
				+ "/success/music_review_submit");
		mv.addObject("musicReview", musicReview);
		return mv;
	}

	/**
	 * 跳转到创建新音乐评的页面
	 */
	@RequestMapping("/{id}/review_new")
	public ModelAndView newReview(@PathVariable Integer id, HttpSession session) {
		Music mainMusic = musicService.findMusicById(id);
		// 判断是否有登录用户
		User loginUser = (User) session.getAttribute("loginUser");
		// 向页面储存参数，页面跳转
		ModelAndView mv = new ModelAndView();
		if (loginUser == null) {
			// 没有登录，跳转到登录
			mv.setViewName(Path.JSP_USER + "/login");
			// 存入登录前页面，登录后可以跳转回来
			session.setAttribute(Page.LOGIN_PREV, "/music/" + id);
		} else {
			// 有登录用户，跳转到创建新音乐评页面
			mv.setViewName(Path.JSP_MUSIC + "/music_review_new");
		}
		// 向页面储存参数，页面跳转
		mv.addObject("mainMusic", mainMusic);
		return mv;
	}

	/**
	 * 音乐展示页面
	 */
	@RequestMapping("/{id}")
	public ModelAndView musicShow(@PathVariable Integer id, HttpSession session) {
		/**
		 * 页面所需的参数：音乐、评分、音乐评、用户评分
		 */
		// 音乐
		Music mainMusic = musicService.findMusicById(id);
		// 评分
		MusicScore mainScore = musicService.getMusicScore(mainMusic);
		// 音乐评
		List<MusicReviewDetail> reviewList = musicService
				.getMusicReviewDetailBest(mainMusic, 0, 5);
		Integer reviewListLength = reviewList.size();
		// 用户评分
		Integer loginUserScore = null;
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser != null) {// 有登录用户
			MusicReview musicReview = musicService.getMusicReview(mainMusic,
					loginUser);
			if (musicReview != null) {// 用户有评分
				loginUserScore = musicReview.getScore();
			}
		}
		// 是否为新品热门
		String description = searchService.findDescription("music", id);
		Boolean idHotnew = false;
		if (description != null) {
			idHotnew = description.equals("hotnew");
		}
		/**
		 * 
		 */
		// 存入页面
		ModelAndView mv = new ModelAndView(Path.JSP_MUSIC + "/music_show");
		mv.addObject("mainMusic", mainMusic);
		mv.addObject("mainScore", mainScore);
		mv.addObject("reviewList", reviewList);
		mv.addObject("reviewListLength", reviewListLength);
		mv.addObject("loginUserScore", loginUserScore);
		mv.addObject("idHotnew", idHotnew);
		return mv;
	}

	/**
	 * 处理提交的新音乐参数
	 * 
	 * @return 成功提交页面
	 */
	@RequestMapping("/submit")
	public ModelAndView musicSubmit(Music music) {
		// 检查参数

		// 存入数据库
		musicService.addMusic(music);

		ModelAndView mv = new ModelAndView(Path.JSP_MUSIC
				+ "/success/music_submit");
		mv.addObject("mainMusic", music);
		return mv;
	}

	/**
	 * 跳转到添加新音乐的页面
	 */
	@RequestMapping("/new")
	public String newMusic() {
		return Path.JSP_MUSIC + "/music_new";
	}
}
