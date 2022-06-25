package com.ruby.devel.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.ruby.devel.model.MarketDto;
import com.ruby.devel.service.impl.MarketDetailMapper;
import com.ruby.devel.service.impl.MarketMapper;
import com.ruby.devel.service.impl.MemberMapper;


@Controller
public class MarketplaceDetailController {
	
	@Autowired //Market 자동주입
	MarketMapper MPmapper;
	
	@Autowired //MarketDetail 자동주입
	MarketDetailMapper MPDmapper;
	
	@Autowired //Member 자동주입
	MemberMapper Mmapper;
	
	//거래완료처리시 sold_day update
	@GetMapping("/marketplace/soldout")
	public String updateSoldout(
			@ModelAttribute MarketDto dto,
			HttpSession session)
	{
		//세션에서 얻은 userKey dto에 저장
		String key = (String)session.getAttribute("userKey");
		dto.setMember_idx(key);
		
		MPDmapper.updateSoldout(dto);
		
		System.out.println(key);
		
		//완료 후 메인페이지 다시 이동
		return "redirect:market_main";
	}
	
}
