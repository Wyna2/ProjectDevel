package com.ruby.devel.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ActivityController {

	
	@GetMapping("/activity/mypage")  // 'mypage' 아이콘 선택 시 이동
	public String extend_mypage()
	{
		return "/activity/mypage";  // activity/마이페이지
	}
	
	@GetMapping("/activity")  // 'activity' 아이콘 선택 시 기본 페이지(모아보기) 이동
	public String extend_home()
	{
		return "a/activity/main";  // a/activity/모아보기
	}
	
	@GetMapping("/activity/seeWrite")  // '작성글목록' 메뉴 클릭시 이동
	public String extend_write()
	{
		return "a/activity/seeWrite";  // a/activity/작성글 목록
	}
	
	@GetMapping("/activity/seeMarketplace")  // '거래목록' 메뉴 클릭시 이동
	public String extend_market()
	{
		return "a/activity/seeMarketplace";  // a/activity/거래 목록
	}	
	
	@GetMapping("/activity/seeChallenge")  // '챌린지목록' 메뉴 클릭시 이동
	public String extend_challenge()
	{
		return "a/activity/seeChallenge";  // a/activity/챌린지 목록
	}
	
	@GetMapping("/activity/scrap")  // 'scrap' 아이콘 선택 시 이동
	public String extend_scrap()
	{
		return "a/activity/seeScrap";  // a/activity/스크랩
	}
	
}
