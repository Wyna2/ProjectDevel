package com.ruby.devel.service;

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
	
}
