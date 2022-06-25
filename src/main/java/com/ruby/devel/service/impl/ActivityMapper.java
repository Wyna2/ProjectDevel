package com.ruby.devel.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ruby.devel.model.MarketDto;

@Mapper
public interface ActivityMapper {

	//나의거래목록
	public List<MarketDto> getMarketDatas(String userKey);
	

}
