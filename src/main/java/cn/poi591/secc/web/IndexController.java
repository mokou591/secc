package cn.poi591.secc.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.poi591.secc.dto.SearchResult;
import cn.poi591.secc.entity.Book;
import cn.poi591.secc.entity.Film;
import cn.poi591.secc.entity.Music;
import cn.poi591.secc.service.SearchService;
import cn.poi591.secc.util.MyUtil;

@Controller
public class IndexController {

	@Autowired
	private SearchService searchService;

	/**
	 * 根据关键词搜索
	 * 
	 * @return
	 */
	@RequestMapping("/search/{type}")
	public ModelAndView search(@PathVariable String type,String keywords) {
		// 获取关键词集合
		List<String> keywordList = MyUtil.getKeywordList(keywords);
		// 结果集
		List<SearchResult> resultList = new ArrayList<>();
		// 参数检查
		if (keywordList.size() > 0) {
			// 根据关键词查询
			resultList = searchService.search(type,keywordList,20);
		}
		// 跳转页面
		ModelAndView mv = new ModelAndView("search_result");
		mv.addObject("type", type);
		mv.addObject("keywords", keywords);
		mv.addObject("resultList", resultList);
		mv.addObject("resultCount", resultList.size());
		mv.addObject("keywordList", keywordList);
		return mv;
	}

	/**
	 * 主页跳转
	 */
	@RequestMapping(value = { "/", "/index" })
	public ModelAndView showIndex() {
		// 查询新品速递内容
		Integer topCount = 8;
		String colDesc = "hotnew";
		List<Book> hotBookList = searchService.findBookByColumnDescription(topCount,colDesc);
		List<Music> hotMusicList = searchService.findMusicByColumnDescription(topCount,colDesc);
		List<Film> hotFilmList = searchService.findFilmByColumnDescription(topCount,colDesc);
		// 向页面储存
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("hotBookList",hotBookList);
		mv.addObject("hotMusicList",hotMusicList);
		mv.addObject("hotFilmList",hotFilmList);
		return mv;
	}
}
