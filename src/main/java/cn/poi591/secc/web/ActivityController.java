package cn.poi591.secc.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.poi591.secc.constant.Note;
import cn.poi591.secc.constant.Page;
import cn.poi591.secc.constant.Path;
import cn.poi591.secc.dto.ActivityNoteDetail;
import cn.poi591.secc.dto.ActivityNoteReplyDetail;
import cn.poi591.secc.dto.Paging;
import cn.poi591.secc.entity.Activity;
import cn.poi591.secc.entity.ActivityNote;
import cn.poi591.secc.entity.ActivityNoteReply;
import cn.poi591.secc.entity.User;
import cn.poi591.secc.service.impl.ActivityServiceImpl;

@Controller
@RequestMapping("/activity")
public class ActivityController {
	@Autowired
	private ActivityServiceImpl activityService;

	/**
	 * 跳转至户外活动栏目主页
	 * 
	 * @return
	 */
	@RequestMapping(value = { "", "/index" })
	public ModelAndView activityIndex() {
		// 热门活动
		List<Activity> hotActivityList = activityService.findActivityRandom(4);
		// 各种活动
		List<Activity> musicList = activityService.findActivityListByGenre(
				"音乐", 0, 8);
		List<Activity> partyList = activityService.findActivityListByGenre(
				"聚会", 0, 8);
		List<Activity> lectureList = activityService.findActivityListByGenre(
				"讲座", 0, 8);
		List<Activity> exhiList = activityService.findActivityListByGenre("展览",
				0, 8);
		// 热门活动讨论
		List<ActivityNoteDetail> hotNoteDetailList = activityService
				.findActivityNoteDetailRandom(5);
		// 存入参数，页面跳转
		ModelAndView mv = new ModelAndView(Path.JSP_ACTIVITY
				+ "/index_activity");
		mv.addObject("hotActivityList", hotActivityList);
		mv.addObject("musicList", musicList);
		mv.addObject("partyList", partyList);
		mv.addObject("lectureList", lectureList);
		mv.addObject("exhiList", exhiList);
		mv.addObject("hotNoteDetailList", hotNoteDetailList);
		return mv;
	}

	/**
	 * 跳转到活动的所有活动讨论页面
	 * 
	 * @return
	 */
	@RequestMapping("/{activityId}/note/all/{page}")
	public ModelAndView activityAllNote(@PathVariable Integer activityId,
			@PathVariable Integer page) {
		// 访问失败的跳转页面
		ModelAndView mv = new ModelAndView("/index");
		// 活动对象
		Activity mainActivity = activityService.findActivityById(activityId);
		// 查询活动讨论总数
		Integer activityNoteCount = activityService
				.getActivityNoteCount(mainActivity);
		// 分页所需参数
		final Integer PAGE_ITEM_COUNT = Note.PAGE_ITEM_COUNT;
		int maxPage = (int) Math.ceil(activityNoteCount * 1.0f
				/ PAGE_ITEM_COUNT);
		// 判断页码是否正确
		if (maxPage != 0 && (page < 1 || page > maxPage)) {
			return mv;
		}
		// 查询当页、一页数量的活动讨论
		Integer start = (page - 1) * PAGE_ITEM_COUNT;
		List<ActivityNoteDetail> activityNoteList = activityService
				.getActivityNoteDetailNatural(mainActivity, start,
						PAGE_ITEM_COUNT);
		// 分页模型
		Paging paging = new Paging();
		paging.setCurrent(page);
		paging.setMax(maxPage);
		paging.setMin(1);
		paging.setHasPrev(page == 1 ? false : true);
		paging.setHasNext(page == maxPage ? false : true);
		paging.generatePageList();
		// 向页面添加参数
		mv.addObject("mainActivity", mainActivity);
		mv.addObject("noteList", activityNoteList);
		mv.addObject("noteCount", activityNoteCount);
		mv.addObject("paging", paging);
		// 跳转到全部活动讨论页面
		mv.setViewName(Path.JSP_ACTIVITY + "/note_all");
		return mv;
	}
	
	/**
	 * 活动讨论，处理提交的回复。
	 * @param noteId
	 * @return
	 */
	@RequestMapping("/note/{noteId}/reply_submit")
	public String activityNoteReply(@PathVariable Integer noteId,ActivityNoteReply reply) {
		//参数检查
		ActivityNote note = activityService.findActivityNoteById(noteId);
		// 保存回复
		activityService.addActivityNoteReply(reply);
		// 转发到单篇讨论的页面
		return "forward:"+Path.JSP_ACTIVITY_NOTE+"/"+noteId;
	}
	
	/**
	 * 展示单篇活动讨论。
	 * 
	 * @param activityId
	 * @param noteId
	 * @return
	 */
	@RequestMapping("/note/{noteId}")
	public ModelAndView showActivityNote(@PathVariable Integer noteId) {
		//参数检查
		ActivityNote note = activityService.findActivityNoteById(noteId);
		// 查询出详细活动讨论
		ActivityNoteDetail noteDetail = activityService
				.findActivityNoteDetailById(noteId);
		// 查询活动回复列表
		List<ActivityNoteReplyDetail> replyDetailList =  activityService.findNoteReplyDetailNatural(note,0,10);
		// 跳转页面
		ModelAndView mv = new ModelAndView(Path.JSP_ACTIVITY + "/note_show");
		mv.addObject("note", noteDetail);
		mv.addObject("replyDetailList", replyDetailList);
		return mv;
	}

