package com.ruby.devel.model;

import java.sql.Timestamp;
import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Alias("mp_dto")
public class MarketDto {
	
	private String market_place_idx;
	private String member_idx;
	private String buyer;
	private String seller;
	private String category;
	private String brandname;
	private String subject;
	private String photo; 
	private String original_price;
	private String price;
	private String amount;
	private String color;
	private String content;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm")
	private Timestamp upload_day;
	private String sold_day;
	private String like_count;
	private String region;
	
	
	
}
