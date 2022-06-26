package com.ruby.devel.service.impl;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.ruby.devel.model.MarketDto;

@Mapper
public interface MarketMapper {

	public int getTotalCount();
	public void insertMarket(MarketDto dto);
	public List<MarketDto> getAllDatas();
	public List<MarketDto> getList(HashMap<String, Integer> map);
	public MarketDto getData(String market_place_idx);
	public void deleteMarket(String market_place_idx);
	
	
	//검색창 검색 관련 mapper
	public List<MarketDto> SearchGetList(HashMap<String, Object> map);
	public int getSearchCount(String SearchText);
	
	//사이드 메뉴 검색 관련 mapper
	public int getSideSearchCount(String subtitle,String colorradio,String marketprice);
	public List<MarketDto> SideSearchGetList(HashMap<String, Object> map);
}
