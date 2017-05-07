package cn.poi591.secc.web;

import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.poi591.secc.constant.Path;
import cn.poi591.secc.dto.FilmReviewAndUser;
import cn.poi591.secc.dto.FilmScore;
import cn.poi591.secc.entity.Film;
import cn.poi591.secc.entity.FilmReview;
import cn.poi591.secc.entity.User;
import cn.poi591.secc.service.impl.FilmServiceImpl;

@Controller
@RequestMapping("/film")
public class FilmController {
	@Autowired
	private FilmServiceImpl filmService;

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
		// 调用服务储存影评
		filmService.addFilmReview(filmReview);

		// 向页面储存参数，页面跳转
		ModelAndView mv = new ModelAndView(Path.JSP_FILM
				+ "/success/new_review_submit");
		return mv;
	}

	/**
	 * 跳转到创建新影评的页面
	 */
	@RequestMapping("/{id}/new_review")
	public ModelAndView newReview(@PathVariable Integer id,
			HttpServletRequest request) {
		Film mainFilm = filmService.findFilmById(id);
		// 判断是否有登录用户
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		// 向页面储存参数，页面跳转
		ModelAndView mv = new ModelAndView();
		if (loginUser == null) {
			// 没有登录，跳转到登录
			mv.setViewName(Path.JSP_USER + "/login");
		} else {
			// 有登录用户，跳转到影评
			mv.setViewName(Path.JSP_FILM + "/new_review");
		}
		// 向页面储存参数，页面跳转
		mv.addObject("mainFilm", mainFilm);
		return mv;
	}

	/**
	 * 电影展示页面
	 */
	@RequestMapping("/{id}")
	public ModelAndView filmShow(@PathVariable Integer id) {
		/**
		 * 页面所需的参数：电影、评分、影评
		 */
		// 电影
		Film mainFilm = filmService.findFilmById(id);
		mainFilm.setIntro(mainFilm.getIntro().replaceAll("\n", "<br/>"));// 影评内容换行处理
		// 评分
		FilmScore mainScore = filmService.getFilmScore(mainFilm);
		// 影评
		List<FilmReviewAndUser> reviewList = filmService.getFilmReviewAndUserList(mainFilm);
		/**
		 * 
		 */
		// 存入页面
		ModelAndView mv = new ModelAndView(Path.JSP_FILM + "/show");
		mv.addObject("mainFilm", mainFilm);
		mv.addObject("mainScore", mainScore);
		mv.addObject("reviewList", reviewList);
		return mv;
	}

	/**
	 * 处理提交的新电影参数
	 * 
	 * @return 成功提交页面
	 */
	@RequestMapping("/submit")
	public String filmSubmit(Film film) {
		// 检查参数
		// 存入数据库
		filmService.addFilm(film);
		return Path.JSP_FILM + "/success/new_film_submit";
	}

	/**
	 * 跳转到添加新电影的页面
	 */
	@RequestMapping("/new")
	public String newFilm() {
		return Path.JSP_FILM + "/new";
	}
}
