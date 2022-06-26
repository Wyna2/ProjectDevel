package com.ruby.devel.web;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ruby.devel.model.MarketLikeDto;
import com.ruby.devel.service.impl.MarketMapper;


@Controller
public class MarketplaceLikeController {
	
	@Autowired //Market 자동주입
	MarketMapper MPmapper;
			
	//like 이벤트
	@RequestMapping(value = "/marketlike.event", method = { RequestMethod.POST })
	public ModelAndView marketLike(
			@RequestParam("market_place_idx") String market_place_idx,
			@RequestParam("member_idx") String member_idx,
			HttpSession session)
	{
		ModelAndView mview = new ModelAndView();
		
		HashMap<String, String> map = new HashMap<>();
		map.put("market_place_idx", market_place_idx);
		map.put("member_idx", member_idx);
		
		//data 존재하는지 확인(1일 경우 데이타 있음)
		int data = MPmapper.getLikeData(map);
				
		MarketLikeDto dto = new MarketLikeDto();
		dto.setMarket_place_idx(market_place_idx);
		dto.setMember_idx(member_idx);
		
		if(data==0) {
			MPmapper.insertMarketLike(dto);
		} else if(data==1) {
			MPmapper.updateMarketLike(dto);
		}
		
		System.out.println(market_place_idx+","+member_idx);
		
		return mview;
	}
	
}
