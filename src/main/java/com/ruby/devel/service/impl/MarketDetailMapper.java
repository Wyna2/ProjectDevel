package com.ruby.devel.service.impl;

import org.apache.ibatis.annotations.Mapper;
import com.ruby.devel.model.MarketDto;

@Mapper
public interface MarketDetailMapper {

	//마켓디테일 거래완료처리시 'sold_day' update
	public void updateSoldout(MarketDto dto);
	
	//마켓디테일 삭제버튼 delete
	public void deleteMarket(String market_place_idx);

}