	/**
	 * 提交新的活动讨论
	 */
	@RequestMapping("/note_submit")
	public ModelAndView noteSubmit(ActivityNote activityNote) {
		// 参数判断和转换
		if (activityNote.getIsPrivate() == null) {
			activityNote.setIsPrivate(false);
		}
		// 调用服务储存活动讨论
		activityService.addActivityNote(activityNote);
		// 向页面储存参数，页面跳转
		ModelAndView mv = new ModelAndView(Path.JSP_ACTIVITY
				+ "/success/activity_note_submit");
		mv.addObject("activityNote", activityNote);
		return mv;
	}

	/**
	 * 跳转到创建新活动讨论的页面
	 */
	@RequestMapping("/{id}/note_new")
	public ModelAndView newNote(@PathVariable Integer id, HttpSession session) {
		Activity mainActivity = activityService.findActivityById(id);
		// 判断是否有登录用户
		User loginUser = (User) session.getAttribute("loginUser");
		// 向页面储存参数，页面跳转
		ModelAndView mv = new ModelAndView();
		if (loginUser == null) {
			// 没有登录，跳转到登录
			mv.setViewName(Path.JSP_USER + "/login");
			// 存入登录前页面，登录后可以跳转回来
			session.setAttribute("prevPage", "/activity/" + id);
		} else {
			// 有登录用户，跳转到创建新活动讨论页面
			mv.setViewName(Path.JSP_ACTIVITY + "/note_new");
		}
		// 向页面储存参数，页面跳转
		mv.addObject("mainActivity", mainActivity);
		return mv;
	}

	/**
	 * 活动的报名或取消报名。 <br/>
	 * choice: partake / partake_cancel
	 * 
	 * @return
	 */
	@RequestMapping("/{activityId}/{choice}")
	public String partakeActivity(@PathVariable Integer activityId,
			@PathVariable String choice, HttpSession session) {
		// 判断登录用户是否存在
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser == null) {
			// 存入登录前页面
			session.setAttribute(Page.LOGIN_PREV, Path.JSP_ACTIVITY + "/"
					+ activityId);
			// 跳转到登录
			return Path.JSP_USER + "/login";
		}
		//查询活动对象
		Activity activity = activityService.findActivityById(activityId);
		//根据请求报名或取消
		if (choice.equals("partake")) {
			//报名
			activityService.addPartake(activity, loginUser);
		} else if(choice.equals("partake_cancel")){
			//取消报名
			activityService.deletePartake(activity, loginUser);
		}
		// 转发到活动页
		return "forward:" + Path.JSP_ACTIVITY + "/" + activity.getId();
	}

	/**
	 * 活动展示页面
	 */
	@RequestMapping("/{id}")
	public ModelAndView activityShow(@PathVariable Integer id,
			HttpSession session) {
		/**
		 * 页面所需的参数：活动、活动讨论、登录用户是否有参加、活动参与人数
		 */
		// 活动
		Activity mainActivity = activityService.findActivityById(id);
		// 活动讨论
		List<ActivityNoteDetail> noteList = activityService
				.getActivityNoteDetailNatural(mainActivity, 0, 10);
		Integer noteListLength = noteList.size();
		// 登录用户是否有参加
		User loginUser = (User) session.getAttribute("loginUser");
		Boolean hasPartake = Boolean.FALSE;
		if (loginUser != null) {
			hasPartake = activityService.checkHasPartake(mainActivity,
					loginUser);
		}
		//活动参与人数
		Integer partakeCount = activityService.getActivityPartakeCount(mainActivity);
		/**
		 * 
		 */
		// 存入页面
		ModelAndView mv = new ModelAndView(Path.JSP_ACTIVITY + "/activity_show");
		mv.addObject("mainActivity", mainActivity);
		mv.addObject("noteList", noteList);
		mv.addObject("noteListLength", noteListLength);
		mv.addObject("hasPartake", hasPartake);
		mv.addObject("partakeCount", partakeCount);
		return mv;
	}

	/**
	 * 处理提交的新活动参数
	 * 
	 * @return 成功提交页面
	 */
	@RequestMapping("/submit")
	public ModelAndView activitySubmit(Activity activity) {
		// 检查参数

		// 存入数据库
		activityService.add(activity);
		// 重新查出，存入页面
		ModelAndView mv = new ModelAndView(Path.JSP_ACTIVITY
				+ "/success/activity_submit");
		mv.addObject("mainActivity", activity);
		return mv;
	}

	/**
	 * 跳转到添加新活动的页面
	 */
	@RequestMapping("/new")
	public String newActivity() {
		return Path.JSP_ACTIVITY + "/activity_new";
	}
}
