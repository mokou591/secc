package cn.poi591.secc.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.poi591.secc.constant.Page;
import cn.poi591.secc.constant.Path;
import cn.poi591.secc.entity.User;
import cn.poi591.secc.service.AdminService;
import cn.poi591.secc.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;

	@Autowired
	private UserService userService;

	/**
	 * 设置为精华，或取消设置
	 * 
	 * @return
	 */
	@RequestMapping("/{column}/{reviewId}/setEssence/{whether}")
	public String setEssence(@PathVariable String column,
			@PathVariable Integer reviewId, @PathVariable String whether) {
		switch (whether) {
		case "is":
			adminService.addEssence(column, reviewId);
			break;
		case "not":
			adminService.deleteEssence(column, reviewId);
			break;
		default:
		}
		return "redirect:/" + column + "/review/" + reviewId;
	}

	/**
	 * 设置为新品和热门
	 * 
	 * @return
	 */
	@RequestMapping("/{column}/{id}/delete/{description}")
	public String delDescription(@PathVariable String column,
			@PathVariable Integer id, @PathVariable String description) {
		adminService.deleteColumnDescription(column, id, description);
		return "redirect:/" + column + "/" + id;
	}

	/**
	 * 设置为新品和热门
	 * 
	 * @return
	 */
	@RequestMapping("/{column}/{id}/set/{description}")
	public String setDescription(HttpSession session,
			@PathVariable String column, @PathVariable Integer id,
			@PathVariable String description) {
		adminService.addColumnDescription(column, id, description);
		return "redirect:/" + column + "/" + id;
	}

	/**
	 * 操作户外活动
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/activity/{activityId}/{operation}")
	public String passActivity(HttpSession session,
			@PathVariable Integer activityId, @PathVariable String operation) {
		// 权限检查
		if (!adminService.checkUserAuthorityExist(session)) {
			return "/index";
		}
		// 审核通过
		switch (operation) {
		case "pass":
			adminService.checkActivityById(activityId);
			break;
		case "delete":
			adminService.deleteActivityById(activityId);
			break;
		default:
		}
		// 跳转展示
		return "forward:/admin/activity";
	}

	/**
	 * 操作音乐
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/music/{musicId}/{operation}")
	public String passMusic(HttpSession session, @PathVariable Integer musicId,
			@PathVariable String operation) {
		// 权限检查
		if (!adminService.checkUserAuthorityExist(session)) {
			return "/index";
		}
		// 审核通过
		switch (operation) {
		case "pass":
			adminService.checkMusicById(musicId);
			break;
		case "delete":
			adminService.deleteMusicById(musicId);
			break;
		default:
		}
		// 跳转展示
		return "forward:/admin/music";
	}

	/**
	 * 操作书本
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/book/{bookId}/{operation}")
	public String passBook(HttpSession session, @PathVariable Integer bookId,
			@PathVariable String operation) {
		// 权限检查
		if (!adminService.checkUserAuthorityExist(session)) {
			return "/index";
		}
		// 审核通过
		switch (operation) {
		case "pass":
			adminService.checkBookById(bookId);
			break;
		case "delete":
			adminService.deleteBookById(bookId);
			break;
		default:
		}
		// 跳转展示
		return "forward:/admin/book";
	}

	/**
	 * 操作电影
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/film/{filmId}/{operation}")
	public String passFilm(HttpSession session, @PathVariable Integer filmId,
			@PathVariable String operation) {
		// 权限检查
		if (!adminService.checkUserAuthorityExist(session)) {
			return "/index";
		}
		// 审核通过
		switch (operation) {
		case "pass":
			adminService.checkFilmById(filmId);
			break;
		case "delete":
			adminService.deleteFilmById(filmId);
			break;
		default:
		}
		// 跳转展示
		return "forward:/admin/film";
	}

	/**
	 * 根据四个模块的名字为路径跳转到管理页面
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/{entry}")
	public ModelAndView adminFilm(HttpSession session,
			@PathVariable String entry) {
		// 权限检查
		if (!adminService.checkUserAuthorityExist(session)) {
			return new ModelAndView("/index");
		}
		// 查询数据
		Integer topCount = 50;
		List list = new ArrayList();
		switch (entry) {
		case "film":
			list = adminService.findNonCheckedFilm(0, topCount);
			break;
		case "music":
			list = adminService.findNonCheckedMusic(0, topCount);
			break;
		case "book":
			list = adminService.findNonCheckedBook(0, topCount);
			break;
		case "activity":
			list = adminService.findNonCheckedActivity(0, topCount);
			break;
		default:
		}
		// 跳转展示
		ModelAndView mv = new ModelAndView(Path.JSP_ADMIN + "/" + entry
				+ "_manage");
		mv.addObject("nonCheckedlist", list);
		return mv;
	}

	/**
	 * 管理人员登录后，跳转到管理功能的主页
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/")
	public ModelAndView indexPage(HttpSession session) {
		// 权限检查
		ModelAndView mv = new ModelAndView("/index");
		if (!adminService.checkUserAuthorityExist(session)) {
			return mv;
		}
		// 进入管理人员主页
		mv.setViewName(Path.JSP_ADMIN + "/admin_index");
		return mv;
	}

	/**
	 * 登陆页面，会在session中加入用户权限，供管理人员登录
	 */
	@RequestMapping("/login_submit")
	public String adminLoginUser(User inputUser, HttpSession session) {
		// 检查用户是否可登录
		User user = userService.login(inputUser.getUsername(),
				inputUser.getPassword());
		String authority = userService.findUserAuthority(user);
		// 判断是否加入权限
		if (user == null || authority == null) {
			// 回到进阶登录页
			return Path.JSP_ADMIN + "/login_admin";
		} else {
			session.setAttribute(Page.LOGIN_USER, user);
			// 能成功登录，加入权限

			session.setAttribute(Page.USER_AUTHORITY, authority);
		}
		// 跳转到管理人员用的主页
		return "forward:/admin/";
	}

	/**
	 * 跳转到进阶的登陆页面，供工作、管理人员用
	 */
	@RequestMapping("/login")
	public String loginAdvanced() {
		return Path.JSP_ADMIN + "/login_admin";
	}
}
