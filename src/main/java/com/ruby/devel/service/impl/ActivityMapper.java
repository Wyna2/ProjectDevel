package com.ruby.devel.service.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ruby.devel.model.CommunityDto;
import com.ruby.devel.model.MarketDto;

@Mapper
public interface ActivityMapper {

	//나의작성목록
	public int getWriteCount(String userKey);
	public List<CommunityDto> getWritePageDatas(HashMap<String, Object> map);
	public List<CommunityDto> getWriteDatas(String userKey);
	public void getWriteDelete(String community_idx);
	
	//나의거래목록
	public List<MarketDto> getMarketDatas(String userKey);
	public List<MarketDto> getMarketSoldDatas(String userKey);
	public List<MarketDto> getMarketNotSoldDatas(String userKey);
	
	//스크랩
	public List<MarketDto> ScrapMarketDatas(String userKey);
	public List<CommunityDto> ScrapWriteDatas(HashMap<String, Object> map);
	public int getScrapWriteCount(String userKey);
}
