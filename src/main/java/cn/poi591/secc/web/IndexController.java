package cn.poi591.secc.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	/**
	 * 主页跳转
	 */
	@RequestMapping(value={"/","/index"})
	public String signUp() {
		return "index";
	}
}
