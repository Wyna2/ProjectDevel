package com.ruby.devel.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	@GetMapping(value = {"/", "/home", "/main"})  // 메뉴 선택 시 이동하는 기본 페이지
	public String home()
	{
		return "/layout/home";  // 수정 금지
	}

}
