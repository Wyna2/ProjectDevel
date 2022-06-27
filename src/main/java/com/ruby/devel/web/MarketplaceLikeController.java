package com.ruby.devel.web;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ruby.devel.model.MarketLikeDto;
import com.ruby.devel.service.impl.MarketMapper;


@Controller
public class MarketplaceLikeController {
	
	@Autowired //Market 자동주입
	MarketMapper MPmapper;
			
	//like 이벤트..main
	@PostMapping("/marketplace/marketlike.event")
	public ModelAndView marketLike(
			@RequestParam(value="market_place_idx", required=false) String market_place_idx,
			@RequestParam(value="member_idx", required=false) String member_idx,
			@RequestParam(value="like_count", required=false) String like_count,
			HttpSession session)
	{
		ModelAndView mview = new ModelAndView();
		
		HashMap<String, String> map = new HashMap<>();
		map.put("market_place_idx", market_place_idx);
		map.put("member_idx", member_idx);
		map.put("like_count", like_count);
		
		//data 존재하는지 확인(1일 경우 데이타 있음)
		int data = MPmapper.getLikeData(map);
				
		MarketLikeDto dto = new MarketLikeDto();
		dto.setMarket_place_idx(market_place_idx);
		dto.setMember_idx(member_idx);
		dto.setLike_count(like_count);
		
		if(data==0) {
			MPmapper.insertMarketLike(dto);
			System.out.println("insert");
		} else if(data==1) {
			MPmapper.updateMarketLike(dto);
			System.out.println("update");
		}
		
		System.out.println("market_place_idx: "+market_place_idx+", member_idx: "+member_idx);
		System.out.println("dto: "+dto);
		System.out.println("map: "+map);
		
		return mview;
	}
	
	
	//like 이벤트..datail
	@PostMapping("/marketplace/MarketLikeDetail.event")
	public ModelAndView MarketLikeDetail(
			@RequestParam(value="market_place_idx", required=false) String market_place_idx,
			@RequestParam(value="member_idx", required=false) String member_idx,
			@RequestParam(value="like_count", required=false) String like_count,
			HttpSession session)
	{
		System.out.println("확인");
		
		ModelAndView mview = new ModelAndView();
		
		HashMap<String, String> map = new HashMap<>();
		map.put("market_place_idx", market_place_idx);
		map.put("member_idx", member_idx);
		map.put("like_count", like_count);
		
		//data 존재하는지 확인(1일 경우 데이타 있음)
		int data = MPmapper.getLikeData(map);
				
		MarketLikeDto dto = new MarketLikeDto();
		dto.setMarket_place_idx(market_place_idx);
		dto.setMember_idx(member_idx);
		dto.setLike_count(like_count);
		
		if(data==0) {
			MPmapper.insertMarketLike(dto);
			System.out.println("insert");
		} else if(data==1) {
			MPmapper.updateMarketLike(dto);
			System.out.println("update");
		}
		
		System.out.println("market_place_idx: "+market_place_idx+", member_idx: "+member_idx);
		System.out.println("map: "+map);
			
		return mview;
	}
	
}
