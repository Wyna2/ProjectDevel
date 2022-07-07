package com.ruby.devel.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ruby.devel.model.CommunityDto;
import com.ruby.devel.model.MarketDto;
import com.ruby.devel.model.TeamDto;
import com.ruby.devel.service.impl.CommunityMapper;
import com.ruby.devel.service.impl.MarketMapper;
import com.ruby.devel.service.impl.MemberMapper;
import com.ruby.devel.service.impl.TeamMapper;

@Controller
public class HomeController {
	
	@Autowired
	CommunityMapper Cmapper;
	
	@Autowired
	MemberMapper Mmapper;
	
	@Autowired
	TeamMapper tmapper;
	
	@Autowired
	MarketMapper MPmapper;
	
	@GetMapping(value = {"/", "/home", "/main"})  // 메뉴 선택 시 이동하는 기본 페이지
	public ModelAndView home(@ModelAttribute TeamDto crew_dto, Model model,
			@ModelAttribute MarketDto market_dto)
	{
		ModelAndView mview=new ModelAndView();
		//커뮤니티 리스트 출력
		List<CommunityDto>  homelist = Cmapper.getHomeList();
	
		for(CommunityDto c:homelist)
		{
			String nickName = Mmapper.getNickname(c.getMember_idx());
			c.setWriter(nickName);
			String teamName = Mmapper.getMemberTeamName(c.getMember_idx());
			c.setTeam_name(teamName);
			String teamColor = Mmapper.getMemberTeamColor(c.getMember_idx());
			c.setTeam_color(teamColor);
		} 
		
	    String nickName=Mmapper.getNickname(null);
		
		mview.addObject("homelist", homelist);
		mview.addObject("nickName", nickName); 
		
		//크루 리스트 출력
		List<TeamDto> crewlist = tmapper.getCrewPointDatas();
		model.addAttribute("crewlist", crewlist);
		
		//중고장터 리스트 출력
		List<MarketDto> marketlist = MPmapper.getAllDatas();
		model.addAttribute("marketlist", marketlist);
		
		mview.setViewName("/layout/home");
		return mview;  // 수정 금지
	}

}
