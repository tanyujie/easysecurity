package org.easymis.easysecurity.controller;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@Api(tags = "EasySecurity测试首页加载API")
@Controller
public class IndexController {

	@ApiOperation(value = "EasySecurity测试首页", notes = "", produces = MediaType.TEXT_HTML_VALUE)
	@RequestMapping(value = { "/index.html", "/index" }, method = { RequestMethod.GET, RequestMethod.POST })
	public String index(Model model) throws Exception {
		System.out.println("EasySecurity测试首页!!!");
		model.addAttribute("userId", "test001");
		return "/home";
	}

	@ApiOperation(value = "webSocket测试首页", notes = "", produces = MediaType.TEXT_HTML_VALUE)
	@RequestMapping(value = { "/webSocket.html", "/webSocket" }, method = { RequestMethod.GET, RequestMethod.POST })
	public String webSocket(Model model) throws Exception {
		System.out.println("webSocket测试首页!!!");
		model.addAttribute("userId", "test001");
		return "/webSocket";
	}
}
