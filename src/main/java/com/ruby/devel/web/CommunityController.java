package com.ruby.devel.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommunityController {
	
	@GetMapping("/community")  // 메뉴 선택 시 이동하는 기본 페이지
	public String extend_home()
	{
		return "/community/main";  // community/(파일명)
	}
	
}
