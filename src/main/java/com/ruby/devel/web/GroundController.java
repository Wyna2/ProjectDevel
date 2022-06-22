package com.ruby.devel.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class GroundController {
	
	@GetMapping("/ground")  // 메뉴 선택 시 이동하는 기본 페이지
	public String ground_home()
	{
		return "/ground/ground_main";  // /ground/(파일명)
	}
	
	@GetMapping("/ground/crewenroll")  // 크루 등록 페이지
	public String ground_crewenroll()
	{
		return "/ground/ground_crewEnrollForm";
	}
	
	@GetMapping("/ground/mycrew")  // 나의 크루 페이지
	public String ground_mycrew()
	{
		return "/ground/ground_myCrew";
	}
	
	
}
