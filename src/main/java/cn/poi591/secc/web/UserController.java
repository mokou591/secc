package cn.poi591.secc.web;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.poi591.secc.constant.Page;
import cn.poi591.secc.constant.Path;
import cn.poi591.secc.dto.ActivityNoteDetail;
import cn.poi591.secc.dto.BookReviewDetail;
import cn.poi591.secc.dto.FilmReviewDetail;
import cn.poi591.secc.dto.MusicReviewDetail;
import cn.poi591.secc.entity.User;
import cn.poi591.secc.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	/**
	 * 跳转到注册页面
	 */
	@RequestMapping("/user/signup")
	public String signUp() {
		return Path.JSP_USER + "/signup";
	}

	/**
	 * 跳转到登录页面，可以附上登录成功后跳转的页面
	 */
	@RequestMapping("/user/login")
	public String login(HttpServletRequest request) {
		// 尝试获取登录前页面
		String loginPrevPage = request.getParameter("loginPrevPage");
		if (loginPrevPage != null) {
			// 如果有登录后希望跳转到的页面，则放入回话
			request.getSession().setAttribute(Page.LOGIN_PREV, loginPrevPage);
		}
		return Path.JSP_USER + "/login";
	}

	/**
	 * 处理注册用户的表单
	 */
	@RequestMapping("/user/register_submit")
	public ModelAndView registerUser(HttpServletRequest request) {
		// 获取参数
		String nickname = request.getParameter("nickname");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		// 参数校验

		// 封装用户
		User user = new User();
		user.setNickname(nickname);
		user.setUsername(username);
		user.setPassword(password);
		// 注册用户
		boolean isSucceed = userService.register(user);
		// 声明跳转页面
		ModelAndView modelAndView = new ModelAndView();
		// 注册是否成功
		if (isSucceed) {// 成功
			// 转发以登录用户
			modelAndView.setViewName("forward:/user/login_submit");
		} else {// 注册失败
			// 返回错误信息
			modelAndView.setViewName(Path.JSP_USER + "/signup");
			modelAndView.addObject("nickname", nickname);
			modelAndView.addObject("username", username);
			modelAndView.addObject("isExist", true);
		}
		// 页面跳转
		return modelAndView;
	}

	/**
	 * 登录用户
	 */
	@RequestMapping("/user/login_submit")
	public ModelAndView loginUser(HttpServletRequest request) {
		// 获取参数
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		// 登录用户
		User user = userService.login(username, password);
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		// 登录是否成功
		if (user == null) {// 登录失败
			// 返回错误信息
			modelAndView.setViewName(Path.JSP_USER + "/login");
			modelAndView.addObject("username", username);
			modelAndView.addObject("isloginFailed", true);
			session.invalidate();
		} else {// 登录成功
			session.setAttribute("loginUser", user);
			// 判断是否有登录前页面
			String prevPage = (String) session.getAttribute(Page.LOGIN_PREV);
			if (prevPage == null) {
				// 没有登录前页面，跳转到主页
				modelAndView.setViewName("redirect:/index");
			} else {
				// 有登录前页面
				modelAndView.setViewName("redirect:" + prevPage);
				session.setAttribute(Page.LOGIN_PREV, null);
			}

		}
		return modelAndView;
	}

	/**
	 * 注销用户账号
	 */
	@RequestMapping("/user/logout")
	@ResponseBody
	public String logoutUser(HttpSession session) {
		session.invalidate();
		return "success";
	}

	/**
	 * 进入编辑个人资料的页面
	 */
	@RequestMapping("/people/{id}/edit")
	public ModelAndView personalZoneEdit(@PathVariable Integer id,
			HttpServletRequest request) {
		// 查询出该id的用户
		User user = userService.findById(id);
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		// 声明页面
		ModelAndView modelAndView = new ModelAndView();

		// 判断用户是否存在且是当前登录用户
		if (user == null || loginUser == null
				|| user.getId() != loginUser.getId()) {
			// 该用户不存在，或未登录，或登录的和编辑的用户不同，不会进入编辑页面
			modelAndView.setViewName("redirect:/index");
		} else {// 可以进入该用户编辑页面
			modelAndView.setViewName(Path.JSP_USER + "/editpersonal");
		}
		return modelAndView;
	}

	/**
	 * 进入用户个人中心
	 */
	@RequestMapping("/people/{zoneUserId}")
	public ModelAndView personalZone(@PathVariable Integer zoneUserId,
			HttpServletRequest request) {
		// 查询出该id的用户
		User zoneUser = userService.findById(zoneUserId);

		// 声明页面
		ModelAndView mv = new ModelAndView();

		// 判断用户是否存在
		if (zoneUser == null) {// 该用户不存在
			mv.setViewName("redirect:/index");
		}
		// 该用户存在,获取登录用户
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		// 添加用户
		mv.addObject("zoneUser", zoneUser);
		// 添加用户栏目动态
		Integer count = 10;
		List<FilmReviewDetail> filmReviewList = userService.findFilmReviewDetailByUser(zoneUser,0,count);
		List<MusicReviewDetail> musicReviewList = userService.findMusicReviewDetailByUser(zoneUser,0,count);
		List<BookReviewDetail> bookReviewList = userService.findBookReviewDetailByUser(zoneUser,0,count);
		List<ActivityNoteDetail> activityNoteList = userService.findActivityNoteDetailByUser(zoneUser,0,count);
		mv.addObject("filmReviewList", filmReviewList);
		mv.addObject("musicReviewList", musicReviewList);
		mv.addObject("bookReviewList", bookReviewList);
		mv.addObject("activityNoteList", activityNoteList);
		// 跳转到的jsp页面
		mv.setViewName(Path.JSP_USER + "/people");
		return mv;
	}

	/**
	 * 保存和更新用户资料
	 * 
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("/user/updateUserProfile")
	public ModelAndView updateUserProfile(User user, HttpServletRequest request)
			throws UnsupportedEncodingException {
		// 参数校验

		// 更新用户
		boolean isSucceed = userService.updateProfile(user);
		// 声明跳转页面
		ModelAndView modelAndView = new ModelAndView();

		// 保存是否成功
		if (isSucceed) {// 成功
			// 刷新页面
			modelAndView.setViewName("forward:/people/" + user.getId()
					+ "/edit");
			// 重新查询登录用户信息
			User loginUser = userService.findById(user.getId());
			request.getSession().setAttribute("loginUser", loginUser);
			modelAndView.addObject("isUpdateSuccess", true);
		} else {// 保存失败
			// 返回错误信息
		}
		// 页面跳转
		return modelAndView;
	}

	/**
	 * 用户上传头像
	 * 
	 * @throws IOException
	 * @throws InterruptedException
	 */
	@RequestMapping("/user/uploadAvatar")
	@ResponseBody
	public String uploadAvator(HttpServletRequest request) throws IOException,
			InterruptedException {
		// 获取上传的图片数据
		String imgStr = request.getParameter("imgStr");
		// 保存路径
		String path = request.getServletContext().getRealPath(
				"upload" + File.separator + "avatar");
		// 判断是否登录
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		if (loginUser == null) {
			// 没有登录用户
			return "fail";
		}
		// 有登录用户，修改其头像信息
		User updatedUser = userService.updateAvatar(loginUser, imgStr, path);
		// 更新登录用户数据
		request.getSession().setAttribute("loginUser", updatedUser);
		return "success";
	}
}
