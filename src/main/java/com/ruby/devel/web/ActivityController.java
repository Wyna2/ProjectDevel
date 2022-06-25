package com.ruby.devel.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ruby.devel.model.MarketDto;
import com.ruby.devel.service.impl.ActivityMapper;
import com.ruby.devel.service.impl.MemberMapper;

@Controller
public class ActivityController {
	
	@Autowired //Member 자동주입
	MemberMapper Mmapper;
	
	@Autowired //Activity 자동주입
	ActivityMapper Amapper;
		
	
	@GetMapping("/activity")  // 'activity' 아이콘 선택 시 기본 페이지(모아보기) 이동
	public ModelAndView activity_home(
			@SessionAttribute String userKey)
	{
		ModelAndView mview = new ModelAndView();
		
		//나의거래목록 dto 얻기
		List<MarketDto> mplist = Amapper.getMarketDatas(userKey);
		mview.addObject("mplist", mplist);
		
		
		
		
		//포워딩
		mview.setViewName("a/activity/activity_main");
		
		//System.out.println(userKey);
		//System.out.println(mplist);
		return mview;  // /a/activity/(파일명)
	}
	
	
	@GetMapping("/activity/mycommunity")  // 내가 커뮤니티에 작성 한 글을 모아보는 페이지
	public String activity_write()
	{
		return "a/activity/activity_myCommunity";  
	}
	
	
	@GetMapping("/activity/mymarketplace")  // 나의 중고장터 거래목록 페이지
	public ModelAndView activity_market(
			@SessionAttribute String userKey)
	{
		ModelAndView mview = new ModelAndView();
		
		//나의거래목록 dto 얻기
		List<MarketDto> mplist = Amapper.getMarketDatas(userKey);
		mview.addObject("mplist", mplist);

		//포워딩
		mview.setViewName("a/activity/activity_myMarketplace");

		return mview;  // /a/activity/(파일명)
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
