package com.ruby.devel.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("mplike_dto")
public class MarketLikeDto {
	
	private String market_like_idx;
	private String market_place_idx;
	private String member_idx;
	private String like_count;
	
}