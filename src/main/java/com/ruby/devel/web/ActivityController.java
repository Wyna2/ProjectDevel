package com.ruby.devel.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ruby.devel.service.impl.MemberMapper;

@Controller
public class ActivityController {
	
	@Autowired
	MemberMapper Mmapper;

	@GetMapping("/activity")  // 'activity' 아이콘 선택 시 기본 페이지(모아보기) 이동
	public String activity_home()
	{
		return "a/activity/activity_main";  // /a/activity/(파일명)
	}
	
	
	//mypage
	@GetMapping("/activity/mypage")
	public String activity_mypage(Model model,
			@RequestParam String id)
	{
		
		
		return "/activity/activity_myInfo";
	}
	
	//mypage update
	
	
	
	
	
	
	@GetMapping("/activity/mycommunity")  // 내가 커뮤니티에 작성 한 글을 모아보는 페이지
	public String activity_write()
	{
		return "a/activity/activity_myCommunity";  
	}
	
	@GetMapping("/activity/mymarketplace")  // 나의 중고장터 거래목록 페이지
	public String activity_market()
	{
		return "a/activity/activity_myMarketplace"; 
	}	
	
	@GetMapping("/activity/mychallenge")  // 내가 도전한 or 도전중인 챌린지 모아보기 페이지
	public String activity_challenge()
	{
		return "a/activity/activity_myChallenge";  
	}
	
	@GetMapping("/activity/myscrap")  // 중고장터의 찜하기 or 커뮤니티의 스크랩 모아보기 페이지
	public String activity_scrap()
	{
		return "a/activity/activity_myScrap"; 
	}
	
}
