package com.ruby.devel.service.impl;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.ruby.devel.model.MarketDto;
import com.ruby.devel.model.MarketLikeDto;

@Mapper
public interface MarketMapper {

	public int getTotalCount();
	public void insertMarket(MarketDto dto);
	public List<MarketDto> getAllDatas();
	public List<MarketDto> getList(HashMap<String, Integer> map);
	public MarketDto getData(String market_place_idx);
	public void deleteMarket(String market_place_idx);
	
	//like 관련 mapper
	public void insertMarketLike(MarketLikeDto dto);
	public void updateMarketLike(MarketLikeDto dto);
	public List<MarketLikeDto> getLikeDatas();
	public int getLikeData(HashMap<String, String> map);
		
	//검색창 검색 관련 mapper
	public List<MarketDto> SearchGetList(HashMap<String, Object> map);
	public int getSearchCount(String SearchText);
	
	//사이드 메뉴 검색 관련 mapper
	public int getSideSearchCount(String subtitle,String colorradio,String marketprice);
	public List<MarketDto> SideSearchGetList(HashMap<String, Object> map);
	
	//거래가능 체크박스 관련 mapper
	public int getTradeCount();
	public List<MarketDto> getTradeList(HashMap<String, Integer> map);
	
	//거래가능 체크박스 (검색창 활용 이후)
	public int getTradeSearchCount(String SearchText);
	public List<MarketDto> getTradeSearchList(HashMap<String, Object> map);
	
	//거래가능 체크박스 (사이드메뉴 검색 활용 이후)
	public int getTradeSideCount(String subtitle,String colorradio,String marketprice);
	public List<MarketDto> getTradeSideList(HashMap<String, Object> map);
	
}
